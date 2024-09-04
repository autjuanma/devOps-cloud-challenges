resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr_block
}

resource "aws_subnet" "subnet" {
  cidr_block = var.subnet_cidr_block
  vpc_id     = aws_vpc.vpc.id
  availability_zone = "us-west-2a"
}

resource "aws_security_group" "security_group" {
  name        = var.security_group_name
  description = "Security group for VPC"
  vpc_id      = aws_vpc.vpc.id
}