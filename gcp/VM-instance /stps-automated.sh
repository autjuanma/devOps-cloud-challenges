#!/bin/bash

# Set the zone variable
ZONE="us-west1-a"

# Initialize Terraform
terraform init

# Apply Terraform configuration
terraform apply

# Update labels using gcloud CLI
gcloud compute instances update instance-1 --update-labels app=db --zone $ZONE
gcloud compute instances update instance-1 --remove-labels env --zone $ZONE