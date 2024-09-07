# Author information
$AUTHOR = "[JuanTM 📲]"
$EMAIL = "juannodecoorp@gmail.com"
$DATE = "2023-02-20"

# Set variables
$INSTANCE_NAME = "my-instance"
$ZONE = "us-central1-a"
$PROJECT_ID = "my-project-id"
$SSH_KEY_FILE = "path/to/your/ssh/key"
$SSH_USER = "your-ssh-username"

# Create instance
gcloud compute instances create $INSTANCE_NAME `
  --zone $ZONE `
  --project $PROJECT_ID `
  --machine-type "n1-standard-1" `
  --image-project "debian-cloud" `
  --image-family "debian-9" `
  --boot-disk-size "10GB" `
  --boot-disk-type "pd-standard" `
  --network "default" `
  --metadata-from-file "startup-script=startup.sh"

# Create SSH key
gcloud compute ssh $INSTANCE_NAME `
  --zone $ZONE `
  --project $PROJECT_ID `
  --ssh-key-file $SSH_KEY_FILE `
  --ssh-user $SSH_USER

# Configure firewall rules
gcloud compute firewall-rules create allow-ssh `
  --project $PROJECT_ID `
  --network "default" `
  --allow "tcp:22"

# Configure startup script
@'
#!/bin/bash

# Update and upgrade packages
apt-get update && apt-get upgrade -y

# Install necessary packages
apt-get install -y nginx

# Configure nginx
@'
http {
    server {
        listen 80;
        server_name example.com;

        location / {
            root /var/www/html;
            index index.html;
        }
    }
}
'@ | Set-Content -Path ./nginx.conf

# Restart nginx
service nginx restart
'@ | Set-Content -Path ./startup.sh

# Make startup script executable
Set-Acl -Path ./startup.sh -SetExecutable $true

# Test SSH connection
ssh -i $SSH_KEY_FILE $SSH_USER@$INSTANCE_NAME

# Test nginx configuration
Invoke-WebRequest -Uri http://example.com