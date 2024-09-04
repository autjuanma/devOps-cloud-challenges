provider "aws" {
  region = var.region
}

# Create VPC
resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "main-vpc"
  }
}

# Create subnet
resource "aws_subnet" "main" {
  cidr_block = var.subnet_cidr
  vpc_id     = aws_vpc.main.id
  availability_zone = "us-west-2a"
  tags = {
    Name = "main-subnet"
  }
}

# Create security group
resource "aws_security_group" "main" {
  name        = "main-sg"
  description = "Allow inbound traffic on port 22 and 80"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Create KMS key
resource "aws_kms_key" "main" {
  description             = "My KMS key"
  deletion_window_in_days = 10
}

# Create instance
resource "aws_instance" "main" {
  ami           = "ami-0c94855ba95c71c99" # Ubuntu 20.04 LTS
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.main.id]
  subnet_id = aws_subnet.main.id
  key_name               = var.ssh_key_name

  # Enable SSH access
  connection {
    type        = "ssh"
    host        = self.public_ip
    user        = "ubuntu"
    private_key = file("~/.ssh/${var.ssh_key_name}.pem")
  }

  # Configure firewall
  provisioner "remote-exec" {
    inline = [
      "sudo apt update",
      "sudo apt install ufw -y",
      "sudo ufw allow ssh",
      "sudo ufw allow http",
      "sudo ufw enable",
    ]
  }
}