from app.repositories.localesPais_repository import getLocalesPais

#---------------------------------------------
# Se encarga de la logica de los datos
# Conecta con el repository que se encarga de la conexion y la consulta del (SP)
#---------------------------------------------

def getLocalPorPais(pool):
    return getLocalesPais(pool)
