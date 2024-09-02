# Create an AWS CloudFormation Template for a Highly Available Web Application 🚀
======================================================================

## Requirements 📝
---------------

Create a CloudFormation template that provisions a highly available web application with the following requirements:

### Network Configuration 🌐

* A VPC with a CIDR block of `10.0.0.0/16`.
* Two subnets:
	+ One public subnet with a CIDR block of `10.0.1.0/24`.
	+ One private subnet with a CIDR block of `10.0.2.0/24`.
* An Internet Gateway (IGW) attached to the VPC.
* A NAT Gateway in the public subnet.

### Security Configuration 🔒

* A security group that allows inbound traffic on port `80` (HTTP) from anywhere.

### Compute Configuration 💻

* An EC2 instance in the private subnet with:
	+ A specified instance type of `t2.micro`.
	+ An Amazon Machine Image (AMI) of Amazon Linux 2.

### Load Balancing Configuration ⚖️

* An Elastic Load Balancer (ELB) in the public subnet that distributes traffic to the EC2 instance.

### Auto Scaling Configuration ⚙️

* An Auto Scaling Group (ASG) that scales the EC2 instance based on CPU utilization.

### IAM Configuration 👥

* An IAM role with a policy that allows access to:
	+ Amazon S3.
	+ Amazon CloudWatch Logs.
* An IAM instance profile that associates the IAM role with the EC2 instance.

## Deliverables 📦
---------------

* A YAML or JSON file containing the AWS CloudFormation template.