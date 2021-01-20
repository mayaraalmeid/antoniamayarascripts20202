#!/bin/bash

ips=${1}
echo "Relatório de Latência."
for i in $(cat ${ips})
do
     ping -c 5 "$i" >> resultIp.txt
     echo "$i $(grep avg resultIp.txt | cut -f5 -d'/')ms"
     rm resultIp.txt
done
