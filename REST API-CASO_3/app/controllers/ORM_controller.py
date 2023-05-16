from app.repositories import ORM_repository

#---------------------------------------------
# Se encarga de la logica de los datos
# Conecta con el repository que se encarga de la conexion y la consulta del ORM
#---------------------------------------------

def getLocalesXPaisORM(): 
    return ORM_repository.getLocalesPaisORM()

