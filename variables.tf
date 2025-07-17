# Variáveis de autenticação

variable "tenancy_ocid"       {}
variable "user_ocid"          {}
variable "fingerprint"        {}
variable "private_key_path"   {}

# Região default (padrão), normalmente é a região SP

variable "region" {
  default = "sa-saopaulo-1"
}

# Compartimento onde os recursos serão criados

variable "compartment_ocid"   {}

# Chave pública (Public Key) usada para acessar a VM via SSH

variable "ssh_public_key"     {}

