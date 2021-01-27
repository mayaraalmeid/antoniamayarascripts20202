#!/bin/bash
opt=${1}
cor=${2}
lc=${3}
tex=${4}

lin=$(echo ${lc} | cut -f1 -d',')
colu=$(echo ${lc} | cut -f2 -d',')
if test $opt = 'negrito'
then
	tput bold
	tput setaf ${cor}
	tput cup $lin $colu
	echo ${tex}
fi
if test $opt = 'sublinhado'
then
	tput smul
	tput setaf ${cor}
        tput cup $lin $colu
        echo ${tex}
fi
if test $opt = 'reverso'
then
	tput smso
	tput setaf ${cor}
        tput cup $lin $colu
        echo ${tex}
fi

tput cup $lin $colu
echo "${tex}"
