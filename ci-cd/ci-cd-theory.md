# CI/CD - Teoria e Aplicação no DevOps

## O que é CI/CD?

**CI/CD** significa:

- **CI (Integração Contínua)**: prática de integrar alterações de código em um repositório compartilhado várias vezes ao dia. Cada integração dispara builds automáticos e testes para detectar erros rapidamente.

- **CD (Entrega Contínua ou Deploy Contínuo)**:
  - **Entrega Contínua**: as mudanças são automaticamente preparadas para entrar em produção, mas o deploy precisa de aprovação.
  - **Deploy Contínuo**: as mudanças vão direto para produção sem intervenção humana (full automation).

---

## Objetivos do CI/CD

- Reduzir falhas de integração e tempo de deploy
- Automatizar validação de código, testes e provisionamento
- Garantir entregas rápidas, frequentes e confiáveis

---

## Ferramentas populares

| Etapa       | Ferramentas                    |
|-------------|--------------------------------|
| CI          | GitHub Actions, Jenkins, GitLab CI |
| CD          | ArgoCD, Spinnaker, Jenkins, GitHub Actions |
| Deploy Infra | Terraform, Ansible, Pulumi     |
| Containers  | Docker, Kubernetes              |

---

## Exemplo prático no repositório `DevOps-rep`

### CI com GitHub Actions

- Workflow que valida arquivos Terraform (`terraform-check.yml`)
- Workflow que roda `ansible-lint` para verificar boas práticas

### CD com Jenkins

- Pipeline que:
  - Inicializa e aplica Terraform
  - Executa playbook Ansible
  - Faz deploy de infraestrutura + app

---

## Boas práticas

- Commits pequenos e frequentes
- Validar tudo em ambiente de teste antes de aplicar em produção
- Separar ambientes: `dev`, `staging`, `prod`
- Manter os pipelines versionados e testáveis
