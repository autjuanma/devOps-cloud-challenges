# Terraform Challenge for DevOps Engineer 🌟
=====================================================

## Challenge 1: Infrastructure Setup 🏗️
-------------------------------------

Create a Terraform configuration to set up the following infrastructure:

* A VPC with a CIDR block of `10.0.0.0/16`
* A public subnet with a CIDR block of `10.0.1.0/24`
* A private subnet with a CIDR block of `10.0.2.0/24`
* An EC2 instance with the following specifications:
	+ Instance type: `t2.micro`
	+ AMI: `ami-abc123` (replace with a valid AMI ID)
	+ VPC: the one created above
	+ Subnet: the public subnet created above
	+ Security group: allow inbound traffic on port 22 from anywhere
* An RDS instance with the following specifications:
	+ Instance type: `db.t2.micro`
	+ Engine: `mysql`
	+ VPC: the one created above
	+ Subnet group: the private subnet created above
	+ Database name: `mydb`
	+ Username: `myuser`
	+ Password: `mypassword` (replace with a valid password)

## Challenge 2: Module Creation 📦
---------------------------------

Create a Terraform module that provisions an S3 bucket with the following specifications:

* Bucket name: `my-bucket`
* Region: `us-west-2`
* Versioning: enabled
* Server-side encryption: enabled with the default AWS-managed key

## Challenge 3: State Management 📊
---------------------------------

Create a Terraform configuration that manages the state of the infrastructure created in Challenge 1. The configuration should:

* Use a remote state backend (e.g. S3, Terraform Cloud)
* Lock the state file to prevent concurrent modifications
* Use a state file named `devops-challenge.tfstate`

## Challenge 4: Resource Dependencies 📈
-------------------------------------

Create a Terraform configuration that provisions the following resources:

* An SNS topic named `my-topic`
* An SQS queue named `my-queue`
* An S3 bucket named `my-bucket` (same as in Challenge 2)
* A Lambda function named `my-lambda` with the following specifications:
	+ Runtime: `nodejs14.x`
	+ Handler: `index.handler`
	+ Environment variables: `BUCKET_NAME=my-bucket`, `QUEUE_URL=my-queue`
	+ Trigger: the SNS topic created above
The Lambda function should be deployed to the `us-west-2` region.

## Challenge 5: Output Values 📝
--------------------------------

Create a Terraform configuration that outputs the following values:

* The public IP address of the EC2 instance created in Challenge 1
* The RDS instance endpoint created in Challenge 1
* The ARN of the SNS topic created in Challenge 4
* The URL of the SQS queue created in Challenge 4

## Challenge 6: Import Existing Resources 📂
-----------------------------------------

Import the following existing resources into a Terraform configuration:

* An existing S3 bucket named `my-existing-bucket`
* An existing EC2 instance with the ID `i-abc123` (replace with a valid instance ID)

## Challenge 7: Terraform Workspaces 📁
-------------------------------------

Create a Terraform configuration that uses workspaces to manage multiple environments (e.g. dev, prod). The configuration should:

* Create a workspace named `dev`
* Create a workspace named `prod`
* Provision the infrastructure created in Challenge 1 in both workspaces
* Use input variables to customize the infrastructure for each workspace

## Challenge 8: Terraform Modules 📚
-------------------------------------

Create a Terraform module that provisions an Elastic Beanstalk environment with the following specifications:

* Environment name: `my-env`
* Platform: `64bit Amazon Linux 2 v3.2.1 running Node.js 14`
* Instance type: `t2.micro`
* VPC: the one created in Challenge 1
* Subnet: the public subnet created in Challenge 1

Good luck! 🤞