from flask import Flask
#from app.src import read_temp

# flask app
app = Flask(__name__)
app.config["TEMPLATES_AUTO_RELOAD"] = True

from app import routes
