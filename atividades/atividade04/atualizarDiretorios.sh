#!/bin/bash
ed 's/home/srv/g' ../../../../../../etc/passwd | sed 's/alunos/students/g' > passwd.new
