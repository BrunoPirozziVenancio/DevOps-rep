# GitHub Actions Workflows

Esta pasta contém exemplos de workflows GitHub Actions.

## Workflows

### 1. Terraform Validation (`terraform-check.yml`)
Valida sintaxe e estrutura dos arquivos Terraform a cada `push` ou `PR`.

### 2. Ansible Lint (`ansible-lint.yml`)
Executa o `ansible-lint` em todos os playbooks para garantir boas práticas.

### 3. Docker Deploy (`docker-deploy.yml`)
Realiza build e push de imagem Docker para o DockerHub sempre que houver mudança na pasta `docker/`.

---

## Requisitos
- Secrets `DOCKER_USERNAME` e `DOCKER_PASSWORD` configurados no repositório
