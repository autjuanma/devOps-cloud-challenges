# variables.tf
variable "region" {
  type        = string
  default     = "us-west-2"
}

variable "bucket_name" {
  type        = string
  default     = "my-bucket"
}

variable "queue_name" {
  type        = string
  default     = "my-queue"
}

variable "topic_name" {
  type        = string
  default     = "my-topic"
}

variable "lambda_name" {
  type        = string
  default     = "my-lambda"
}