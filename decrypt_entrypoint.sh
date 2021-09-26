#!/bin/bash

#set options are available for the script
#set -e    this will Exit immediately if a command exits with a non-zero exit status
#you can also set flags when you invoke the shell like #!bin/bash -ex  - this is setting 2 separate flags -e and -x

#2> redirets stderr
#1> redirects stdout
# exec 2>&1 - send stderr to location of stdout
#exec > >(tee /opt/copy.log)
#exec &> logfile


#only try to decrypt after an encryption has been done

count=1
while :
do


      echo "start decryption"
      #listen for an xml file before running the service
      while ! [ -f /outputdata/json_to_xml.xml ]
      do
        echo "Waiting for an encrypted xml"
        sleep 10
      done
      python /decrypt.py

      #next process will write over json_to_xml.xml so save file use a counter to rename the final xml -
      #so there is no json_to_xml.xml in the directory
      cp /outputdata/json_to_xml.xml /outputdata/'json_to_xml'$count'.xml'
      #now remove the original xml file
      rm -rf /outputdata/json_to_xml.xml
      rm -rf /outputdata/key.key
      ((count=count + 1))
      echo "decryption complete"

      echo "looping decrypt"
      sleep 30
done