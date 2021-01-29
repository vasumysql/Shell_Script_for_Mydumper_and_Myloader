mysql --login-path=<dbname> -A test -se "select table_name from table_info" | while IFS= read -r table
do
mydumper --host=<mysql_db_host_name> --user=<db_user_name> --password=<db_password> --database=<dbname> --outputdir=/home/backup/tables_backup  -T $table --no-views  --build-empty-files --threads=1  --no-backup-locks --less-locking --statement-size=100000000 -G -E -R -k
done
