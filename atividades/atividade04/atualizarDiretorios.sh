#!/bin/bash
# Correção: 0,5

# Para que tantos ..? Bastava /etc/passwd. Outra coisa, o primeiro comando troca todos os "home" por "srv". O "/home/ubuntu" seria trocado por "/srv/ubuntu", o que não deve
# ocorrer.
sed 's/home/srv/g' ../../../../../../etc/passwd | sed 's/alunos/students/g' > passwd.new
