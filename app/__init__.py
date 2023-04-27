from flask import Flask
#from app.src import read_temp

# flask app
app = Flask(__name__)

from app import routes
