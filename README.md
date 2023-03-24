# Infraestrutura-como-Código-Script-de-Criação-de-Estrutura-de-Usuários
Repositório dedicado ao armazenamento do Desafio de Código -> Infraestrutura como Código: Script de Criação de Estrutura de Usuários, 

Consiste em um script responsável pela criação de usuarios, grupos, e definição de permissões desses grupos criados sobre quatro repositorios:
#publico sec adm ven

Os grupos e usuarios a serem criados pelo script são passados ao mesmo por meio de um arquivo .csv chamado 'usuarios.csv', onde é construido uma tabela,
cujas colunas são separadas por virgula(,) por exemplo:
O nome de cada grupo é passado na primeira linha e o nome do usuário deve ser passado na mesma coluna ao qual pertence.

#GRUPO_1,GRUPO_2,GRUPO_3#
#USR1_G1,USR2_G2,USR3_G3#
#USR4_G1,USR5_G2,USR6_G3#
#USR7_G1,USR8_G2,USR9_G3#

O sistema operacional utilizado para este script foi Linux Ubuntu 20.04.6 Live Server.
