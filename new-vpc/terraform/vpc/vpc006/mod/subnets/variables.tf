variable "aws_regions" {
  type        = map(string)
  default     = {
    us-west-2 = "us-west-2"
    us-east-1 = "us-east-1"
  }
}

variable "vpc_id" {
  type        = string
}

variable "subnet_cidr_block" {
  type        = string
  default     = "10.0.1.0/24"
}