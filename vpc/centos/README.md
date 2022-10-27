Creates an VPC Virtual Server Instance with multiple ssh keys

terraform init -var-file=data/var.tfvars
terraform plan -var-file=data/var.tfvars
terraform apply -var-file=data/var.tfvars
terraform destroy -var-file=data/var.tfvars

Debug

TF_LOG=debug 

TF_LOG=debug terraform apply -var-file=data/var.tfvars

```terraform
Apply complete! Resources: 1 added, 0 changed, 0 destroyed.

Outputs:

primary_ipv4_address = "10.249.0.21"
```