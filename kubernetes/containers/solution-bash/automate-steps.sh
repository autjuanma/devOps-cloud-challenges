#!/bin/bash

# Run Pod with a web service (httpd)
kubectl run web --image registry.redhat.io/rhscl/httpd-24-rhel7

# Verify the web service is running
kubectl exec web -- ps

# Check how many restarts the pod has performed
restarts_before=$(kubectl get po web -o jsonpath='{.status.containerStatuses[0].restartCount}')

# Kill the web service process
kubectl exec web -- kill 1

# Check how many restarts the pod has performed after killing the process
restarts_after=$(kubectl get po web -o jsonpath='{.status.containerStatuses[0].restartCount}')

# Verify again the web service is running
kubectl exec web -- ps

# Print the results
echo "Restarts before killing the process: $restarts_before"
echo "Restarts after killing the process: $restarts_after"