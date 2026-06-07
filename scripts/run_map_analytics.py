import os
import pandas as pd
from dotenv import load_dotenv
from sqlalchemy import create_engine


load_dotenv()


def carregar_query(caminho):
    with open(caminho, "r", encoding="utf-8") as arquivo:
        return arquivo.read()


host = os.getenv("DB_HOST")
user = os.getenv("DB_USER")
password = os.getenv("DB_PASSWORD")
database = os.getenv("DB_NAME")

engine = create_engine(
    f"mysql+pymysql://{user}:{password}@{host}/{database}"
)


query = carregar_query(
    "../queries/analytics/maps/[query_name].sql"
)

df = pd.read_sql(
    query,
    engine
)

print(df)