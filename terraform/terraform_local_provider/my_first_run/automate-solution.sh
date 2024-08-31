#!/bin/bash
AUTHOR="[JuanTM 📲]"
EMAIL="juannodecoorp@gmail.com"

# Create a new directory called "my_first_run"
mkdir my_first_run

# Create a new file called "main.tf" with the given content
cat > my_first_run/main.tf <<EOF
resource "local_file" "Ju@nsito_local_file" {
    content  = "It's a me, Ju@nsito!"
    filename = "/tmp/who_is_it.txt"
}
EOF

# Change into the new directory
cd my_first_run

# Run terraform init
terraform init

# Run terraform plan
terraform plan

# Run terraform apply and automatically approve the changes
terraform apply -auto-approve

# Verify that the file was created
cat /tmp/who_is_it.txt