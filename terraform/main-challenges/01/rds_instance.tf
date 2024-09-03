resource "aws_db_instance" "this" {
  instance_class = "db.t2.micro"
  engine         = "mysql"
  vpc_security_group_ids = [module.security_group.id]
  db_subnet_group_name = aws_db_subnet_group.this.name
  username = var.database_username
  password = var.database_password
  db_name = "mydb"
}

resource "aws_db_subnet_group" "this" {
  name        = "my-db-subnet-group"
  subnet_ids = [var.subnet_id]
}

output "endpoint" {
  value = aws_db_instance.this.endpoint
}