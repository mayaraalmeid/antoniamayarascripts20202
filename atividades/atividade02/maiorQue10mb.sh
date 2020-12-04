cat > maiorQue10mb.sh
mkdir maiorQue10
find -size +10M -exec mv {} /maiorQue10 \;
tar -czvf maiorQue10.tar.gz maiorQue10/
rm -r maiorQue10
^D
