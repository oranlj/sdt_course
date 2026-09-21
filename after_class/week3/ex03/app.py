import os

from flask import Flask, jsonify
from redis import Redis

app = Flask(__name__)
cache = Redis(host=os.getenv("REDIS_HOST", "redis"), port=6379, decode_responses=True)


@app.get("/")
def index():
    visits = cache.incr("visits")
    return jsonify(message="Hello from Docker Compose", visits=visits)
