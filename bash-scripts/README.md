# scripts-bash
Coleção de scripts Bash úteis para administração de sistemas

## Lista de Scripts

1. `backup_com_timestamp.sh`
   
**Descrição**: Cria backups compactados com timestamp  
**Como usar**:

`./backup_com_timestamp.sh`

**Configuração**:
Edite as variáveis no script:
- `SOURCE="/caminho/para/backup"` - Diretório a ser backupeado
- `DEST="/onde/salvar/backups"` - Pasta de destino

2. `verifica_sites_online.sh`

**Descrição**: Verifica status de sites/serviços  
**Como usar**:

`./verifica_sites_online.sh`  
Personalização:  

**Edite a array SERVICES no script**: 

SERVICES=(  
  "https://seu-site.com"  
  "http://localhost:3000"  
)



