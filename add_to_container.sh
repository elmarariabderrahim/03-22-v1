#!/bin/bash

str=$(docker port test-mysql)
IFS=':'
read -ra ADDR <<< "$str"
docker_mysql_port=${ADDR[1]}
echo ${docker_mysql_port}
mysql -P $docker_mysql_port --protocol=tcp -u root -ppixid123 -Bse "drop database if exists db5;create database db5;use db5;"


input="C:\Users\Admin\Desktop\test\logfile.txt"
var=""
while IFS= read -r line
do
var="${var}$line"
done < "$input"
mysql -P $docker_mysql_port --protocol=tcp -uroot -ppixid123 -Bse "$var"


IFS=':'
for f in sql_scripts/*; do
 input="./$f"
 varrr=""
   while IFS= read -r line
     do
     varrr="${varrr}$line"
   done < "$input"
 script_name=$(echo $f| cut -d'/' -f 2)
 mysql -P $docker_mysql_port --protocol=tcp -uroot -ppixid123 -Bse "$varrr"


 if [ "$?" -eq 0 ]; then 
 echo "+++++"
	mysql -uroot -ppixid123 -Bse "use db5;insert into scripts (script_name,script_state) values('$script_name','succes');"
 else
 echo "-----"
	mysql -uroot -ppixid123 -Bse "use db5;insert into scripts (script_name,script_state) values('$script_name','failed');"
 fi
done
