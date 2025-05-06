from flask import Blueprint, request, jsonify
from flask_jwt_extended import create_access_token
from db import agents_collection
import bcrypt

auth_bp = Blueprint('auth', __name__)

@auth_bp.route('/login', methods=['POST'])
def login():
    data = request.get_json()
    email = data.get('email')
    password = data.get('password')

    agent = agents_collection.find_one({"email": email})
    if not agent or not bcrypt.checkpw(password.encode('utf-8'), agent["password"]):
        return jsonify({"msg": "Invalid credentials"}), 401

    token = create_access_token(identity=str(agent["_id"]))
    return jsonify({"token": token, "role": agent.get("role", "agent")})
