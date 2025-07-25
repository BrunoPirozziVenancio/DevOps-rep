# Jenkins Pipeline

Este diretório contém um exemplo de pipeline declarativa em Jenkins para automatizar a infraestrutura e o deploy de aplicações, usando Terraform e Ansible.

---

## Pipeline: Jenkinsfile

O `Jenkinsfile` realiza as seguintes etapas:

1. **Checkout** do repositório
2. **Terraform Init / Validate / Plan**
3. **Terraform Apply** (executado apenas na branch `main`)
4. **Execução de playbook Ansible** após provisionamento

---

## Parametrização (opcional)

Você pode adaptar o pipeline para receber como parâmetro o nome da pasta do projeto Terraform e Ansible:

```groovy
parameters {
    string(name: 'TF_PROJECT', defaultValue: 'oci-instance-cloudinit', description: 'Projeto Terraform')
    string(name: 'ANSIBLE_PROJECT', defaultValue: 'oci-install-zabbix-agent', description: 'Projeto Ansible')
}
```

---

### Pré-requisitos

- Jenkins instalado (pode ser local ou em container)
- Plugins:
  - Pipeline
  - Git

- Ferramentas instaladas no agente Jenkins:
  - Terraform
  - Ansible
  - SSH configurado para acesso às instâncias remotas

---

### Observações

- O terraform apply só é executado se estiver na branch main
- O Ansible espera um arquivo hosts e um deploy.yml dentro da pasta escolhida 
- Os caminhos padrão apontam para projetos da OCI, mas você pode adaptar para AWS ou outro

