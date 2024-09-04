output "security_group_id" {
  value       = aws_security_group.secure_sg.id
}

output "network_acl_id" {
  value       = aws_network_acl.secure_nacl.id
}

output "vpc_id" {
  value       = module.vpc.vpc_id
}

output "subnet_ids" {
  value       = module.subnets.subnet_ids
}