from flask import Flask

# flask app
app = Flask(__name__)

from app import routes
