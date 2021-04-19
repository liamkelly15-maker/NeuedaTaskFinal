#!/bin/bash

#write a bash to to run in dockerfile
#use while loop to keep the container active - delete the json file at end and then manually add a new
#one to see if it is picked up

#cd /
python encrypt.py

#for debug - should use if [[ -n $DEBUG ]] set an infinite loop to keep the container running
#if there is a value in the $DEBUG then execute the loop to keep contaner running
#if [[ -n $DEBUG]]
#then
while :
do
      sleep 30
done
#fi
#add line to test
#add another line
#add another line

