sudo pacman -S mariadb
sudo mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
sudo systemctl start mysqld
mysql_secure_installation
sudo mysql exercice < sql/creation_database.sql
sudo mysql exercice < sql/creation_table.sql
sudo mysql exercice < sql/insertion.sql
