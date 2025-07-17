# scripts-bash
Coleção de scripts Bash úteis para administração de sistemas

## Lista de Scripts

1. `Backup_com_timestamp.sh`
   
**Descrição**: Cria backups compactados com timestamp  
**Como usar**:

`./backup_com_timestamp.sh`

**Configuração**:
Edite as variáveis no script:
- `SOURCE="/caminho/para/backup"` - Diretório a ser backupeado
- `DEST="/onde/salvar/backups"` - Pasta de destino

2. `Verifica_sites_online.sh`

**Descrição**: Verifica status de sites/serviços  
**Como usar**:

`./verifica_sites_online.sh`  
Personalização:  

-> Edite a array SERVICES no script: 

SERVICES=(  
  "https://seu-site.com"  
  "http://localhost:3000"  
)

3. `Alerta_uso_disco.sh`
Descrição: Alerta quando uso do disco ultrapassa limite
Como usar:


`./alerta_uso_disco.sh`  

**Configuração**:  


-> Variáveis editáveis:  

PARTITION="/"  # Partição a monitorar  
THRESHOLD=80   # % para disparar alerta

4. `Monitor_ram.sh`  
**Descrição**: Monitora uso de memória RAM e gera alertas  
**Como usar**:  

`./monitor_ram.sh`  

**Configuração**:  

-> Edite as variáveis no script:  

LIMITE_ALERTA=90  # Alerta ao ultrapassar este % de uso  
ARQUIVO_LOG="/caminho/do/seu/log.log"  # Local do arquivo de log  

-> Exemplo com Cron (verificação a cada 30 minutos):  

*/30 * * * * /caminho/scripts-bash/monitor_ram.sh



