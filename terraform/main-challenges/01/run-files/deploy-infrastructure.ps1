# Set the working directory to the infrastructure directory
Set-Location -Path ./infrastructure

# Initialize Terraform
terraform init

# Validate the Terraform configuration
terraform validate

# Deploy the infrastructure
terraform apply -auto-approve

# Output the EC2 instance public IP and RDS instance endpoint
Write-Host "EC2 instance public IP: $(terraform output ec2_instance_public_ip)"
Write-Host "RDS instance endpoint: $(terraform output rds_instance_endpoint)"