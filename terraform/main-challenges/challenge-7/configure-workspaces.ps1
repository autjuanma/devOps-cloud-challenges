# Initialize Terraform
terraform init

# Create and apply configuration for dev workspace
terraform workspace new dev
terraform apply -var-file=dev/terraform.tfvars -auto-approve

# Create and apply configuration for prod workspace
terraform workspace new prod
terraform apply -var-file=prod/terraform.tfvars -auto-approve