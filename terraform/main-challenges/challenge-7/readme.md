## Challenge 7: Terraform Workspaces 📁
-------------------------------------

Create a Terraform configuration that uses workspaces to manage multiple environments (e.g. dev, prod). The configuration should:

* Create a workspace named `dev`
* Create a workspace named `prod`
* Provision the infrastructure created in Challenge 1 in both workspaces
* Use input variables to customize the infrastructure for each workspace


### run

terraform init: Initializes the Terraform working directory.
terraform workspace new dev: Creates a new workspace named dev.
terraform apply -var-file=dev/terraform.tfvars -auto-approve: Applies the Terraform configuration for the dev

chmod +x apply-config.sh
./apply-config.sh


