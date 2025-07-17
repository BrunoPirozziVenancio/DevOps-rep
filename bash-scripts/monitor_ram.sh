#!/bin/bash
# ----------------------------------------------------------
# Script: monitor_ram.sh
# Autor: [Bruno Pirozzi Venancio]
# Descrição: Monitora uso de RAM e alerta se ultrapassar limite
# Versão: 1.1
# ----------------------------------------------------------

# Configurações (personalizáveis)
LIMITE_ALERTA=80          # % de uso para disparar alerta
ARQUIVO_LOG="/var/log/ram_monitor.log"  # Caminho do log

# Cores para terminal
VERMELHO='\033[0;31m'
VERDE='\033[0;32m'
AMARELO='\033[1;33m'
NC='\033[0m' # No Color

# Obtém uso atual de RAM (em %)
USO_RAM=$(free | grep Mem | awk '{print $3/$2 * 100.0}' | cut -d. -f1)

# Data/hora para logs
DATA_HORA=$(date +"%Y-%m-%d %H:%M:%S")

# Verifica e gera alertas
if [ "$USO_RAM" -ge "$LIMITE_ALERTA" ]; then
    MENSAGEM="${VERMELHO}ALERTA${NC} - Uso de RAM: ${USO_RAM}% (Limite: ${LIMITE_ALERTA}%)"
    echo -e "[${DATA_HORA}] ${MENSAGEM}" | tee -a "$ARQUIVO_LOG"
    exit 1  # Código de erro para integração com cron/monitoramento
else
    MENSAGEM="${VERDE}OK${NC} - Uso de RAM: ${USO_RAM}%"
    echo -e "[${DATA_HORA}] ${MENSAGEM}" | tee -a "$ARQUIVO_LOG"
fi
# Mostra os 5 processos que mais consomem RAM (se estiver em alerta)

if [ "$USO_RAM" -ge "$LIMITE_ALERTA" ]; then
    echo -e "\n${AMARELO}TOP 5 PROCESSOS${NC}"
    ps -eo pid,%mem,comm --sort=-%mem | head -n 6
fi

exit 0
