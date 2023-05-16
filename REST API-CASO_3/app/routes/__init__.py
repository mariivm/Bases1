from flask import Flask
from app.routes import ORM, LocalesXPaisNoPool, LocalesXPaisPool

#---------------------------------------------
# Crea las rutas dentro de la APP
#---------------------------------------------

def registerBlueprints(app: Flask):
    app.register_blueprint(LocalesXPaisPool.bp)
    app.register_blueprint(LocalesXPaisNoPool.bp)
    app.register_blueprint(ORM.bp)
    
