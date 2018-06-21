#! /bin/sh

curl -L -O https://access.redhat.com/cspdownload/62539b312a9759ff899a2bf2d543501e/5b2b4a1b/JBEAP-6.4.0/jboss-eap-6.4.0.zip 
#git clone https://github.com/EdwinPhilip/jboss_zip.git
echo "Installation........................"
mkdir EAP_6.4
unzip -d EAP_6.4 -o jboss-eap-6.4.0.zip
sudo useradd -s /usr/sbin/nologin jboss-EAP
#sudo chown -R jboss-EAP:jboss-EAP EAP_6.4
#sudo chown -R jboss-EAP:jboss-EAP EAP_6.4/

echo "Registrating EAP as service..."

   EAP_DIR="/home/student/jboss/EAP_6.4/jboss-eap-6.4"
  EAP_SERVICE="/home/student/jboss/EAP_6.4/jboss-eap-6.4/log"
 sudo mkdir $EAP_SERVICE
export JBOSS_HOME = $EAP_DIR
sudo cp launch.sh /home/student/jboss/EAP_6.4/jboss-eap-6.4/bin/
sudo cp jboss.service /etc/systemd/system/
sudo chown -R jboss-EAP:jboss-EAP EAP_6.4
sudo chown -R jboss-EAP:jboss-EAP EAP_6.4/
# sudo cat > /etc/systemd/system/jboss.service << "EOF"

#[UNIT]
#Description = Jboss Agent start
#After = network.target auditd.service

#[Service]
#ExeStart=/home/student/jboss/EAP_6.4/jboss-eap-6.4/bin/launch.sh standalone /home/student/jboss/jboss-eap-6.4/standalone/configuration/standalone.xml 0.0.0.0
#KillMode=process
#Restart=on-failure

#[Install]    
#WantedBy=multi-user.target

#EOF

sudo systemctl daemon-reload
sudo systemctl enable jboss.service

sudo systemctl start jboss.service

echo "Done"
