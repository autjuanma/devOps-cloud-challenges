output "ec2_instance_public_ip" {
  value = module.ec2_instance.public_ip
}

output "rds_instance_endpoint" {
  value = module.rds_instance.endpoint
}