#!/bin/bash 

sudo apt-get update
sudo apt-get install subversion subversion-tools libapache2-svn apache2 curl -y
sudo mkdir /home/svn
mkdir ~/test 
sudo svnadmin create /home/svn/test 
cd ~/test 
mkdir trunk tags branches
cd ..
sudo svn import ~/test file:///home/svn/test 
sudo chown -R www-data:www-data /home/svn 
sudo a2enmod dav_svn
sudo sed -i '$s/$/\n\<Location \/svn\>\nDAV\ svn\nSVNParentPath\ \/home\/svn\n\<\/Location\>/g' /etc/apache2/apache2.conf
sudo service apache2 restart
