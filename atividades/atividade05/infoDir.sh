#!/bin/bash
# Correção: 1,0
diretorio=${1}

if test -d ${diretorio}
then
       echo "O diretorio ${diretorio} ocupa $(du -s ${diretorio}|sed 's/[[:space:]]/:/g' | cut -f1 -d':') kilobytes e tem $(ls  ${diretorio} | wc -l ) itens."
else
       echo "${diretorio} não é um diretorio."
fi
