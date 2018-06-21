#! /bin/sh

curl -L -O https://access.redhat.com/cspdownload/62539b312a9759ff899a2bf2d543501e/5b2b4a1b/JBEAP-6.4.0/jboss-eap-6.4.0.zip 
#git clone https://github.com/EdwinPhilip/jboss_zip.git
echo "Installation........................"
mkdir EAP_6.4
unzip -d EAP_6.4 -o jboss-eap-6.4.0.zip
sudo useradd -s /usr/sbin/nologin jboss-EAP

echo "Registrating EAP as service..."

   EAP_DIR="/home/student/jboss/EAP_6.4/jboss-eap-6.4"
  EAP_SERVICE="/home/student/jboss/EAP_6.4/jboss-eap-6.4/log"
 sudo mkdir $EAP_SERVICE
export JBOSS_HOME="/home/student/jboss/EAP_6.4/jboss-eap-6.4"

sudo cp jboss.service /etc/systemd/system/
sudo chown -R jboss-EAP:jboss-EAP EAP_6.4
sudo chown -R jboss-EAP:jboss-EAP EAP_6.4/

sudo systemctl stop jboss.service
sudo systemctl daemon-reload
sudo systemctl enable jboss.service

sudo systemctl start jboss.service

echo "Done"
