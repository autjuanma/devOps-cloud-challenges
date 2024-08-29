#!/bin/bash

# Create a taint on one of the nodes in your cluster
kubectl taint nodes <node_name> app=web:NoSchedule