

### Notes from miguelgrinberg guide 

#### Part 1
- one "peculiarity is that the routes module is imported at the bottom and not at the top of the script as it is always done. The bottom import is a workaround to circular imports, a common problem with Flask applications."
- routes module: "The routes are the different URLs that the application implements. In Flask, handlers for the application routes are written as Python functions, called view functions" 
- running application: `flask run`

### Templates 
- keep the logic of your application separate from the layout or presentation of your web pages



## Creating App With D3 Elements

- https://blog.logrocket.com/build-interactive-charts-flask-d3js/
- ...



### Serving static files 
- https://sentry.io/answers/serve-static-files-flask/


### systemd 

- list services and status

- check status : systemctl status temp_monitor

- stop service: sudo systemctl stop temp_monitor

- delete service: sudo systemctl disable temp_monitor

- rm sym links 
$ rm /etc/systemd/system/*servicename
$ rm /usr/lib/systemd/system/*servicename

$ sudo systemctl daemon-reload

### To do:
[ ] script to set up systemd process 
[ ] cli
[ ] 

### cli commands:, guide: [here](https://clig.dev/) 
- system setup 
    - chmod +x rbpi_monitor/system_setup/service_setup.sh
    - 
- system list diag services
- system check service status 
- system stop service 


resources 
- https://www.maketecheasier.com/finding-raspberry-pi-system-information/
http://youresuchageek.blogspot.com/2013/01/howto-raspberry-pi-monitor-your.html
https://www.jeffgeerling.com/blog/2020/overclocking-raspberry-pi-compute-module-4


https://medium.com/@brotandgames/build-a-custom-cli-with-bash-e3ce60cfb9a4
https://blog.logrocket.com/build-interactive-charts-flask-d3js
https://benalexkeen.com/creating-graphs-using-flask-and-d3/
https://sentry.io/answers/serve-static-files-flask/


### manual set up 
- add config file as follows:
```
PIMON_DIR=/home/USERNAME/rbpi_monitor

```




