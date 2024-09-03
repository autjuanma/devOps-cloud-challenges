# Configure the AWS provider
provider "aws" {
  region = "us-west-2"
}

# Import the modules
module "vpc" {
  source = file("./vpc.tf")
}

module "ec2_instance" {
  source = file("./ec2_instance.tf")
  vpc_id = module.vpc.vpc_id
  subnet_id = module.vpc.public_subnet_id
}

module "rds_instance" {
  source = file("./rds_instance.tf")
  vpc_id = module.vpc.vpc_id
  subnet_group_id = module.vpc.private_subnet_id
}

module "security_group" {
  source = file("./security_group.tf")
  vpc_id = module.vpc.vpc_id
}