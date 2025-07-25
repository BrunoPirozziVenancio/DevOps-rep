# CI/CD - Integração e Entrega Contínuas

Esta pasta contém pipelines e workflows que automatizam a validação, provisionamento e entrega de infraestrutura e aplicações dentro do repositório `DevOps-rep`.

---

## Workflows GitHub Actions

| Nome                  | Descrição                                              |
|-----------------------|--------------------------------------------------------|
| `terraform-check.yml` | Validação de sintaxe e estrutura de projetos Terraform |
| `ansible-lint.yml`    | Linting de playbooks Ansible                           |
| `docker-deploy.yml`   | Build e push de imagem Docker para DockerHub           |

Caminho: [`github-actions/`](./github-actions)

---

## Pipeline Jenkins

Pipeline completa com:

- Provisionamento com Terraform
- Deploy e configuração com Ansible
- Parametrização de projetos por nome

Caminho: [`jenkins-pipeline/`](./jenkins-pipeline)

---

## Teoria e boas práticas

Arquivo contendo explicações sobre:

- Diferença entre CI e CD
- Ferramentas mais usadas
- Aplicações práticas no repositório

Caminho: [`ci-cd-theory.md`](./ci-cd-theory.md)

---

## Requisitos para executar

- Jenkins configurado com plugins:
  - Git, Pipeline
- GitHub configurado com secrets (para Docker, por exemplo)
- Ferramentas instaladas nos runners:
  - Terraform
  - Ansible
  - Docker

---

## Objetivo

Mostrar, de forma prática e organizada, como pipelines de CI/CD podem automatizar tarefas repetitivas e garantir entregas rápidas, seguras e consistentes — do código à infraestrutura
