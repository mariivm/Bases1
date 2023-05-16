from flask import Blueprint, jsonify
from app.controllers import ORM_controller

#---------------------------------------------
# Define la ruta del endpoint ORM
#---------------------------------------------
bp = Blueprint('ORM', __name__, url_prefix="/ORM")

@bp.route("/", methods=["POST"])
def getLocalesPorPaisORM():
  
    result = ORM_controller.getLocalesXPaisORM()
    
    return jsonify(result)
