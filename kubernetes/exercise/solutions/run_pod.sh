#!/bin/bash

# Create a pod that tolerates the taint
kubectl run --generator=run-pod/v1 tolerating-pod --image=busybox --tolerations="key=app,operator=Exists,effect=NoSchedule"