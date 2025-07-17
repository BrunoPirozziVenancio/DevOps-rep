# scripts-bash
Coleção de scripts Bash úteis para administração de sistemas

## Lista de Scripts

### 1. `Backup_com_timestamp.sh`
   
**Descrição**: Cria backups compactados com timestamp  
**Como usar**:

`./backup_com_timestamp.sh`

**Configuração**:
Edite as variáveis no script:
- `SOURCE="/caminho/para/backup"` - Diretório a ser backupeado
- `DEST="/onde/salvar/backups"` - Pasta de destino

### 2. `Verifica_sites_online.sh`

**Descrição**: Verifica status de sites/serviços  
**Como usar**:

`./verifica_sites_online.sh`  
Personalização:  

-> Edite a array SERVICES no script: 

SERVICES=(  
  "https://seu-site.com"  
  "http://localhost:3000"  
)

### 3. `Alerta_uso_disco.sh`
Descrição: Alerta quando uso do disco ultrapassa limite
Como usar:


`./alerta_uso_disco.sh`  

**Configuração**:  


-> Variáveis editáveis:  

PARTITION="/"  # Partição a monitorar  
THRESHOLD=80   # % para disparar alerta

### 4. `Monitor_ram.sh`  
**Descrição**: Monitora uso de memória RAM e gera alertas  
**Como usar**:  

`./monitor_ram.sh`  

**Configuração**:  

-> Edite as variáveis no script:  

LIMITE_ALERTA=90  # Alerta ao ultrapassar este % de uso  
ARQUIVO_LOG="/caminho/do/seu/log.log"  # Local do arquivo de log  

-> Exemplo com Cron (verificação a cada 30 minutos):  

*/30 * * * * /caminho/scripts-bash/monitor_ram.sh

### 5. `Alerta_uso_disco.sh`  

**Descrição**: Alerta quando uso do disco ultrapassa limite  
**Como usar**:  

`./alerta_uso_disco.sh`  

**Configuração**:  


-> Variáveis editáveis:  

PARTITION="/"  # Partição a monitorar  
THRESHOLD=80   # % para disparar alerta

### 6. `clean_logs.sh`

**Descrição**: Script para limpeza segura de arquivos de log antigos com **backup opcional**


#### Funcionalidades ####

1. **Limpeza inteligente** de logs, temporários e backups antigos
2. **Backup interativo** com confirmação antes da execução
3. **Filtro por tempo** (mantém arquivos recentes)
4. **Relatório detalhado** com contagem de arquivos
5. **Modo seguro** com confirmações em cada etapa  

**Como Usar**  

`./clean_logs.sh`

**Configurações**:  

`LOG_DIR`  

Diretório principal de onde os arquivos serão removidos.  
Padrão: "/var/log"

`DAYS_TO_KEEP`  

   Número de dias que os arquivos serão mantidos antes de serem considerados antigos.  
   Padrão: 30 dias

`LOG_EXTENSIONS`  

   Extensões de arquivos que serão incluídas na limpeza.  
   Padrão: ("*.log", "*.tmp")

`BACKUP_DIR`  

   Caminho onde os arquivos de log antigos podem ser armazenados como backup.  
   Padrão: "/backup/logs_*" (criado automaticamente)



**Configuração personalizada**  

`LOG_DIR="/caminho/logs" DAYS_TO_KEEP=60 ./clean_logs.sh`

**Agendamento automático (via cron)**  

-> Diariamente às 2AM com log de execução 

`0 3 * * * /caminho/clean_logs.sh >> /var/log/clean_logs.log 2>&1`  





