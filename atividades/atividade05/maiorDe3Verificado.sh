#!/bin/bash
n1=${1}
n2=${2}
n3=${3}

if [[ ${n1} == [0-9] ]]
then
if [[ ${n2} == [0-9] ]]
then 
if [[ ${n3} == [0-9] ]]
then
   if test ${n1} -gt ${n2} -a ${n1} -gt ${n3}
   then
  	 echo "${n1}"
   else
   	if test ${n2} -gt ${n1} -a ${n2} -gt ${n3}
        then
      	    echo "${n2}"
        else
      	    echo "${n3}"
        fi
fi
else
  echo "Opa!!! ${n3} não é numero."
fi
else 
  echo  "Opa!!! ${n2} não é numero."
fi

else
    echo "Opa!!! ${n1} não é numero."
fi
