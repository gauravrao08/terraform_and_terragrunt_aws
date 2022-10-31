# terraform_and_terragrunt_aws
terraform_and_terragrunt_aws


```
 terraform init -backend-config=env_vars/backend.hcl
 
 terraform plan -var-file=env_bck/vpc-without-dhcp-vpc2.tfvars 
 
 terraform apply -var-file=env_bck/vpc-without-dhcp-vpc2.tfvars -auto-approve
 
 terraform destroy -var-file=env_bck/vpc-without-dhcp-vpc2.tfvars -auto-approve
```
