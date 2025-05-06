from pymongo import MongoClient
from config import MONGO_URI

client = MongoClient(MONGO_URI)
db = client["car_rental"]

# Collections
agents_collection = db["agents"]
clients_collection = db["clients"]
reservations_collection = db["reservations"]
cars_collection = db["cars"]
