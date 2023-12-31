# Coraline Assignment : Postgresql Database By GCP

### Tools : Google Cloud Platform (Postgresql Database), pgAdmin 4

* Note :
    * You can download pgAdmid 4 from [Here](https://www.pgadmin.org/download/)
    * Guide for create and connect Postgresql Database GCP [Help](https://www.youtube.com/watch?v=XoUVxViWPwo)
    * Guide for append data to Postgresql Database GCP from excel files [Help](https://www.youtube.com/watch?v=qewja4j6DGQ)
 
Then, You can follow these step :

1. You can config database_credential depend on your database ( eg. host, user, password ) in json.file
     *  " *.\credential\postgresql_credentials.json* "
2. All data that you want to append to Postgresql database must be save into sales_data folder
     *  as form " *.\sales_data\xxx.csv* "

Then, you can run a python script ( *script.py* ) to append all data to Postgresql database 
and sql script ( *Q2.sql* ) for create table 'cat_reg' from question 2. 
