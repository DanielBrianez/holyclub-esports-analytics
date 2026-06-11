from pathlib import Path
import os

import pandas as pd
from dotenv import load_dotenv
from sqlalchemy import create_engine


load_dotenv()


BASE_DIR = Path(__file__).resolve().parent.parent

EXPORT_DIR = BASE_DIR / "dashboard" / "exports"
EXPORT_DIR.mkdir(parents=True, exist_ok=True)


def carregar_query(caminho):
    with open(caminho, "r", encoding="utf-8") as arquivo:
        query = arquivo.read().strip()

    if not query:
        raise ValueError(f"Query vazia: {caminho}")

    return query


def criar_engine():
    host = os.getenv("DB_HOST")
    user = os.getenv("DB_USER")
    password = os.getenv("DB_PASSWORD")
    database = os.getenv("DB_NAME")

    return create_engine(
        f"mysql+pymysql://{user}:{password}@{host}/{database}"
    )


engine = criar_engine()


queries = {
    "players": BASE_DIR / "queries" / "analytics" / "dashboard" / "players_dashboard.sql",
    "maps": BASE_DIR / "queries" / "analytics" / "dashboard" / "maps_dashboard.sql",
    "matches": BASE_DIR / "queries" / "analytics" / "dashboard" / "matches_dashboard.sql"
}


for nome_arquivo, caminho_query in queries.items():
    print(f"Exportando {nome_arquivo}...")

    query = carregar_query(caminho_query)

    df = pd.read_sql(query, engine)

    caminho_export = EXPORT_DIR / f"{nome_arquivo}.csv"

    df.to_csv(
        caminho_export,
        index=False,
        encoding="utf-8-sig"
    )

    print(f"Arquivo gerado: {caminho_export}")

print("Exportação finalizada com sucesso.")