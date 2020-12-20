   #!/bin/bash
   sed -i 's/nota/NOTA/g ' atividade04.py | sed -i 's/Final/FINAL/g' atividade04.py
   sed -i '3i import * from time' atividade04.py
   sed -i '$a print(time.ctime())' atividade04.py 
