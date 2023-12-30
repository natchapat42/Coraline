
import os
import glob
import json
import psycopg2
import pandas as pd
from sqlalchemy import create_engine

## Import database_credentials from json.file

with open(".\credentials\postgresql_credentials.json", "r") as f:
    credentials = json.load(f)

## Find All csv.files in folder sales_data

path = ".\sales_data"
os.chdir(path)
csv_file = glob.glob('*.{}'.format("csv"))

## Add data to Postgresql Database

def appendData(files):

    for file in files :

        # Read the CSV file into a Pandas DataFrame
        df = pd.read_csv(file)

        # Create a connection to the PostgreSQL database
        engine = create_engine(f'postgresql+psycopg2://{credentials["user"]}:{credentials["password"]}@{credentials["host"]}:{credentials["port"]}/{credentials["database"]}')

        # Write the DataFrame to the database
        df.to_sql(credentials["dbtable"], engine, if_exists='append', index=False)

    print("CSV file successfully loaded into PostgreSQL")

appendData(csv_file)