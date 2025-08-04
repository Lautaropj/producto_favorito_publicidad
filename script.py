import pandas as pd
import pyodbc

conn = pyodbc.connect(
        'DRIVER={ODBC Driver 18 for SQL Server};'
        'SERVER=sv_name;'
        'DATABASE=db_name;'
        'Trusted_Connection=yes;'
        'TrustServerCertificate=yes;'
    )

with open("producto_favorito.sql", "r", encoding="utf-8") as file:
    query = file.read()
    
clientes = pd.read_sql_query(query, conn)
clientes.to_csv("clientes.csv",index=False, sep=';')

productos = pd.read_csv("productos.csv", sep=';')

merged = clientes.merge(productos, on="cod_producto")
merged.to_csv("clientes_y_productos_merged.csv", index=False)

