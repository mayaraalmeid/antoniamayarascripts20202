# Correção: OK. 1,0 Ponto. Mas preste atenção ^D no final. Ao executar esse scripts no terminal, daria erro.
# Também é melhor se acostumar a colocar #!/bin/bash no começo de todo script.
mkdir maiorQue10
find -size +10M -exec mv {} /maiorQue10 \;
tar -czvf maiorQue10.tar.gz maiorQue10/
rm -r maiorQue10
^D
