## AWS - Launch EC2 Web Instance 🚀
=====================================

### Objectives
-------------

Launch one EC2 instance with the following requirements:

### Requirements
--------------

1. **Image**: Amazon Linux 2 image 📦
2. **Instance type**: Pick one that has 1 vCPUs and 1 GiB memory 💻
3. **Instance storage**: Should be deleted upon the termination of the instance 💸
4. **Startup script**: When the instance starts, it should:
	* Install the httpd package 📦
	* Start the httpd service 💻
	* Make sure the content of `/var/www/html/index.html` is `I made it! This is is awesome!` 🎉
5. **Tags**:
	* **Name**: "web-1" 📝
	* **Type**: "web" 📝
6. **Security**: HTTP traffic (port 80) should be accepted from anywhere 🌐

Let me know if you have any other questions! 😊