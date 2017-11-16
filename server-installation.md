NEO4J
Create new vm with 8GB memory and bridge mode networking.

Install centos7
Install dependencies
# yum install redhat-lsb-core net-tools epel-release kernel-headers kernel-devel
# yum groupinstall “Development Tools”
# yum update
# reboot

in virtualbox Devices> Install guest additions
ssh into server

mkdir /media/VirtualBoxGuestAdditions
mount -r /dev/cdrom /media/VirtualBoxGuestAdditions

cd /media/VirtualBoxGuestAdditions
./VBoxLinuxAdditions.run

reboot

Neo4j Stable Yum Repo

First, you'll want our key:

cd /tmp
wget http://debian.neo4j.org/neotechnology.gpg.key
rpm --import neotechnology.gpg.key
Then, you'll want to add our yum repo to /etc/yum.repos.d/neo4j.repo:

cat <<EOF>  /etc/yum.repos.d/neo4j.repo
[neo4j]
name=Neo4j Yum Repo
baseurl=http://yum.neo4j.org/stable
enabled=1
gpgcheck=1
EOF
Finally, install a package

yum install neo4j

vi /etc/neo4j/neo4j.conf
uncomment the following line:
dbms.connectors.default_listen_address=0.0.0.0

firewall-cmd --permanent --zone=public --add-port=7474/tcp 
firewall-cmd --permanent --zone=public --add-port=7687/tcp 
firewall-cmd --permanent --zone=public --add-port=7473/tcp 

sytemctl enable neo4j
reboot

from another machine go to neo4jserverIp:7474  and login using password neo4j and change password to 
one of your own.

enjoy




