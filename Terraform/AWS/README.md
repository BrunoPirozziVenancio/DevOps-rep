# Projetos Terraform com AWS — Portfólio DevOps

Este repositório contém **quatro projetos práticos** desenvolvidos com **Terraform** para provisionamento de infraestrutura na **Amazon Web Services (AWS)**. Eles demonstram conhecimento em automação, monitoramento, segurança e boas práticas de infraestrutura como código.

Todos os projetos são organizados em pastas separadas, com código comentado, scripts de apoio e um `README.md` específico em cada um.

---

## Projetos incluídos

### 1. [Instância EC2 com Apache e User Data](./aws-ec2-userdata)
Cria uma EC2 na AWS com Apache instalado automaticamente via script (user data). Ideal para entender o básico de provisionamento e customização de instâncias.

- Provisionamento de EC2 com Amazon Linux 2
- Instalação automática do Apache via Bash
- Exposição de IP público
- Security Group com regras de HTTP e SSH

Resultado: acesso à página `http://<ip_da_instancia>` exibindo "Servidor EC2 criado via Terraform!"

---

### 2. [Load Balancer com duas EC2](./aws-alb-ec2)
Projeto com foco em alta disponibilidade e distribuição de carga.

- Duas instâncias EC2 com Apache rodando
- Application Load Balancer (ALB)
- Target Group com checagem de saúde
- Security Group para acesso público

Resultado: acesso ao `http://<dns_do_alb>` e alternância entre os dois servidores.

---

### 3. [Bucket S3 com Script Bash de Upload](./aws-s3-upload)
Criação de um bucket S3 com política personalizada e um script Bash para fazer uploads de arquivos de forma automatizada.

- Bucket S3 com nome personalizado
- Política de permissões configurável
- Script Bash `upload_arquivos.sh` para envio simples
- Outputs informando o nome do bucket

Ideal para automatizar backup ou uploads manuais com linha de comando.

---

### 4. [Lambda Agendada com Monitoramento e Alerta](./aws-lambda-monitoring)
Projeto que une automação com observabilidade e alerta:

- Função Lambda escrita em Python
- Agendamento com CloudWatch Events (a cada 5 min)
- Logs armazenados no CloudWatch
- Alarme com envio de e-mail via SNS se a função falhar

Após configurar o e-mail, você será alertado se a execução falhar.

---

## Tecnologias usadas

- **Terraform**
- **AWS EC2, ALB, S3, Lambda, CloudWatch, SNS**
- **Bash**
- **Python (para a Lambda)**

---

## Como testar cada projeto

Cada pasta tem:
- Código comentado
- Script(s) de apoio (se aplicável)
- Um `README.md` com instruções de uso, pré-requisitos e como destruir os recursos

Você pode testar os projetos individualmente executando:

```bash
cd nome-do-projeto
terraform init
terraform apply
