IMAGEM=”ami-042e8287309f5df032”
GRUPO=$(aws ec2 create-security-group --group-name “scripts” --description “grupo de seguranca scripts” --output text)
SUBREDE=$(aws ec2 describe-subnets --query “Subnets[0].SubnetId” --output text)
nomedachave= ${1}

aws ec2 authorize-security-group-ingress --group-id $GRUPO --protocol tcp --port 22 cird 0.0.0.0/0
aws ec2 authorize-security-group-ingress --group-id $GRUPO --protocol tcp --port 80 cird 0.0.0.0/0
INSTANCIA=$(aws ec2 run-instances --image-id $IMAGEM --instance-type t2.micro --key-name $nomedachave --segurity-group-ids $GRUPO --subnet-id $SUBREDE)

echo “Criando servidor de monitoramento...”
IP=$(aws ec2 describe-instances --instances-id $iINSTANCIA --query “Reservations[0].Instances[0].PublicIpAddress” --output text)
sudo su -
apt install apache2
echo “Acesse: HTTP://$IP/

cat << EOF >script.service
[Unit]
After=network.target
[Service]
ExecStart=/usr/local/bin/monitorar.sh
[Install]
WantedBy=default.target
EOF
systemctl deamon-reload
systemctl enable script.service


