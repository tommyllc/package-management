

#!/bin/bash 

#run this as a script  

sudo hostname docker 

sudo apt update -y 

sudo apt install docker.io -y  

sudo usermod -aG docker ubuntu 

 

#install Java and Jenkins dependency 

sudo apt install openjdk-11-jdk -y 

 

#install jenkins in ubuntu 

sudo wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add - 

sudo sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > \/etc/apt/sources.list.d/jenkins.list' 

sudo apt-get update 

sudo apt-get install jenkins -y 

sudo systemctl start jenkins  

sudo useradd jenkins 

 

#assign sudo privileges to jenkins user 

sudo echo "jenkins ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/jenkins 

sudo passwd jenkins  

sudo vi /etc/ssh/sshd_config 

#sudo echo "jenkins:admin" | chpasswd 

#sudo sed -i "/^[^#]*PasswordAuthentication[[:space:]]np/c\PasswordAuthentication yes" /etc/ssh/sshd_config 

sudo service sshd restart 

sudo usermod -aG docker jenkins
# Jenkins Installation And Setup In AWS EC2 ubuntu Instance.
# Installation of Java
sudo apt update   # Update the repositories
sudo apt install openjdk-11-jdk
java -version
# Install Jenkins
sudo wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
sudo dnf upgrade
# Add required dependencies for the jenkins package
sudo dnf install chkconfig java-devel
sudo dnf install jenkins
# Start Jenkins
sudo systemctl daemon-reload  # To Register the Jenkins service 
sudo systemctl start jenkins
systemctl status jenkins

