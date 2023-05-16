from app.repositories.models import db, Locales, Actores, Direccion, Pais,tipoActor
from app.repositories.localesPais_repository import createConnection
from sqlalchemy.orm import sessionmaker

#---------------------------------------------
# Repositorio encargado de almacenar funcionalidades
# Funcion encargada de crear la conexion y ejecutar el querys
#---------------------------------------------

def getLocalesPaisORM():

    engine = createConnection(False)
    Session = sessionmaker(bind=engine)
    session = Session()
 
    query = session.query(Locales.localId, Pais.nombre.label('Pais'), Actores.descripcion.label('Actor')).\
    join(Actores, Actores.actorId == Locales.actorId).\
    join(Direccion, Locales.direccionId == Direccion.direccionId).\
    join(Pais, Direccion.paisId == Pais.paisId).\
    filter(Actores.actorId == 2, Pais.paisId == 3).\
    order_by(Locales.localId.asc())

    result = session.execute(query)
    session.close()
    result = query.all()

    resultDict = []
    for res in result:
        resultDict.append({"LocalId": res[0],\
                           "Pais":res[1],\
                            "Empresa":res[2]})
    return resultDict
