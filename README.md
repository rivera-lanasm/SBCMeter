

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
- system list diag services
- system check service status 
- system stop service 


