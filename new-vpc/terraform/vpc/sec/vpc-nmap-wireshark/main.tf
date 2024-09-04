provider "aws" {
  region = var.region
}

# ... (rest of the configuration remains the same)

# Create security group for Nmap and Wireshark
resource "aws_security_group" "nmap_wireshark" {
  name        = "nmap-wireshark-sg"
  description = "Allow inbound traffic on ports 22 and 80 for Nmap and Wireshark"
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

# Create Nmap container
resource "docker_container" "nmap" {
  name  = "nmap"
  image = "nmap/nmap:latest"
  ports = ["22:22"]
  security_groups = [aws_security_group.nmap_wireshark.id]
}

# Create Wireshark container
resource "docker_container" "wireshark" {
  name  = "wireshark"
  image = "wireshark/wireshark:latest"
  ports = ["80:80"]
  security_groups = [aws_security_group.nmap_wireshark.id]
}