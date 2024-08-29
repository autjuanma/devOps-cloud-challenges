# Configure the AWS provider
provider "aws" {
  region = var.region
}

# Create an IAM role with readonly access
resource "aws_iam_role" "readonly_role" {
  name        = "readonly-role"
  description = "IAM role with readonly access"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
        Effect = "Allow"
      }
    ]
  })
}

# Attach the IAM role to the EC2 instance
resource "aws_iam_instance_profile" "readonly_instance_profile" {
  name = "readonly-instance-profile"
  role = aws_iam_role.readonly_role.name
}

resource "aws_instance" "example" {
  ami           = var.ami
  instance_type = var.instance_type

  iam_instance_profile = aws_iam_instance_profile.readonly_instance_profile.name
}