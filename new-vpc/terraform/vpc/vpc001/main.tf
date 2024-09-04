# Provider
provider "aws" {
  region = "us-west-2"
}

# VPC
resource "aws_vpc" "exercise_vpc" {
  cidr_block = "10.0.0.0/16" # Supports at least 60,000 hosts
  tags = {
    Name = "exercise-vpc"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "exercise_igw" {
  vpc_id = aws_vpc.exercise_vpc.id
  tags = {
    Name = "exercise-igw"
  }
}

# Public Subnet
resource "aws_subnet" "public_subnet" {
  cidr_block = "10.0.1.0/20" # Supports at least 10,000 hosts
  vpc_id     = aws_vpc.exercise_vpc.id
  availability_zone = "us-west-2a"
  tags = {
    Name = "public-subnet"
  }
}

# Private Subnet
resource "aws_subnet" "private_subnet" {
  cidr_block = "10.0.2.0/19" # Supports at least 20,000 hosts
  vpc_id     = aws_vpc.exercise_vpc.id
  availability_zone = "us-west-2a"
  tags = {
    Name = "private-subnet"
  }
}

# NAT Gateway
resource "aws_nat_gateway" "exercise_nat_gateway" {
  allocation_id = aws_eip.exercise_eip.id
  subnet_id = aws_subnet.public_subnet.id
  tags = {
    Name = "exercise-nat-gateway"
  }
}

# Elastic IP for NAT Gateway
resource "aws_eip" "exercise_eip" {
  vpc = true
  tags = {
    Name = "exercise-eip"
  }
}

# Route Tables
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.exercise_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.exercise_igw.id
  }
  tags = {
    Name = "public-route-table"
  }
}

resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.exercise_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.exercise_nat_gateway.id
  }
  tags = {
    Name = "private-route-table"
  }
}

# Route Table Associations
resource "aws_route_table_association" "public_route_table_association" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table_association" "private_route_table_association" {
  subnet_id      = aws_subnet.private_subnet.id
  route_table_id = aws_route_table.private_route_table.id
}

# Security Groups
resource "aws_security_group" "ssh_security_group" {
  name        = "ssh-security-group"
  description = "Allow SSH traffic from anywhere"
  vpc_id      = aws_vpc.exercise_vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "ssh-security-group"
  }
}

resource "aws_security_group" "http_security_group" {
  name        = "http-security-group"
  description = "Allow HTTP traffic from anywhere"
  vpc_id      = aws_vpc.exercise_vpc.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "http-security-group"
  }
}