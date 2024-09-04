# Challenge 4: Implementing Security Best Practices
=====================================================

As a Cloud senior engineer, it's essential to ensure that your VPC is secure and follows best practices. In this challenge, you will create a Terraform configuration that implements security best practices in a VPC.

## Task
--------

Create a Terraform configuration that creates a secure VPC with the following requirements:

### Security Group
---------------

* Create a security group with restrictive rules that only allows:
	+ Inbound traffic on port 22 (SSH)
	+ Outbound traffic on all ports

### Network ACL
--------------

* Create a network ACL with restrictive rules that only allows:
	+ Inbound traffic on port 22 (SSH)
	+ Outbound traffic on all ports

### Validation Test
-----------------

* Create a test to validate that the security group and network ACL are correctly configured
