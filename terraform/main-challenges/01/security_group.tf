resource "aws_security_group" "this" {
  name        = "my-security-group"
  description = "Allow inbound traffic on port 22"
  vpc_id      = module.vpc.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}