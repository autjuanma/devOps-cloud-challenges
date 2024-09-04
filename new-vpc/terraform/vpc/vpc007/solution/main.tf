# Configure the AWS provider
provider "aws" {
  region = var.aws_region
}

# Create a CloudWatch log group module
module "cloudwatch_log_group" {
  source = file("./modules/cloudwatch_log_group/main.tf")

  log_group_name = var.log_group_name
}

# Create a CloudWatch metric module
module "cloudwatch_metric" {
  source = file("./modules/cloudwatch_metric/main.tf")

  metric_name = var.metric_name
  namespace   = var.namespace
}

# Create an S3 bucket module for log storage
module "s3_bucket" {
  source = file("./modules/s3_bucket/main.tf")

  bucket_name = var.bucket_name
}

# Create an IAM role module for CloudWatch logs
module "iam_role" {
  source = file("./modules/iam_role/main.tf")

  role_name = var.role_name
}

# Create a VPC module with a subnet and security group
module "vpc" {
  source = file("./modules/vpc/main.tf")

  vpc_cidr_block = var.vpc_cidr_block
  aws_region     = var.aws_region
  subnet_cidr_block = var.subnet_cidr_block
  security_group_name = var.security_group_name
}