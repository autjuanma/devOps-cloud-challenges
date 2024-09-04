# Exercise: Terraform VPC Challenge 🚀
## Objective:
Create a new VPC using Terraform that meets the following requirements:

### Requirements 📝
#### Create a new VPC:
* CIDR block that supports at least 60,000 hosts 💻
* VPC name: "exercise-vpc" 📝

#### Subnets:
##### Public subnet:
* CIDR block that supports at least 10,000 hosts 💻

##### Private subnet:
* CIDR block that supports at least 20,000 hosts 💻

#### Internet Gateway (IGW):
* Attach an IGW to the VPC 🌐

#### Route Tables:
##### Public subnet:
* Route table that routes traffic to the IGW 🌐

##### Private subnet:
* Route table that routes traffic to a NAT Gateway 🌐

#### NAT Gateway:
* Create a NAT Gateway in the public subnet 🌐

#### Security Groups:
##### Security Group 1:
* Create a security group that allows inbound traffic on port 22 (SSH) from anywhere 🔒

##### Security Group 2:
* Create a security group that allows inbound traffic on port 80 (HTTP) from anywhere 🌐

### Constraints 🚫
* Use the AWS provider
* Use Terraform 1.2 or later
* Use the `aws_vpc` resource to create the VPC
* Use the `aws_subnet` resource to create the subnets
* Use the `aws_internet_gateway` resource to create the IGW
* Use the `aws_route_table` resource to create the route tables
* Use the `aws_nat_gateway` resource to create the NAT Gateway
* Use the `aws_security_group` resource to create the security groups

### Deliverables 📦
* A Terraform configuration file (main.tf) that creates the required resources
* A `terraform apply` command that successfully creates the resources in AWS