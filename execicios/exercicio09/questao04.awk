#Correção: OK
BEGIN {
 som = 0
}
$2 > 5000 {
  som = som + $2
}
END {
  print som
}
