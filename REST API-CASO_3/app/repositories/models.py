from sqlalchemy import Column, BOOLEAN,Integer, String, ForeignKey
from flask_sqlalchemy import SQLAlchemy

#---------------------------------------------
# Declaracion de las tablas como objetos para el ORM y realizar las consultas
#---------------------------------------------
db = SQLAlchemy()

#---------------------------------------------
# Mapeo de las tablas de sql utilizando sqlalchemy
#---------------------------------------------

#Mapeo de la tabla LOCALES
class Locales(db.Model): 
    __tablename__ = "localesXproductor"
    localId  = Column(Integer, primary_key=True)
    name = Column(String(30))
    actorId= Column(Integer, ForeignKey("Actores.actorId"))
    enabled= Column(BOOLEAN)
    direccionId=Column(Integer, ForeignKey("direcciones.direccionId"))

#Mapeo de la tabla ACTORES
class Actores(db.Model):
    __tablename__ = "actores"
    actorId = Column(Integer, primary_key=True)
    descripcion = Column(String(45))
    tipoActorId = Column(Integer, ForeignKey("TipoActores.countryid"))

#Mapeo de la tabla DIRECCIONES
class Direccion(db.Model):
    __tablename__ = "direcciones"
    direccionId = Column(Integer, primary_key=True)
    paisId = Column(Integer, ForeignKey("Paises.paisId"))
    codigoPostal=(Integer)

#Mapeo de la tabla PAISES
class Pais(db.Model):
    __tablename__ = "paises"
    paisId = Column(Integer, primary_key=True)
    nombre = Column(String(45))
    
#Mapeo de la tabla TIPOACTOR
class tipoActor(db.Model):
    __tablename__ = "tipoActores"
    tipoActorId = Column(Integer, primary_key=True)
    descripcion = Column(String(50))
    
