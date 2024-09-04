variable "region" {
  type        = string
  default     = "us-west-2"
}

variable "vpc_cidr" {
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_cidr" {
  type        = string
  default     = "10.0.1.0/24"
}

variable "instance_type" {
  type        = string
  default     = "t2.micro"
}

variable "ssh_key_name" {
  type        = string
  default     = "my_ssh_key"
}

variable "kms_key_alias" {
  type        = string
  default     = "my_kms_key"
}