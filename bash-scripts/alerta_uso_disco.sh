#!/bin/bash

# Script de monitoramento de disco
# Autor: [Seu Nome]
# Notifica quando o disco tá ficando cheio

PARTICAO="/"                 # Partição principal pra monitorar
LIMITE=80                    # Alerta se passar desse percentual

# Pega o uso atual do disco, removendo o %
USO_ATUAL=$(df -h "$PARTICAO" | awk 'NR==2 {gsub("%",""); print $5}')

# Verifica se tá acima do limite
if [ "$USO_ATUAL" -ge "$LIMITE" ]; then
    echo "⚠️  CUIDADO! $PARTICAO está com $USO_ATUAL% (limite: $LIMITE%)"
else
    echo "✓ Tudo tranquilo! $PARTICAO com $USO_ATUAL% de uso"
fi

# Dica extra: pra rodar automaticamente, colocar no cron:
# */30 * * * * /caminho/para/este/script.sh
