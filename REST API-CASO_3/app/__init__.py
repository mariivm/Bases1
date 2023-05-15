from flask import Flask
from app.routes import registerBlueprints


def createApp():
    app = Flask(__name__)
  
    registerBlueprints(app)
    return app