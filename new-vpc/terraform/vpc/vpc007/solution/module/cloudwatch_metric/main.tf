resource "aws_cloudwatch_metric" "metric" {
  name = var.metric_name
  namespace = var.namespace
  dimensions = {
    "InstanceId" = "i-1234567890abcdef0"
  }
}