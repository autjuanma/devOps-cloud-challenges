$AUTHOR = "[JuanTM 📲]"
$EMAIL = "juannodecoorp@gmail.com"

# Create a new directory called "my_first_run"
New-Item -ItemType Directory -Path ./my_first_run

# Create a new file called "main.tf" with the given content
@'
resource "local_file" "Ju@nsito_local_file" {
    content  = "It's a me, Ju@nsito!"
    filename = "/tmp/who_is_it.txt"
}
'@ | Set-Content -Path ./my_first_run/main.tf

# Change into the new directory
Set-Location -Path ./my_first_run

# Run terraform init
terraform init

# Run terraform plan
terraform plan

# Run terraform apply and automatically approve the changes
terraform apply -auto-approve

# Verify that the file was created
Get-Content -Path /tmp/who_is_it.txt