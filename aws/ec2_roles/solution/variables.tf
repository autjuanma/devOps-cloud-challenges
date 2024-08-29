variable "region" {
  type        = string
  default     = "us-west-2"
  description = "AWS region"
}

variable "ami" {
  type        = string
  default     = "ami-abc123"
  description = "EC2 instance AMI"
}

variable "instance_type" {
  type        = string
  default     = "t2.micro"
  description = "EC2 instance type"
}