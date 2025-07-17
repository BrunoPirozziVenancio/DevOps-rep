#!/bin/bash
# ----------------------------------------------------------
# Script: clean_logs.sh
# Autor: [Seu Nome]
# Descrição: Limpa arquivos de log antigos automaticamente
# Versão: 1.2
# ----------------------------------------------------------

# Configurações (para serem personalizadas)
LOG_DIR="/var/log"             # Diretório principal de logs
LOG_EXTENSIONS=("*.log" "*.tmp" "*.bak")  # Tipos de arquivo para limpar
DAYS_TO_KEEP=30                # Manter arquivos dos últimos X dias
BACKUP_DIR="/backup/logs"      # Opcional: backup antes de apagar

# Cores para terminal
VERMELHO='\033[0;31m'
VERDE='\033[0;32m'
NC='\033[0m' # No Color

# Cria diretório de backup se necessário
if [ ! -d "$BACKUP_DIR" ]; then
    mkdir -p "$BACKUP_DIR" || {
        echo -e "${VERMELHO}ERRO: Falha ao criar diretório de backup${NC}"
        exit 1
    }
fi

# Limpeza principal
echo -e "${VERDE}[INICIANDO]${NC} Limpeza de logs em $LOG_DIR..."
total_cleaned=0

for ext in "${LOG_EXTENSIONS[@]}"; do
    # Lista e conta arquivos que serão removidos
    files_to_clean=($(find "$LOG_DIR" -type f -name "$ext" -mtime +$DAYS_TO_KEEP))
    count=${#files_to_clean[@]}
    
    # Backup
    if [ $count -gt 0 ]; then
         echo "Fazendo backup de $count arquivos..."
         cp "${files_to_clean[@]}" "$BACKUP_DIR"/
     fi

    # Executa a limpeza
    if [ $count -gt 0 ]; then
        find "$LOG_DIR" -type f -name "$ext" -mtime +$DAYS_TO_KEEP -exec rm -f {} \;
        echo -e "Removidos ${VERDE}$count${NC} arquivos: $ext"
        ((total_cleaned += count))
    fi
done

# Resumo final
echo -e "${VERDE}[CONCLUSÃO]${NC} Total de arquivos removidos: $total_cleaned"
echo -e "Arquivos com mais de ${VERDE}$DAYS_TO_KEEP dias${NC} foram limpos"
echo -e "Data/hora: $(date)"

exit 0
