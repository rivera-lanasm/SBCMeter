from app import app
from flask import render_template

import json 
from app.src.util import read_temp

@app.route('/')
@app.route('/index')
def index():
    # user 
    user = {'username': 'Miguel'}
    # data 
   # df = read_temp()
   # print(df.head())
   # chart_data = df.to_dict(orient='records')
   # chart_data = json.dumps(chart_data, indent=2)
   # data = {'chart_data': chart_data}
    return render_template('index.html', title='Home', user=user)


@app.route('/pihealth')
def pihealth():
    user = {'username': 'Miguel'}
    return render_template('pi_health.html', title='Home', user=user)


