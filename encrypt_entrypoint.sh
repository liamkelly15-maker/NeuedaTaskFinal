#!/bin/bash
#write a bash to to run in dockerfile
#use while loop to keep the container active - delete the json file at end and then manually add a new
#one to see if it is picked up
#cd /

#the file descriptor for stdout is 1 and for stderr is 2 - use the & before the file descriptor to avoid confusion
#exec 2>&1
#exec &> logfile

#python /encrypt.py
#for debug - should use if [[ -n $DEBUG ]] set an infinite loop to keep the container running
#if there is a value in the $DEBUG then execute the loop to keep contaner running
#if [[ -n $DEBUG]]
#then

#exec > >(tee /opt/copy.log)

#put in a while condition on the existence of a json file
while :
do
      echo "starting encrypt"
      while ! [ -f /data/json_file.json ]
      do
        echo "Add a JSON file to encrypt"
        sleep 10
      done
      python /encrypt.py

      echo "encrypt complete - remove the json file\n"
      rm -rf /data/json_file.json
      echo  "encryption complete"

      echo "looping encryption"
      sleep 30
      #could look for a json file and loop on sleep while no json is available-if json exists in /adata then exit loop else stay in loop

done
#fi

