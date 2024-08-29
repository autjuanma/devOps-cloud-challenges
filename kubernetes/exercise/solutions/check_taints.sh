#!/bin/bash

# Check if one of the nodes in the cluster has taints
kubectl get nodes -o jsonpath='{.items[*].spec.taints}'