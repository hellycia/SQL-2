sudo pacman -S mariadb
sudo mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
sudo systemctl start mysqld
mysql_secure_installation
sudo mysql exo2 < sql/creation_database.sql
sudo mysql exo2 < sql/creation_table.sql
sudo mysql exo2 < sql/insertion.sql
