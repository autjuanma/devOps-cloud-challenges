# File: main.tf

provider "aws" {
  region = "us-east-1" // Or your desired region
}

resource "aws_instance" "web_server" {
  ami           = "ami-12345678" // Replace with the correct AMI for Amazon Linux 2
  instance_type = "t2.micro" // Or any instance type with 1 vCPU and 1 GiB memory

  tags = {
    Name = "web-1"
    Type = "web"
  }

  root_block_device {
    volume_size           = 8 // Or any desired size
    delete_on_termination = true
  }

  provisioner "remote-exec" {
    inline = [
      "sudo yum update -y",
      "sudo yum install -y httpd",
      "sudo systemctl start httpd",
      "sudo bash -c 'echo \"I made it! This is awesome!\" > /var/www/html/index.html'",
      "sudo systemctl enable httpd"
    ]

    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = file("~/.ssh/your_private_key.pem") // Replace with the path to your private key
      host        = self.public_ip
    }
  }

  security_group_ids = [aws_security_group.web_sg.id]
}

resource "aws_security_group" "web_sg" {
  name        = "web_sg"
  description = "Security group for web server"
  
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}