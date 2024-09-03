# main.tf
provider "aws" {
  region = "us-west-2"
}

# Create a workspace named 'dev'
resource "terraform_workspace" "dev" {
  name = "dev"
}

# Create a workspace named 'prod'
resource "terraform_workspace" "prod" {
  name = "prod"
}

# Provision the infrastructure in both workspaces
resource "aws_instance" "example" {
  ami           = var.ami
  instance_type = var.instance_type

  # Use the 'environment' variable to customize the instance name
  tags = {
    Name        = "example-${var.environment}"
    Environment = var.environment
  }
}