#!/bin/bash
sed 's/nota\|notafinal/U/g ' atividade04.py
sed -i '4i import * from time' atividade04.py 
sed -i '$a print(time.ctime())' atividade04.py 
