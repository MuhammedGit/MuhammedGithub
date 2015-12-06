#!/bin/bash
VERSION=hadoop-2.7.1
apt-get install python-software-properties
add-apt-repository ppa:webupd8team/java
apt-get update
apt-get install oracle-java8-installer
apt-get install ssh
#download hadoop, untar, put in /usr/local
cd ~/Downloads
wget http://ftp.itu.edu.tr/Mirror/Apache/hadoop/common/hadoop-2.7.1/hadoop-2.7.1.tar.gz

tar -xzf "$VERSION".tar.gz
mv  $VERSION /usr/local

#create user and group
addgroup hadoop
adduser --ingroup hadoop hduser
sudo adduser hduser sudo

mkdir -p /app/hadoop/tmp
chown hduser:hadoop /app/hadoop/tmp
chmod 755 /app/hadoop/tmp


chown -R hduser:hadoop hadoop
#modify hadoop-env
cd /usr/local/hadoop/etc/hadoop
mv $VERSION hadoop
#echo "export JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64" >> hadoop-env.sh
echo "export JAVA_HOME=/usr/lib/jvm/java-8-oracle" >> hadoop-env.sh
echo "export HADOOP_OPTS=-Djava.net.preferIPv4Stack=true" >> hadoop-env.sh#get configuration files
m
rm core-site.xml
wget https://raw.githubusercontent.com/MuhammedGit/MuhammedGit/Muho/Multi-Node/conf/core-site.xml
rm mapred-site.xml.template
wget https://raw.githubusercontent.com/MuhammedGit/MuhammedGit/Muho/Multi-Node/conf/mapred-site.xml.template
rm hdfs-site.xml
wget https://raw.githubusercontent.com/MuhammedGit/MuhammedGit/Muho/Multi-Node/conf/hdfs-site.xml
rm yarn-site.xml
wget https://raw.githubusercontent.com/MuhammedGit/MuhammedGit/Muho/Multi-Node/conf/yarn-site.xml

echo $1 > /etc/hostname

reboot
