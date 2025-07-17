#!/bin/bash

# Script de backup simples
# Autor: [Bruno Pirozzi Venancio]
# Descrição: Compacta o diretório /etc e salva em /backup com data e hora

# Configurações
ORIGEM="/etc"                             # Pasta a ser backupeada
DESTINO="/backup"                         # Onde o backup será guardado
DATA_HORA=$(date +"%Y%m%d-%H%M%S")  
NOME_ARQUIVO="bkp-etc-$DATA_HORA.tar.gz"  

# Cria a pasta de backup se não existir
if [ ! -d "$DESTINO" ]; then  
    mkdir -p "$DESTINO" || {  
        echo "[ERRO] Não foi possível criar $DESTINO"  
        exit 1  
    }  
fi  

# Verifica se a origem existe
if [ ! -d "$ORIGEM" ]; then  
    echo "[ERRO] Pasta $ORIGEM não encontrada!"  
    exit 1  
fi  

# Gera o backup
echo ">> Criando backup de $ORIGEM..."  
if tar -czf "$DESTINO/$NOME_ARQUIVO" "$ORIGEM"; then  
    echo "Backup salvo em: $DESTINO/$NOME_ARQUIVO"  
else  
    echo "[ERRO] Falha ao compactar $ORIGEM!"  
    exit 1  
fi  

# Fim
exit 0
