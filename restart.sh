#!/bin/sh

ID=fhmukgk37ig5dehv3a50

echo 'the instance is being stop'
yc compute instance stop $ID

echo 'sleep 61'
sleep 61

echo 'starting the instance...'
yc compute instance start $ID

echo 'sleep 20'
sleep 20

echo 'connecting to console...'
yc compute connect-to-serial-port --instance-id $ID --user admin --ssh-key /Users/christopher/.ssh/id_ed25519
