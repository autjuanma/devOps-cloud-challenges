# Create a VPC
resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr_block
  tags = {
    Name = "Secure VPC"
  }
}

# Create a VPC in multiple regions
resource "aws_vpc" "vpc_multi_region" {
  provider = aws
  for_each = var.aws_regions

  cidr_block = var.vpc_cidr_block
  region     = each.key
  tags = {
    Name = "Secure VPC ${each.key}"
  }
}