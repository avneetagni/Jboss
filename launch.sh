#!/bin/sh
EAP_DIR="/home/student/jboss/EAP_6.4/jboss-eap-6.4"
  EAP_SERVICE="/home/student/jboss/EAP_6.4/jboss-eap-6.4/log"
sudo echo 'Starting Wildfly in standalone mode.'
sudo $EAP_DIR/bin/standalone.sh -c $2 -b $3 >> $EAP_SERVICE/server-`date +%Y-%m-%d`.log

