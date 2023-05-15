from flask import Flask
from app.routes import LocalesXPaisNoPool, LocalesXPaisPool

def registerBlueprints(app: Flask):
    app.register_blueprint(LocalesXPaisPool.bp)
    app.register_blueprint(LocalesXPaisNoPool.bp)
    
