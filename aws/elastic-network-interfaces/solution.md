# AWS EC2 - Elastic Network Interfaces 🌐
=============================================

## Requirements
---------------

* An EC2 instance with network interface 💻

## Objectives
------------

### A. Create a network interface and attach it to the EC2 instance that already has one network interface 📈

### B. Explain why would anyone use two network interfaces 🤔

## Solution
------------

### A. Create and attach a network interface

1. Go to EC2 service 🚀
2. Click on "Network Interfaces" under "Network & Security" 🔒
3. Click on "Create network interface" 💡
4. Provide a description 📝
5. Choose a subnet (one that is in the AZ as the instance) 📍
6. Optionally attach a security group and click on "Create network interface" 🔒
7. Click on "Actions" -> "Attach" and choose the instance to attach it to 💻
8. If you go now to "Instances" page you'll see your instance has two network interfaces 👀

### B. Why use two network interfaces?

1. You can move the second network interface between instances. This allows us to create kind of a failover mechanism between the instances. 💪