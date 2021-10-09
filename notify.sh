#!/bin/bash

API=<YOUR TELEGRAM BOT API KEY>
CHATID=<TELEGRAM CHANNEL CHAT ID OR PROFILE CHAT ID>
MESSAGE="New Comment Action on example.com"
LOGFILE=/home/isso/issocomments.log

tail -fn0 $LOGFILE | \
while read line ; do
        echo "$line" | grep "comment created\| deleted\| edited"
        if [ $? = 0 ]
        then
          curl --silent --output /dev/null \
          -X POST \
           "https://api.telegram.org/bot$API/sendMessage" \
          -d text="'$MESSAGE'" \
          -d chat_id=$CHATID
        fi
done