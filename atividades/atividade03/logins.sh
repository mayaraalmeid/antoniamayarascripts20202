#!/bin/bash
grep -E 'programacaoscripts [^sshd] auth.log.1
grep -E 'sshd.*Accepted' auth.log.1
grep -E 'sshd.root' auth.log.1
grep -E 'Dec[[:space:]]*4 (18|19).*Accepted' auth.log.1
