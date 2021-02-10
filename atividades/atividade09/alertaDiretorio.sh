#!/bin/bash
# Correção: 1,5. Conta e percebe o evento de remoção/adição, mas não lista os arquivos.

temp=${1}
dir=${2}

while true
do
qnti=$(ls ${dir} | wc -l)
sleep $temp
qnta=$(ls ${dir} | wc -l)
data=$(stat ${dir1}/ |  grep Modify | cut -f1 -d'.' |sed "s/Modify://g")
    if [[ $qnti > $qnta ]]
    then
       echo "[$data] Alteração! $qnti->$qnta. Removidos: " |tee -a dirSensors.log
    fi
    if [[ $qnti < $qnta ]]
     then
          echo "[$data] Alteração! $qnti->$qnta. Adicionados: " | tee -a dirSensors.log
     fi
done
