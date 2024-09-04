output "subnet_id" {
  value       = aws_subnet.subnet.id
}

output "subnet_ids" {
  value       = aws_subnet.subnet_multi_region.*.id
}