# Projetos Terraform com Oracle Cloud (OCI) — Portfólio DevOps

Este repositório contém **projetos práticos com Terraform na Oracle Cloud Infrastructure (OCI)**. Os exemplos foram desenvolvidos com foco em automação, infraestrutura como código e ambientes reais de desenvolvimento e produção.

Cada pasta contém um projeto independente com código comentado, arquivos `.tf` e instruções em um `README.md` próprio.

---

## Projetos incluídos

###  1. [`oci-instance-cloudinit`](./oci-instance-cloudinit)
Criação de uma instância Compute com script **Cloud-Init**, que instala e configura pacotes automaticamente.  
Perfeito para ambientes backend ou testes com serviços em Java, Git, Maven etc.

---

### 2. [`oci-loadbalancer-vms`](./oci-loadbalancer-vms)
Arquitetura de alta disponibilidade:

- 2 VMs na OCI
- Load Balancer público distribuindo requisições
- Apache instalado automaticamente com identificação de cada instância

---

### 3. [`oci-bucket`](./oci-bucket)
Provisiona um **bucket no Object Storage** da OCI, ideal para armazenamento de arquivos, backups ou integrações com automações.

---

### 4. [`vcn-instance`](./vcn-instance)
Projeto para criar uma **Virtual Cloud Network (VCN)** completa com:

- Sub-redes públicas
- Internet Gateway
- Route Tables
- Security Lists

Esse projeto serve de base para os outros e mostra como estruturar uma rede do zero na OCI.

---

## Tecnologias e práticas aplicadas

- Terraform
- Oracle Cloud Infrastructure (OCI)
- Compute Instances
- VCN, Subnets e Security Lists
- Load Balancer
- Object Storage
- Cloud-Init
- Estrutura modular e reutilizável

---

## Como executar

Entre em qualquer pasta de projeto e execute:

```bash
terraform init
terraform apply
