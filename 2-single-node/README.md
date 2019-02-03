# Single Node Network

An example of creating a single L2 network on one node, containing 
2 network namespaces (containers), connected via a bridge.

![Diagram](./diagram.png)

Create the VM (container-networking):

```
vagrant up
```

SSH to the node (VM) and run the setup script to create the network namespaces connected via bridge: 

```
vagrant ssh container-networking-[12]
cd /vagrant
./setup.sh
```

To test the connectivity between the containers within the node, run the following:

```
./test.sh
```

To teardown the network:

```
./teardown.sh
```

To test the entire flow, i.e. setup - run the tests - teardown, from your machine, run the following:

```
make
```
