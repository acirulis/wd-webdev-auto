# WD Web development docker image(-s)

**Usage instructions**

1) Install docker & docker-compose
2) Open Console/Terminal
3) git clone https://github.com/acirulis/wd-webdev-auto.git
3) cd wd-webdev-auto
4) docker-compose up -d [or] docker-compose up [without -d to see log output]
5) put your project under ./webroot folder

extra steps: 
-docker.compose.yml file should contain local ip address for xdebug to work
-hosts file should contain <ip> projectname.local.io, where ip is 127.0.0.1 (linux/win10 pro) or [docker machine ip default] (win10 home...)


**TODO**

Nginx vhost config ???

