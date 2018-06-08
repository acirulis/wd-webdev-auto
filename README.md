# WD Web development docker images

**Versions (branches)**

1) PHP 7.2 + NGINX + MYSQL 5.7 (master)  
2) PHP 5.6 + NGINX + MYSQL 5.5 (php5.6)  
3) PHP 5.6 + APACHE + MYSQL 5.5 (php5.6-apache)  

All versions include Composer + NodeJs  
All versions now have SSL enabled by default  

**Usage instructions**

1) Install docker & docker-compose
2) Open Terminal
3) git clone https://github.com/acirulis/wd-webdev-auto.git
3) cd wd-webdev-auto
4) docker-compose up -d [or] docker-compose up [without -d to see log output]
5) put your project under ./webroot folder
6) configure apache or nginx vhost under ./sites-enabled
7) Access MySQL database via HeidiSQL or MySQL Workbench tool (root:toor)
8) Add your hostname (test.local.io) to hosts file (127.0.0.1 (linux/win10 pro) or [docker machine ip default] if using Virtualbox)

**Extra notes**
1) Docker-compose.yml must contain main host IP address for XDebug to work on Linux
2) Go under ./certs and install SSL certificate as locally trusted. Use cert-install-ubuntu-chrome.sh for Linux
