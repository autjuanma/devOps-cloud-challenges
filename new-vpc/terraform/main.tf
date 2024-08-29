provider "aws" {
  region = "us-west-2"
}

resource "aws_vpc" "exercise_vpc" {
  cidr_block = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name        = "exercise-vpc"
    Environment = "exercise"
  }
}

output "vpc_id" {
  value = aws_vpc.exercise_vpc.id
  description = "The ID of the exercise VPC"
}

output "vpc_cidr_block" {
  value = aws_vpc.exercise_vpc.cidr_block
  description = "The CIDR block of the exercise VPC"
}