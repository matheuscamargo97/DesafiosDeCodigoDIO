#!/bin/bash

echo "Criando Diretórios..."
mkdir publico adm ven sec

echo "Lendo Arquivo CSV"
let line_number="$(awk 'BEGIN{print ARGV[1]}' $(wc -l usuarios.csv))"
max_columns=0
cur_ncolumn=0
cont=1
while [ $cont -lt $line_number ]; do
    let cur_ncolumn="$(awk -F, '(NR=='$cont'){print NF}' usuarios.csv)"
    if [ $cur_ncolumn -gt $max_columns ]; then
    let max_columns=cur_ncolumn
    fi
    let cont=cont+1
done

echo "O número de linhas do arquivo CSV é de $line_number e o numero maximo de colunas em uma linha é de $max_columns"

let max_columns=max_columns+1
let line_number=line_number+1

echo "Criando Grupos..."
for ((i=1;i<$max_columns;i++)); do
    groupadd "$(awk -F, '(NR==1){print$'$i'}' usuarios.csv)"
done

echo "Criando Usuários e Atribuindo aos respectivos grupos..."
for ((j=1;j<$max_columns;j++)); do
    for ((k=2;k<$line_number;k++)); do
        useradd "$(awk -F, '(NR=='$k'){print$'$j'}' usuarios.csv)" -s /bin/bash -p $(openssl passwd Senha123) -G "$(awk -F, '(NR==1){print$'$j'}' usuarios.csv)"
     done
done

echo "Atribuindo titularidade sobre os diretórios e atribuindo grupos aos diretórios..."

chown root:GRP_ADM ./adm
chown root:GRP_VEN ./ven
chown root:GRP_SEC ./sec

echo "Definindo permissões sobre os diretórios"
chmod 770 ./adm
chmod 770 ./ven
chmod 770 ./sec
chmod 777 ./publico

echo "fim..."