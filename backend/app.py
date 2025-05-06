from flask import Flask
from flask_jwt_extended import JWTManager
from flask_cors import CORS
from config import SECRET_KEY

from auth.auth_routes import auth_bp
from agent.agent_routes import agent_bp
# ❌ Commente cette ligne pour désactiver la partie admin
# from admin.admin_routes import admin_bp

app = Flask(__name__)
app.config["JWT_SECRET_KEY"] = SECRET_KEY
CORS(app)

jwt = JWTManager(app)

# Enregistre uniquement les routes utiles
app.register_blueprint(auth_bp, url_prefix='/auth')
app.register_blueprint(agent_bp, url_prefix='/agent')
# ❌ Supprime temporairement l'enregistrement admin
# app.register_blueprint(admin_bp, url_prefix='/admin')

if __name__ == '__main__':
    app.run(host="0.0.0.0", port=5000, debug=True)
