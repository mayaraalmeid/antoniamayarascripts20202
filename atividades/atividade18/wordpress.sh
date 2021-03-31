usuario=${1}
senha=${2}
IMAGEM=”ami-042e8287309f5df032”
GRUPO=$(aws ec2 create-security-group --group-name "scripts” --description "grupo de scripts" --output text)
SUBREDE$(aws ec2 describe-subnets --query "Subnets[0].SubnetId" --output text)
nomedahave=${3}
iprede=$(Wget -qO- https://ipecho.net/plain) 

aws ec2 authorize-security-group-ingress --group-id $grupoSecurity --protocol tcp --port 22 --cidr 1$iprede/32
aws ec2 authorize-security-group-ingress --group-id $grupoSecurity --protocol tcp --port 80 --cidr 0.0.0.0/0
aws ec2 authorize-security-group-ingress --group-id $grupoSecurity --protocol tcp --port 3360 --source-group $GRUPO

INSTANCIA=$(aws ec2 run-instances --image-id $iIMAGEM--instance-type "t2.micro" --key-name $nomedachave --security-group-ids $GRUPO --subnet $SUBREDE --user-data file://test.sh --query "Instances[0].InstanceId" --output text)

while [ true ]
do
STATUS=$(aws ec2 describe-instances --instance-id $INSTANCIA --query "Reservations[0].Instances[].State.Name" --output text)
if [ $STATUS = "running" ]
then
    IP1=$(aws ec2 describe-instances --instance-id $INSTANCIA --query "Reservations[0].Instances[].PrivateIpAddress" --output text)
    echo "Criando servidor de Banco de Dados..."
    echo "IP Público do Banco de Dados:$IP1"
break
else
    continue
fi
done
cat<<EOF > test.sh
#!/bin/bash
apt update
apt-get install -y mysql-server

sed -ri 's\*bind-address.*=127.0.0.1/bind-address = 0.0.0.0/0' /etc/mysql/mysql.conf.d/mysqld.cnf

systemctl restart mysql.service

    
INSTANCIA2=$(aws ec2 run-instances --image-id $IMAGEM--instance-type "t2.micro" --key-name $nomedachave --security-group-ids $GRUPO --subnet $SUBREDE --user-data file://test2.sh --query "Instances[0].InstanceId" --output text)

while [ true ]
do
STATUS2=$(aws ec2 describe-instances --instance-id $INSTANCIA2 --query "Reservations[0].Instances[].State.Name" --output text)
if [ $STATUS2 = "running" ]
then
    IP2=$(aws ec2 describe-instances --instance-id $INSTANCIA2 --query "Reservations[0].Instances[].PrivateIpAddress" --output text)
    echo "Criando servidor de Aplicação..."
           echo "IP Público do Servidor de Aplicação:$IP2”
break
else
    continue
fi
done











