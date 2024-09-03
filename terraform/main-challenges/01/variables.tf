variable "ami_id" {
  type        = string
  default     = "ami-abc123"
  description = "The ID of the AMI to use for the EC2 instance"
}

variable "database_username" {
  type        = string
  default     = "myuser"
  description = "The username for the RDS instance"
}

variable "database_password" {
  type        = string
  default     = "mypassword"
  description = "The password for the RDS instance"
}