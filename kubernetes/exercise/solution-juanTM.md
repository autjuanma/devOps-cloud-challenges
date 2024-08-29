## solution [JuanTM]
## Objective 1: Check if one of the nodes in the cluster has taints

go to check_taints.sh file


## Objective 2: Create a taint on one of the nodes in your cluster

Create a new file named create_taint.sh with the following content:

# note

The taint app=web:NoSchedule means that any pod that doesn't tolerate this taint will not be scheduled on this node


## Objective 2.2: Verify it was applied

go to verify_taint.sh file


## Objective 3: Run a Pod that will be able to run on the node on which you applied the taint

go to run_pod.sh file


## 4 E2E --> call scripts 
To automate the entire exercise, you can create a master script named taints_101.sh that runs all the above scripts in sequence: