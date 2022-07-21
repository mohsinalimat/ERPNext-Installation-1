# Color variables
#A script can use escape sequences to produce colored text on the terminal. Colors for text are represented by color codes,
#including, reset = 0, black = 30, red = 31, green = 32, yellow = 33, blue = 34, magenta = 35, cyan = 36, and white = 37.
red='\033[0;31m'
green='\033[0;32m'
yellow='\033[0;33m'
blue='\033[0;34m'
magenta='\033[0;35m'
cyan='\033[0;36m'
white='\033[0;37m'
# Clear the color after that
clear='\033[0m'
#bold colors
bld_red='\033[1;31m'
bld_green='\033[1;32m'
bld_yellow='\033[2;33m'
bld_blue='\033[1;34m'
bld_magenta='\033[1;35m'
bld_cyan='\033[1;36m'
bld_white='\033[1;37m'
#background colors
bg_red='\033[0;41m'
bg_green='\033[0;42m'
bg_yellow='\033[0;43m'
bg_blue='\033[0;44m'
bg_magenta='\033[0;45m'
bg_cyan='\033[0;46m'
#text bold
bold=`tput bold`
offbold=`tput rmso`
#Frappe, pronounced fra-pay, is a full stack, batteries-included, web framework written in Python and Javascript with MariaDB as the database.
#It is the framework which powers ERPNext. It is pretty generic and can be used to build database driven apps.
#The key difference in Frappe compared to other frameworks is that meta-data is also treated as data and is used to build front-ends very easily.
#We believe in a monolithic architecture, so Frappe comes with almost everything you need to build a modern web application.
#It has a full featured Admin UI called the Desk that handles forms, navigation, lists, menus, permissions, file attachment and much more out of the box.
printf  "${green}Entering the Script file...${clear}\n"
#The sudo apt-get update command is used to download package information from all configured sources.
#The sources often defined in the /etc/apt/sources. list file and other files located in /etc/apt/sources.
sudo apt-get update -y
#upgrade upgrade is used to install the newest versions of all packages currently installed on the system from the sources enumerated in /etc/apt/sources. list.
sudo apt-get upgrade -y
#The autoremove option removes packages that were automatically installed because some other package required them but, with those other packages removed, they are no longer needed.
#Sometimes, an upgrade will suggest that you run this command.
sudo apt autoremove -y
printf "\n${green}Successfully Updated...!${clear}\n"
#This guide assumes you are using a personal computer, VPS or a bare-metal server.
#You also need to be on a *nix system, so any Linux Distribution and MacOS is supported. However, we officially support only the following distributions.
printf "${yellow}Installing nodejs${clear}\n"
sudo apt install -y curl
sudo curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
#Now you will add MariaDB to your server stack. ERPNext 12 requires MariaDB 10.2+ for proper operation.
#Because Ubuntu 20.04 includes MariaDB 10.3 in its official repositories you can install this version using the apt command:
#First, you will need to install Python and other packages required to build and set up Frappe framework.
printf "${yellow}Installing required resources...${clear}\n"
sudo apt install -y nodejs mariadb-server redis-server python3-pip nginx python3-testresources
printf "${bold}${green}Resources Installed...!${offblod}${clear}\n"
#Once the MariaDB is secured, log in to the MariaDB console with the following command
#Next, you will need to change MariaDB Innodb file format to Barracuda. You can configure it by editing the file
sudo rm -rf /etc/mysql/my.cnf
sudo cp -r my.cnf /etc/mysql/
printf "${green}Mysql conf file edited...${clear}\n"
# Restart the MariaDB service to implement the changes
sudo systemctl restart mysql
printf "${blue}Mysql service Restarted....${clear}\n"
#Once installed, secure the MariaDB and set the MariaDB root password 
sudo mysql -uroot -p << EOF
alter user root@localhost identified by 'Erp@123';
EOF
printf "${bg_yellow}Mysql DB root password Erp@123${clear}\n"
#It is recommended to install Yarn through the npm package manager, which comes bundled with Node.js when you install it on your system.
sudo npm install -g yarn
printf "${yellow}Installing Frappe-Bench${clear}\n"
#We recommend using either the Docker Installation or the Easy Install Script to setup a Production Environment.
#For Development, you may choose either of the three methods to setup an instance.
sudo pip3 install frappe-bench
sudo systemctl restart mariadb
sudo pip3 install frappe-bench
printf "${green}Installing bench components...!${clear}\n"
sudo -H pip3 install frappe-bench
#Git is a free, open-source, distributed version control system that handles source code changes in software projects of all sizes.
#Git allows multiple developers to work together on the same project with ease
sudo apt install git -y
sudo apt install python3.8-venv -y
sudo apt install xdotool -y
#You can setup the bench for production use by configuring two programs, Supervisor and nginx. If you want to revert your Production Setup to Development
sudo cp -r crontab /etc/
printf "${green} Crontab copied...${clear}\n"
sudo cp -r production-mode.sh /home/
sudo chmod a+x /home/production-mode.sh
printf "${green}...${clear}"
#Initialize the bench directory with Frappe framework using the following command
cd ~
bench init --frappe-branch version-13 frappe-bench
#change the directory to erpnext and create a new frappe site with the following command
cd frappe-bench
#Provide your password and hit Enter to create a new Erp site
bench new-site erp-site
bench use erp-site
sudo service nginx stop
#After the frappe-bench folder is created, changing your directory run bench
cd ~
cd frappe-bench
printf "${yellow}Project Starting...${clear}\n"
#Get ERPNext application from GitHub
#Download the ERPNext application from frappe Github repo.
#We will get version 13.
bench get-app --branch version-13 erpnext
#You can get whichever version you like.
bench --site erp-site install-app erpnext
bench use erp-site
bench start
