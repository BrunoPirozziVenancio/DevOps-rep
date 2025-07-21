# Projetos Terraform com Oracle Cloud (OCI) — Portfólio DevOps

Este repositório contém **projetos de infraestrutura como código (IaC)** usando **Terraform** na **Oracle Cloud Infrastructure (OCI)**. Os projetos são voltados para ambientes reais de desenvolvimento e produção, focando em automação, provisionamento e boas práticas de DevOps.

Todos os códigos são comentados e organizados para facilitar entendimento e reuso.

---

## Projetos incluídos

### 1. [Instância Compute com Cloud-Init](./oci-instance-cloud-init)

Provisiona uma **instância virtual** na OCI e utiliza um script **Cloud-Init** para configurar o ambiente automaticamente.

- Instala pacotes como Java, Git, Maven
- Útil como base para backend, build server ou automações
- Ideal para validar provisionamento automático

Simula o setup inicial de um servidor de desenvolvimento.

---

### 2. [Load Balancer com duas VMs](./oci-load-balancer)

Cria uma arquitetura com:

- Duas **instâncias compute**
- Um **Load Balancer público** na frente
- Regras de segurança para HTTP/HTTPS
- Instalação automática de servidor web (Apache) em ambas as VMs

Resultado: Acesso via IP do Load Balancer alternando entre as instâncias.

---

### 3. [Instância com projeto Java + Autonomous Database](./oci-java-autonomous-db)

Simula um ambiente de desenvolvimento **Java + banco de dados gerenciado**:

- Instância compute com Git, Java, Maven (via Cloud-Init)
- Clonagem automática de repositório Java (ex: uma API)
- Banco de dados **Autonomous Transaction Processing (ATP)**
- Configurado para uso real com segurança e outputs úteis

Ideal para DevOps que trabalham com backend, APIs e integração contínua.

---

## Tecnologias e conceitos aplicados

- **Terraform (Infraestrutura como Código)**
- **Oracle Cloud Infrastructure (OCI)**
- **Instâncias Compute**
- **Cloud-Init**
- **Load Balancer**
- **Autonomous Database (ATP)**
- **Scripts automatizados**

---

## Como testar

Cada projeto tem um `README.md` próprio com instruções detalhadas.

Passo comum para todos:
```bash
terraform init
terraform apply
