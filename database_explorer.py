import os
import mysql.connector
import pandas as pd
from dotenv import load_dotenv


load_dotenv()


def carregar_query(caminho):
    with open(caminho, "r", encoding="utf-8") as arquivo:
        return arquivo.read()


connection = mysql.connector.connect(
    host=os.getenv("DB_HOST"),
    user=os.getenv("DB_USER"),
    password=os.getenv("DB_PASSWORD"),
    database=os.getenv("DB_NAME")
)


query_database_schema = carregar_query(
    "queries/database_schema.sql"
)

df_schema = pd.read_sql(
    query_database_schema,
    connection
)

df_schema.to_csv(
    "docs/database_schema.csv",
    index=False
)

print(df_schema.head(50))

connection.close()