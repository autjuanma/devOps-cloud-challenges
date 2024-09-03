# Module variables
variable "bucket_name" {
  type        = string
  default     = "my-bucket"
  description = "The name of the S3 bucket"
}

variable "region" {
  type        = string
  default     = "us-west-2"
  description = "The region where the S3 bucket will be created"
}