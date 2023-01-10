set -e
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
cd ~
#Go to file path
cd frappe-framework
export LC_ALL=C.UTF-8
export LANG=C.UTF-8
sudo apt update -y
sudo apt upgrade -y
#Find username
me=$(whoami)
#Froduction setup
sudo bench setup production ${me}
#Update the the production mode
bench setup nginx
sudo systemctl reload nginx
#This file to run every 10 minutes. but, it requires only one time so this file removed
printf "${green} 
Production mode setup completed!
${clear}
"
