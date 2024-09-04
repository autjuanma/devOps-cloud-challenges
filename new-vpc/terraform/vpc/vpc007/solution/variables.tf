variable "aws_region" {
  type        = string
  default     = "us-west-2"
}

variable "log_group_name" {
  type        = string
  default     = "my-log-group"
}

variable "metric_name" {
  type        = string
  default     = "my-metric"
}

variable "namespace" {
  type        = string
  default     = "MyNamespace"
}

variable "bucket_name" {
  type        = string
  default     = "my-log-bucket"
}

variable "role_name" {
  type        = string
  default     = "my-log-role"
}

variable "vpc_cidr_block" {
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_cidr_block" {
  type        = string
  default     = "10.0.1.0/24"
}

variable "security_group_name" {
  type        = string
  default     = "my-security-group"
}