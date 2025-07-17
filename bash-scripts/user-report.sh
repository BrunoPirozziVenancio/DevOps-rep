#!/bin/bash
# -------------------------------------------------------------------
# Script de Auditoria de Usuários
# -------------------------------------------------------------------

# Configurações de cores (modo texto apenas)
COR_ATIVO="\033[1;32m"    # Verde brilhante
COR_INATIVO="\033[1;31m"   # Vermelho brilhante
COR_ALERTA="\033[1;33m"    # Amarelo brilhante
COR_PADRAO="\033[0m"       # Resetar cores

# Configurações de limiares (dias)
ALERTA_INATIVIDADE=30       # Amarelo para > 30 dias
CRITICO_INATIVIDADE=90      # Vermelho para > 90 dias

# Função para aplicar cores baseadas no status
aplicar_cor() {
  local dias=$1
  local usuario=$2
  local status=$3

  if [ "$status" = "N/A" ]; then
    echo -e "${COR_ALERTA}${usuario}${COR_PADRAO} (sem dados)"
  elif [ "$dias" -gt "$CRITICO_INATIVIDADE" ]; then
    echo -e "${COR_INATIVO}${usuario} (INATIVO: ${dias}d)${COR_PADRAO}"
  elif [ "$dias" -gt "$ALERTA_INATIVIDADE" ]; then
    echo -e "${COR_ALERTA}${usuario} (ALERTA: ${dias}d)${COR_PADRAO}"
  else
    echo -e "${COR_ATIVO}${usuario} (ativo: ${dias}d)${COR_PADRAO}"
  fi
}

# Cabeçalho colorido
echo -e "\n${COR_PADRAO}🔍 ${COR_ATIVO}Relatório de Usuários${COR_PADRAO} - $(date)"
echo -e "-------------------------------------------------------"

# Processa cada usuário
grep -E '/bin/(bash|sh|zsh)' /etc/passwd | cut -d: -f1 | while read usuario; do
  login_info=$(lastlog -u "$usuario" 2>/dev/null | tail -n +2)
  
  if [ -z "$login_info" ]; then
    aplicar_cor "999" "$usuario" "N/A"
  else
    data_login=$(echo "$login_info" | awk '{print $5" "$6" "$7" "$8" "$9}')
    data_epoch=$(date -d "$data_login" +%s 2>/dev/null)
    
    if [ -n "$data_epoch" ]; then
      dias_inativo=$(( ($(date +%s) - data_epoch) / 86400 ))
      aplicar_cor "$dias_inativo" "$usuario" "$status"
    else
      aplicar_cor "999" "$usuario" "N/A"
    fi
  fi
done

# Rodapé explicativo
echo -e "\n${COR_PADRAO}-------------------------------------------------------"
echo -e "${COR_ATIVO}Legenda:"
echo -e "  ${COR_ATIVO}Verde: Ativo (≤ ${ALERTA_INATIVIDADE}d)"
echo -e "  ${COR_ALERTA}Amarelo: Alerta (${ALERTA_INATIVIDADE}-${CRITICO_INATIVIDADE}d)"
echo -e "  ${COR_INATIVO}Vermelho: Crítico (> ${CRITICO_INATIVIDADE}d)"
echo -e "  ${COR_ALERTA}Amarelo: Sem dados de login${COR_PADRAO}"
echo -e "-------------------------------------------------------\n"
