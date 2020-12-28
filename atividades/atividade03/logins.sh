#!/bin/bash
# Correção: 0,8

# Aqui o uso do colchetes está estranho. Você parece está em busca de linhas que tem 'programacaoscripts' seguido de qualquer 
# caractere que não seja 's', 'h' ou 'd'. Acabou ficando muito complicado. Bastaria ter colocado o -v 'ssh'. Neste caso funciona
# porque o único outro tipo de mensagem é do CRON, mas em um servidor com mais serviços outras mensagens podem aparecer. Também
# acho que está faltando uma aspas depois da expressão regular.
grep -E 'programacaoscripts [^sshd] auth.log.1

# OK.
grep -E 'sshd.*Accepted' auth.log.1

# Está retornando vazio. Acho que você esqueceu o *. Sugiro aprender a usar o git, fazer o commit dos arquivos após
# testar a execução.
grep -E 'sshd.root' auth.log.1

# OK
grep -E 'Dec[[:space:]]*4 (18|19).*Accepted' auth.log.1
