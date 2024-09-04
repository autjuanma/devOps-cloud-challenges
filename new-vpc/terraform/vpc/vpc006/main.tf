# Configure the AWS Provider
provider "aws" {
  region = var.aws_region
}

# Create a VPC module
module "vpc" {
  source = "./modules/vpc"

  aws_region = var.aws_region
  vpc_cidr_block = var.vpc_cidr_block
}

# Create a subnets module
module "subnets" {
  source = "./modules/subnets"

  aws_region = var.aws_region
  vpc_id = module.vpc.vpc_id
  subnet_cidr_block = var.subnet_cidr_block
}

# Create a security group
resource "aws_security_group" "secure_sg" {
  name        = "Secure SG"
  description = "Security group with restrictive rules"
  vpc_id      = module.vpc.vpc_id

  # Inbound rule for SSH
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Outbound rule for all traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Create a network ACL
resource "aws_network_acl" "secure_nacl" {
  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.subnets.subnet_ids

  # Inbound rule for SSH
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    action      = "allow"
  }

  # Outbound rule for all traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    action      = "allow"
  }
}