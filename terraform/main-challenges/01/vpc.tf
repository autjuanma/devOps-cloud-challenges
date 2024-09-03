resource "aws_vpc" "this" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "public" {
  cidr_block = "10.0.1.0/24"
  vpc_id     = aws_vpc.this.id
  availability_zone = "us-west-2a"
}

resource "aws_subnet" "private" {
  cidr_block = "10.0.2.0/24"
  vpc_id     = aws_vpc.this.id
  availability_zone = "us-west-2a"
}

output "vpc_id" {
  value = aws_vpc.this.id
}

output "public_subnet_id" {
  value = aws_subnet.public.id
}

output "private_subnet_id" {
  value = aws_subnet.private.id
}