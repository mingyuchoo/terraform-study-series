# terraform-study-series

## How to install Terraform

### Install Terraform in Ubuntu

```bash
wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install terraform
```

### How to verify the installation

```bash
terraform -help
terraform -help plan
```

### How to enable tab completion

```bash
terraform -install-autocomplete
```

## Quick start

### Working cycle

```bash
mkdir <project-name>
cd <project-name>
touch main.tf
vim main.tf # change main.tf file
terraform init
terraform fmt
terraform validate
terraform apply
terraform show
terraform state list
terraform destroy
```
