#!/bin/bash

# Set the working directory to the infrastructure directory
cd infrastructure

# Initialize Terraform
terraform init

# Validate the Terraform configuration
terraform validate

# Deploy the infrastructure
terraform apply -auto-approve

# Output the EC2 instance public IP and RDS instance endpoint
echo "EC2 instance public IP: $(terraform output ec2_instance_public_ip)"
echo "RDS instance endpoint: $(terraform output rds_instance_endpoint)"