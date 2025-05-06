import sys
import os
sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))

from db import agents_collection
import bcrypt

email = "agent@test.com"
password_plain = "123456"
hashed_pw = bcrypt.hashpw(password_plain.encode(), bcrypt.gensalt())

agents_collection.insert_one({
    "email": email,
    "password": hashed_pw,
    "role": "agent"
})

print("✅ Agent inséré avec succès depuis /agent.")
