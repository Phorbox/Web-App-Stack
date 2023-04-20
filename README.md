# instant-web-app

To stand up a php-fpm, nginx, and mysql server, use the bash script. it is located in phpfpm-nginx-mysql/bash.

Put the folder in a the home directory of a ubuntu machine and run "sudo makit.sh 'fqdn' 'mysqlPassword'". It only creates self signed certs so its not suitable for deployment. 


To use the dockercompose file, run docker build. Make sure your source code is in "src" folder and any database schemas and .sql files are in the "schema" folder.mi