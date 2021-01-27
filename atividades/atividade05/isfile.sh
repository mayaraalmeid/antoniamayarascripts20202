#!/bin/bash
# Correção: 1,0
tipo=${1}

if test -f ${tipo}
then 
       echo "É um arquivo."

else 
      echo "É um diretorio."
fi

if test -r ${tipo}
then
      echo "Tem permissão de leitura."
else
      echo "Não tem permissao de leitura."
fi

if test -w ${tipo}
then 
      echo "Tem permissão de escrita."
else
      echo "Não tem permissão de escrita."
fi
