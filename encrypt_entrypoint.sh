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
      #listen for a json file before starting service
      while ! [ -f /data/json_file.json ]
      do
        echo "Add a JSON file to encrypt"
        sleep 10
      done
      echo "found a file to encrypt"
      python /encrypt.py
      rm -rf /data/json_file.json
      echo "encrypt complete - removed the json file\n"


      echo "looping encryption"
      sleep 30


done
#fi

