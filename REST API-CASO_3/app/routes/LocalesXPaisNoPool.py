from flask import Blueprint, jsonify
from app.controllers import localesPais_controller


bp = Blueprint('LocalesXPaisNoPool', __name__, url_prefix='/LocalesXPaisNoPool')

@bp.route('/', methods=['POST'])
def getLocalesXPaisNoPool():

    result = localesPais_controller.getLocalPorPais(False)
    
    return jsonify(result)