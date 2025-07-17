#!/bin/bash

# Script pra verificar se sites tão respondendo
# Feito por: [Bruno Pirozzi Venancio]

LISTA_SITES=(
    "https://google.com"
    "https://github.com"
    "http://localhost:3000"
)

for site in "${LISTA_SITES[@]}"; do
    
                                                    # Tenta pegar o cabeçalho pra ver se tá vivo
    if curl -s -I "$site" | grep -q "200 OK"; then
        echo "Tudo certo! $site tá rodando"
    else
        echo "Falha! $site não respondeu (ou deu erro)"
    fi

                                                    # Pausa rápida pra não sobrecarregar
    sleep 1

done

echo ""
echo "Verificação concluída!"
