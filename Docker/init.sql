CREATE USER admin_account WITH PASSWORD 'admin_account';

CREATE DATABASE myApp_dev;
GRANT ALL PRIVILEGES ON DATABASE myApp_dev TO admin_account;

CREATE DATABASE myApp_test;
GRANT ALL PRIVILEGES ON DATABASE myApp_test TO admin_account;
