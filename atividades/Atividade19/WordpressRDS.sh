#!/bin/bash
# Correção: 0,0. Novamente, problemas de codificação. Acredito que você simplesmente copiou a atividade passada e fez uma 
# mudança na mensagem impressa, visto que não usa o RDS. Não valerá presença. 
usuario=${1}
senha=${2}
IMAGEM=”ami-042e8287309f5df032”
GRUPO=$(aws ec2 create-security-group --group-name "scripts” --description "grupo de scripts" --output text)
SUBREDE$(aws ec2 describe-subnets --query "Subnets[0].SubnetId" --output text)
nomedahave=${3}
iprede=$(wget -qO- https://ipecho.net/plain) 

aws ec2 authorize-security-group-ingress --group-id $grupoSecurity --protocol tcp --port 22 --cidr $iprede/32
aws ec2 authorize-security-group-ingress --group-id $grupoSecurity --protocol tcp --port 80 --cidr 0.0.0.0/0
aws ec2 authorize-security-group-ingress --group-id $grupoSecurity --protocol tcp --port 3360 --source-group $GRUPO
INSTANCIA=$(aws ec2 run-instances --image-id $iIMAGEM--instance-type "t2.micro" --key-name $nomedachave --security-group-ids $GRUPO --subnet $SUBREDE --user-data file://test.sh --query "Instances[0].InstanceId" --output text)
while [ true ]
do
STATUS=$(aws ec2 describe-instances --instance-id $INSTANCIA --query "Reservations[0].Instances[].State.Name" --output text)
if [ $STATUS = "running" ]
then
    IP1=$(aws ec2 describe-instances --instance-id $INSTANCIA --query 
"Reservations[0].Instances[].PrivateIpAddress" --output text)
    echo "Criando servidor de Banco de Dados no RDS..."
break
else
    continue
fi
done

INSTANCIA2=$(aws ec2 run-instances --image-id $IMAGEM--instance-type "t2.micro" --key-name $nomedachave --security-group-ids $GRUPO --subnet $SUBREDE --user-data file://test2.sh --query "Instances[0].InstanceId" --output text)
while [ true ]
do
STATUS2=$(aws ec2 describe-instances --instance-id $INSTANCIA2 --query "Reservations[1].Instances[].State.Name" --output text)
if [ $STATUS2 = "running" ]
then
    IP2=$(aws ec2 describe-instances --instance-id $INSTANCIA2 --query "Reservations[1].Instances[].PrivateIpAddress" --output text)
    echo "Criando servidor de Aplicação..."
    echo "IP Público do Servidor de Aplicação:$IP2”
break
else
    continue
fi
done

