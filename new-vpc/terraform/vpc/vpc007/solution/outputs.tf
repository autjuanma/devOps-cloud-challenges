output "log_group_arn" {
  value       = module.cloudwatch_log_group.log_group_arn
}

output "metric_arn" {
  value       = module.cloudwatch_metric.metric_arn
}

output "s3_bucket_arn" {
  value       = module.s3_bucket.s3_bucket_arn
}

output "iam_role_arn" {
  value       = module.iam_role.iam_role_arn
}