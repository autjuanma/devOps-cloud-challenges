#!/bin/bash

# Check if one of the nodes in the cluster has taints
./check_taints.sh

# Create a taint on one of the nodes in your cluster
./create_taint.sh

# Verify the taint was applied
./verify_taint.sh

# Run a Pod that will be able to run on the node on which you applied the taint
./run_pod.sh