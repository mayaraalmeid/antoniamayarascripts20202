#!/bin/bash
# Não OK. Não consigo adicionar. 0,5

function adicionar() {
        echo "$host;$ip" >> host.db
}

function remover() {
        sed -i '/^'$host';/d' host.db
}

function listar() {
       cat host.db

}


hostname=0
ip=0

while getopts "a:idl" OPTVAR
do
        if [ "$OPTVAR" = "l" ] 
        then
                listar
	# este teste -a %OPTARG está impossibilitando seu script de funcionar. Você deveria
        # ter usado o teste para verificiar de $OPTARG era não nula e aí compor com -a.	
        elif [ "$OPTVAR" = "d" -a $OPTARG ] 
 	then
                remover $OPTARG
        elif [ "$OPTVAR" = "a" -a $OPTARG ]
	then
                hostname=$OPTARG
        elif [ "$OPTVAR" = "i" -a $OPTARG ]
	then
                ip=$OPTARG
        fi
        if [ "$hostname" != 0 -a "$ip" != 0 ] 
        then
                adicionar $hostname $ip
        fi

done
