# Identificación de Producto Favorito por Cliente para campañas de publicidad por email
Este proyecto permite identificar el producto favorito de cada cliente a partir de su historial de compras, y generar un archivo CSV con información útil para futuras campañas personalizadas, reportes o análisis de comportamiento de compra.

La consulta SQL utiliza una **CTE (Common Table Expression)** para organizar y simplificar la lógica que calcula el producto más comprado por cliente.

## 📊 Objetivo
Determinar, para cada cliente, el producto que más veces compró, con el fin de:
- Conocer las preferencias individuales
- Optimizar estrategias de marketing o fidelización
- Enriquecer la base de datos de clientes

## 🗃️ Contenido del repositorio
- `producto_favorito.sql`: Consulta SQL que identifica el producto favorito por cliente.
- `clientes.csv`: Archivo generado desde Python al ejecutar una consulta SQL sobre la base de datos, con los productos favoritos por cliente.
- `productos.csv`: Archivo externo con datos complementarios de productos (como URL e imagen).
- `clientes_y_productos_merged.csv`: Archivo final combinado, listo para usar.
- `script.py`: Script en Python que ejecuta la consulta SQL, exporta los datos y realiza la fusión con la información de productos.

## ⚙️ Requisitos
- Python 3
- Librerías: `pandas`, `pyodbc`
- Conexión a una base de datos SQL Server

```bash
python script.py
