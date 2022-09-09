#!/bin/sh

ID=fhmukgk37ig5dehv3a50

echo 'the instance is being stop'
yc compute instance stop $ID

sleep 30

echo 'starting the instance...'
yc compute instance start $ID

echo 'connecting to console...'
yc compute connect-to-serial-port --instance-id $ID --user admin --ssh-key ~/.ssh/id_ed25519
