#!/bin/bash

# Verify the taint was applied
kubectl describe node <node_name> | grep Taints