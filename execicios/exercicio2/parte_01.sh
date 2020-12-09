cat > parte_01.sh
grep -E '\bA' emailsordenados.txt
grep -E '.br$' emailsordenados.txt
grep -E '[0-9][^0-9 ]' emailsordenados.txt
^D
