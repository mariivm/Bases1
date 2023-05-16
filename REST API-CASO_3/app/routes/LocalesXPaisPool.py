from flask import Blueprint, jsonify
from app.controllers import localesPais_controller


#---------------------------------------------
# Define la ruta del endpoint Pool
#---------------------------------------------
bp = Blueprint('LocalesXPaisPool', __name__, url_prefix='/LocalesXPaisPool')


@bp.route('/', methods=['POST', "GET"])
def getLocalesXPaisPool():
    
    result = localesPais_controller.getLocalPorPais(True)
   
    return jsonify(result)
