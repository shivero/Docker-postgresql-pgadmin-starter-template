# Docker PostgreSQL starter template with pgAdmin4

> Starter template for Docker containing images for PostgreSQL database and pgAdmin4 - management tool for PostgreSQL. This project aims to start quick development using PostgreSQL and pgAdmin4.

## Getting started

Make sure you have **Docker Desktop** installed on your machine, then just run `docker-compose up` (from project directory) to start the containers and you are ready to go (more info below).
You can login to **pgAdmin4** via browser on `http://localhost:5050` with user `admin@admin.com` and password `admin`.

It will automatically start 2 containers defined in `docker-compose.yml` file - `pgsql_container` which is a **PostgreSQL container** and `pgadmin4_container` which is a **pgAdmin4 container**. 

>NOTE: running pgAdmin4 container depends on PostgreSQL container, so in case database container fails to startup properly, you will see error message and pgAdmin4 container won't start.


## Container configuration - PostgreSQL
1. `version: latest` - which means you will always download latest version of PostgreSQL image from Docker Hub. [More info](https://hub.docker.com/r/postgres/postgres/)
2. `port: 5432` - PostgreSQL will be listening on **port 5432**.
3. File `init.sql` - SQL script that will be executed when container starts. It contains SQL commands that will create databases and user

    Databases:
    - `myapp_dev`
    - `myapp_test`

    User with full access to created databases:
    - Username: `admin_account`
    - Password: `admin_account`

## Container configuration - pgAdmin4

1. `image: dpage/pgadmin4` - pgAdmin4 image will be downloaded from Docker Hub. [More info](https://hub.docker.com/r/dpage/pgadmin4/)
2. `port: 5050` - pgAdmin4 will start up, listening on **port 5050**.
3. Login to pgAdmin4 - open `http://localhost:5050` and you can login in using using `admin@admin.com` username and `admin` password (default pgAdmin4 username and password set in docker-compose file).:

## Project structure
1. `docker-compose.yml` - configuration file for Docker containers.
2. `Docker/init.sql` - SQL script executed when database container starts.
3. `local_pgdata` - in this directory you can put your own files that will be copied to PostgreSQL container.
4. `starting-scripts` - here you can see sample SQL script that speed up development, for example: creating tables, inserting data etc.

## 🚀 Extra - auto generate tables data with Synth
Often after you create database you will probably want to insert some data into it.
You can use Synth for that - synth is an open source tool that will generate data based on models you define (tables schema).

First, download [Synth](https://www.getsynth.com/) executable to run it from terminal.
Then define models based on your tables - model fields must match with database fields. 

> You can find sample file in `Docker\synth-data-generator\models\companies.json` - it's model for "companies" table with 3 columns - id (SQL datatype: INT), name (SQL datatype: VARCHAR), description (SQL datatype VARCHAR)

With model prepared, you can run Synth command to generate data directly into SQL tables (this scripts generates 20 000 records):
```
.\synth-windows-latest-x86_64.exe generate models/ --size 20000 --to postgres://admin_account:admin_account@localhost:5432/myapp_dev
```

## License 
This project is licensed under MIT license.
