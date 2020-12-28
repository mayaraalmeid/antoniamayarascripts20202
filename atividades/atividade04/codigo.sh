#!/bin/bash
# Correção: 0,5
# Faltou o primeiro comando.

# Colocou um U?
sed 's/nota\|notafinal/U/g ' atividade04.py

# OK.
sed -i '4i import * from time' atividade04.py

# Não cuidou da identação do Python.
sed -i '$a print(time.ctime())' atividade04.py 
