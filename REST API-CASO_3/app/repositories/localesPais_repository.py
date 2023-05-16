from sqlalchemy import create_engine, text
from sqlalchemy.pool import NullPool

#---------------------------------------------
# Función encargada de realizar la conexion con la base de datos
#---------------------------------------------

def createConnection(pool):
    username = "sa"
    password = "123"
    server = "localhost"
    port = "1433"
    db = "elementalGDB"
    driver = "ODBC Driver 17 for SQL Server"
    if pool:
        engine = create_engine(f"mssql+pyodbc://{username}:{password}@{server}:{port}/{db}?driver={driver}", pool_size=5, max_overflow=10)
    else:
        engine = create_engine(f"mssql+pyodbc://{username}:{password}@{server}:{port}/{db}?driver={driver}", poolclass=NullPool)
    return engine

#---------------------------------------------
# Función encargada de crear la conexion con la base de datos y llamar al (SP)
#---------------------------------------------

def getLocalesPais(pool):
    engine = createConnection(pool)
    query = text("EXEC localesXpais")
    with engine.connect() as connection:
        execResult = connection.execute(query)
        llaves = execResult.keys()
        resultSP = [dict(zip(llaves, row)) for row in execResult.fetchall()]
        connection.close()
        return resultSP
    
