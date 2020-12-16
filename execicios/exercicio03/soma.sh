#!/bin/bash
# Correção: Chegou até o terceiro.
cat compras.txt | cut -f2 -d" " compras.txt | tr '\n' '+'
