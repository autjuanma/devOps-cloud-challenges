resource "aws_instance" "this" {
  ami           = var.ami_id
  instance_type = "t2.micro"
  vpc_security_group_ids = [module.security_group.id]
  subnet_id = var.subnet_id
}

output "public_ip" {
  value = aws_instance.this.public_ip
}