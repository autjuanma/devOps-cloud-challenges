# Create a subnet
resource "aws_subnet" "subnet" {
  cidr_block = var.subnet_cidr_block
  vpc_id     = var.vpc_id
  availability_zone = var.aws_region
  tags = {
    Name = "Secure Subnet"
  }
}

# Create subnets in multiple regions
resource "aws_subnet" "subnet_multi_region" {
  provider = aws
  for_each = var.aws_regions

  cidr_block = var.subnet_cidr_block
  vpc_id     = var.vpc_id
  availability_zone = each.key
  tags = {
    Name = "Secure Subnet ${each.key}"
  }
}