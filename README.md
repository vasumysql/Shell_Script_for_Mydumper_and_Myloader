# Shell_Script_for_Mydumper_and_Myloader
Shell Script for backup based on your requirement by using Mydumper and Myloader

Procedure for shell script by using Mydumper and Myloader

Request to particular tables [ Prefix ]  take a backup from required MySQL Database.

Step -1  - Connect to the Source RDS / DB  and run the below command in test schema.

use test;
CREATE TABLE table_info (`table_name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '') ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

Step - 2 -  Run the below insert statement under test schema.

use test;
insert into table_info select table_name from information_schema.tables where table_schema = 'dbname' and table_name like 'tablename%';

Step - 3 

Use the shell script and take backup of required tables and restore.

In linux box / MySQL DB server , you can run the script like this 

chmod +x script.sh

./script.sh

Step - 4

Once Backup is success , please use the below command to restore in target DB by using myloader utility

time myloader -h <target_db_server_name> -u <db_user_name> -p <db_password> --database=<db_name> -t 5 -d /home/backup/tables_backup

---
Enjoy .....
