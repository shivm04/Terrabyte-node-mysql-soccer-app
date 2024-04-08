#!/bin/bash

sudo apt install mysql-server -y
sudo systemctl start mysql.service
sudo systemctl enable mysql.service 
sudo mysql_secure_installation

#!/bin/bash

# Ensure MySQL is installed
if ! command -v mysql &> /dev/null; then
    echo "MySQL is not installed. Please install MySQL first."
    exit 1
fi

# Prompt user if they want to run SQL queries
read -p "Do you want to execute the SQL queries? (yes/no): " choice
case "$choice" in
  yes|YES|Yes)
    # Replace 'password' with your MySQL root password
    mysql -u root -p -e "
      ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'Shivam@123';
      FLUSH PRIVILEGES;
      CREATE DATABASE IF NOT EXISTS socka;
      USE socka;
      CREATE TABLE IF NOT EXISTS players (
          id int(5) NOT NULL AUTO_INCREMENT,
          first_name varchar(255) NOT NULL,
          last_name varchar(255) NOT NULL,
          position varchar(255) NOT NULL,
          number int(11) NOT NULL,
          image varchar(255) NOT NULL,
          user_name varchar(20) NOT NULL,
          PRIMARY KEY (id)
      ) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1;
    "
    ;;
  no|NO|No)
    echo "SQL queries execution skipped."
    ;;
  *)
    echo "Invalid choice. Exiting."
    exit 1
    ;;
esac
