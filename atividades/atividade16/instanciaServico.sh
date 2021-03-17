#!/bin/bash
 
 IMAGEM=”ami-042e8287309f5df032” 
 GRUPO=$(aws ec2 create-security-group --group-name "scripts” --description "grupo de scripts"  --output text)
 SUBREDE$(aws ec2 describe-subnets --query "Subnets[0].SubnetId" --output text)
 nomedachave=${1}
 
aws ec2 authorize-security-group-ingress --group-id $grupoSecurity --protocol tcp --port 22 --cidr 0.0.0.0/0 
 aws ec2 authorize-security-group-ingress --group-id $grupoSecurity --protocol tcp --port 80 --cidr 0.0.0.0/0
 
 INSTANCIA=$(aws ec2 run-instances --image-id $iIMAGEM--instance-type "t2.micro" --key-name $nomedachave --security-group-ids $GRUPO --subnet $SUBREDE --user-data file://test.sh --query "Instances[0].InstanceId" --output text)

 echo "Criando servidor de monitoramento em CRON..."
 while [ true ]
 do
STATUS=$(aws ec2 describe-instances --instance-id $INSTANCIA --query "Reservations[0].Instances[].State.Name" --output text)
 
     if [ $STATUS = "running" ]
     then
         echo 'Instancia em estado' '"'$STATUS"' 
         iIP=$(aws ec2 describe-instances --instance-id $INSTANCIA --query "Reservations[0].Instances[].PublicIpAddress" --output text)
         echo "Acesse: http://"$IP"/"
         break
     else
         continue
     fi    
 done

#!/bin/bash
 apt-get install apache2
 chmod 777 /var/www/html/index.html
 
 cat << EOF > /usr/local/bin/monitar.sh
 #!/bin/bash
printf " \n" >> /usr/local/bin/texto.txt
 printf "<h3>""Horario e Data da coleta:\n""</h3>" >> /usr/local/bin/texto.txt
 printf "<h6>" >> /usr/local/bin/texto.txt
 date '+%H:%M:%S %d-%m-%Y' >> /usr/local/bin/texto.txt
 printf "</h6>" >> /usr/local/bin/texto.txt
 printf "<h3>""Tempo de atividade da maquina:\n""</h3>" >> /usr/local/bin/texto.txt
 printf "<h6>" >> /usr/local/bin/texto.txt
 uptime -p >> /usr/local/bin/texto.txt
 printf "</h6>" >> /usr/local/bin/texto.txt
 printf "<h3>""Carga média do sistema: \n""</h3>" >> /usr/local/bin/texto.txt
 printf "<h6>" >> /usr/local/bin/texto.txt
 uptime | awk '{ printf \$7 " " \$8 " " \$9 " " \$10 " " \$11 "\n"}' >> /usr/local/bin/texto.txt
 printf "</h6>" >> /usr/local/bin/texto.txt
 printf "<h3>""Quantidade de memoria livre e ocupada: \n""</h3>" >> /usr/local/bin/texto.txt
 printf "<h6>" >> /usr/local/bin/texto.txt
 free | grep Mem | awk '{ printf "Ocupado: %d, Disponivel: %d\n", \$3, \$4 }' >> /usr/local/bin/texto.txt
 printf "</h6>" >> /usr/local/bin/texto.txt
 printf "<h3>""Quantidades de Bytes e enviados atráves  da interface eth0""</h3>" >> /usr/local/bin/texto.txt
 printf "<h6>""\n" >> /usr/local/bin/texto.txt
 grep  'eth0' /proc/net/dev | awk '{ printf "Recebidos: %d, Transmitidos: %d\n", \$2, \$10 }' >> /usr/local/bin/texto.txt
 printf "</h6>""\n" >> /usr/local/bin/textoo.txt
 printf " \n" >> /usr/local/bin/texto.txt

 printf "<html>" > /var/www/html/index.html
 printf "<head>" >> /var/www/html/index.html
 printf '<meta charset="utf-8">' >> /var/www/html/index.html
 printf "</head>" >> /var/www/html/index.html
 printf "<body>" >> /var/www/html/index.html
 cat /usr/local/bin/texto.txt >> /var/www/html/index.html
 printf "</body>" >> /var/www/html/index.html
 printf "</html>" >> /var/www/html/index.html
 EOF
 
 chmod 744 /usr/local/bin/monitorar.sh
 echo "*/1 * * * * root /usr/local/bin/monitorar.sh" >> /etc/crontab
