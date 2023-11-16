#!bin/bash

sudo apt-get update

#install java
sudo apt install -y fontconfig -y openjdk-17-jre

#download jenkins debian package
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null

sudo apt-get update

sudo apt-get install -y jenkins

sudo systemctl start jenkins

######

sudo apt-get update

#######

#installs ability to install, update, remove, and manage packages/ y for yes/ able to use apt for adding python dependencies
sudo apt install -y software-properties-common

#downloads updated versions of python 
sudo add-apt-repository -y ppa:deadsnakes/ppa

#install python version
sudo apt install -y python3.9

#install python virtual environment
sudo apt install -y python3.9-venv

#installs essential build tools9
sudo apt install -y build-essential

#installs the MySQL client library files
sudo apt install -y libmysqlclient-dev

#installs Python 3.7 files for app development
sudo apt install -y python3.9-dev

#upgrade installed packages
sudo apt upgrade