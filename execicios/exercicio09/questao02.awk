#Correção: OK
BEGIN {
  cont = 0 
}
/@gmail.com/ {
   cont = cont + 1
}
END {
  print cont
}
