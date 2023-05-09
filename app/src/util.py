import pandas as pd 
import numpy as np
import datetime
import os

def convert_date(x):
    d = datetime.datetime.strptime(x[:28], "%a %d %b %H:%M:%S %Z %Y")
    d = datetime.datetime.strftime(d, "%Y-%m-%d %H:%M:%S")
    return d 

def read_temp():
    """
    path: "/home/mriveralanas/projects/rbpi_system_monitor/app/static/data/sample_data.txt"
    """
    path = "{}/app/static/data/sample_data.txt".format(os.getcwd())
    with open(path) as f:
        data=f.read().splitlines()
    # extract dates 
    date_list = list(map(lambda x: convert_date(x), data))
    # extract temp 
    temp_list = list(map(lambda x: x[-4:], data))
    # df 
    df = pd.DataFrame({"Datetime":date_list, "Temperature":temp_list})
    return df

if __name__ == "__main__":
    df=read_temp()
    df.to_json('/home/mriveralanas/projects/rbpi_system_monitor/app/static/data/monitor_temp.json', 
               orient='records', 
               lines=False)

