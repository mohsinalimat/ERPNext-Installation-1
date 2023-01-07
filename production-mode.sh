set -e
cd ~
#Go to file path
cd frappe-bench
sudo nginx -t
sudo apt update -y
sudo apt upgrade -y
#Find username
me=$(whoami)
#Froduction setup
sudo bench setup production ${me}
#Update the the production mode
sudo apt update
#This file to run every 10 minutes. but, it requires only one time so this file removed
sudo rm -rf /home/production-mode.sh
