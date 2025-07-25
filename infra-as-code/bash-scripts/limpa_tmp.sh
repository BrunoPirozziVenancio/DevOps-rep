#!/bin/bash

# ----------------------------------------------------------
# Descrição: Remove arquivos temporários antigos do /tmp
# Autor: [Seu Nome]
# Versão: 1.1
# ----------------------------------------------------------

# Configurações
DIRETORIO="/tmp"
DIAS=2
LOG_FILE="/var/log/limpeza_tmp.log"

# Cores para terminal
VERMELHO='\033[0;31m'
VERDE='\033[0;32m'
AZUL='\033[0;34m'
NC='\033[0m' # No Color

# Verifica se é root
if [ "$(id -u)" -ne 0 ]; then
    echo -e "${VERMELHO}Erro: Este script precisa ser executado como root!${NC}" >&2
    exit 1
fi

# Cabeçalho
echo -e "\n${AZUL}=== LIMPEZA DE ARQUIVOS TEMPORÁRIOS ===${NC}"
echo -e "Diretório: ${VERDE}$DIRETORIO${NC}"
echo -e "Removendo arquivos com mais de: ${VERDE}$DIAS dias${NC}"
echo -e "Registro em log: ${VERDE}$LOG_FILE${NC}\n"

# Executa a limpeza
echo -e "${AZUL}Iniciando limpeza...${NC}"

# Modo seguro - lista primeiro os arquivos que serão removidos
if [ "$1" == "--dry-run" ]; then
    echo -e "${AZUL}MODO DE TESTE (não remove arquivos)${NC}"
    find "$DIRETORIO" -type f -mtime +$DIAS -exec echo "[TESTE] Remover: {}" \;
    total=$(find "$DIRETORIO" -type f -mtime +$DIAS | wc -l)
else
    # Modo real de execução
    total=$(find "$DIRETORIO" -type f -mtime +$DIAS -exec rm -fv {} \; | tee -a "$LOG_FILE" | wc -l)
fi

# Resumo
echo -e "\n${AZUL}=== RESUMO ===${NC}"
echo -e "Total de arquivos removidos: ${VERDE}$total${NC}"
echo -e "Data/hora: $(date)" | tee -a "$LOG_FILE"
echo -e "${VERDE}Limpeza concluída com sucesso!${NC}\n"

exit 0
