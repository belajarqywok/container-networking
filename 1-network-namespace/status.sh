#!/bin/bash -e 

. env.sh

echo "========================================================================"
echo "Namespace"
echo "========================================================================"
ip netns list
echo
echo "========================================================================"
echo "node - ip addr"
echo "========================================================================"
sudo ip addr
echo
echo "========================================================================"
echo "$CON namespace - ip addr"
echo "========================================================================"
sudo ip netns exec $CON ip addr
echo
echo "========================================================================"
echo "node - ip route"
echo "========================================================================"
sudo ip route
echo
echo "========================================================================"
echo "$CON namespace - ip route"
echo "========================================================================"
sudo ip netns exec $CON ip route
echo
