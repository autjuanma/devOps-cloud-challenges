# Configure the AWS Provider
provider "aws" {
  region = "us-west-2"
}

# Create a VPC
resource "aws_vpc" "secure_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "Secure VPC"
  }
}

# Create a security group
resource "aws_security_group" "secure_sg" {
  name        = "Secure SG"
  description = "Security group with restrictive rules"
  vpc_id      = aws_vpc.secure_vpc.id

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
  vpc_id     = aws_vpc.secure_vpc.id
  subnet_ids = [aws_subnet.secure_subnet.id]

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

# Create a subnet
resource "aws_subnet" "secure_subnet" {
  cidr_block = "10.0.1.0/24"
  vpc_id     = aws_vpc.secure_vpc.id
  availability_zone = "us-west-2a"
  tags = {
    Name = "Secure Subnet"
  }
}