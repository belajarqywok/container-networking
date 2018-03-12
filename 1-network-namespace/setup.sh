#!/bin/bash -e 

. env.sh

echo "Creating the namespace"
sudo ip netns add $CON

echo "Creating the veth pair"
sudo ip link add veth1 type veth peer name veth2

echo "Adding one end of the veth pair to the namespaces"
sudo ip link set veth2 netns $CON

echo "Configuring the interface in the container with an IP address"
sudo ip netns exec $CON ip addr add $NAMESPACE_IP/32 dev veth2

echo "Enabling the interface inside the container"
sudo ip netns exec $CON ip link set dev veth2 up

echo "Enabling the interface on the node"
sudo ip link set dev veth1 up

echo "Setting the loopback interface in the container"
sudo ip netns exec $CON ip link set lo up

echo "Setting the routes on the node"
sudo ip route add $NAMESPACE_IP/32 dev veth1

echo "Settng the routes in the container"
sudo ip netns exec $CON ip route add $SUBNET dev veth2
sudo ip netns exec $CON ip route add default via $NODE_IP dev veth2
