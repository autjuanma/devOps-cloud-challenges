# Deploy single terraform 🚀


**Explanation:** 📝

1️⃣ The workflow is triggered on push events to the **main** branch 🌳.
2️⃣ The job runs on an **ubuntu-latest** environment 🖥️.
3️⃣ The workflow checks out the code in the repository 📁.
4️⃣ It logs in to **AWS** using the `aws-actions/login` action, which uses the **AWS_ACCESS_KEY_ID** and **AWS_SECRET_ACCESS_KEY** secrets stored in your GitHub repository 🔒.
5️⃣ It installs **Terraform** using `apt-get` 📦.
6️⃣ It initializes **Terraform** using `terraform init` 💻.
7️⃣ It applies the **Terraform** configuration using `terraform apply -auto-approve`, which automatically approves the changes 🚀.
8️⃣ Finally, it outputs the **Terraform** state using `terraform output` 📊.