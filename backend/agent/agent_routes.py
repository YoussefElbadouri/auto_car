from flask import Blueprint, request, jsonify
from flask_jwt_extended import jwt_required, get_jwt_identity
from db import clients_collection, reservations_collection

agent_bp = Blueprint('agent', __name__)

@agent_bp.route('/clients', methods=['POST'])
@jwt_required()
def add_client():
    data = request.get_json()
    client = {
        "nom": data.get("nom"),
        "prenom": data.get("prenom"),
        "telephone": data.get("telephone"),
        "cin": data.get("cin"),
        "created_by": get_jwt_identity()
    }
    clients_collection.insert_one(client)
    return jsonify({"msg": "Client ajouté avec succès"})
