# OCI - Bucket no Object Storage

Esse projeto cria um bucket simples na Oracle Cloud, usando Terraform.

Dá pra usar ele pra armazenar backups, logs, arquivos de config, etc.

---

## O que precisa antes

- Conta na OCI com as credenciais geradas
- Terraform instalado (v1.2+ ou mais novas)
- Compartimento já criado

---

## Como rodar

Crie um arquivo chamado `terraform.tfvars` com suas variáveis:

```hcl
tenancy_ocid     = "ocid1.tenancy.oc1..."
user_ocid        = "ocid1.user.oc1..."
fingerprint      = "xx:xx:xx:xx"
private_key_path = "~/.oci/oci_api_key.pem"
region           = "sa-saopaulo-1"
compartment_ocid = "ocid1.compartment.oc1..."
bucket_name      = "bruno-backups"
access_type      = "NoPublicAccess"
```
---  

**Depois**:  

```hcl
terraform init  
terraform apply  
```
