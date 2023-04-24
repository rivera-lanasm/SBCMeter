from app import app
from flask import render_template

@app.route('/')
@app.route('/index')
def index():
    user = {'username': 'Miguel'}
    return render_template('index.html', title='Home', user=user)


@app.route('/pihealth')
def pihealth():
    user = {'username': 'Miguel'}
    return render_template('pi_health.html', title='Home', user=user)

