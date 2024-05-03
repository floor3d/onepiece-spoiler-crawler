#!/bin/bash
# should be run every 15 minutes or so, from Monday to Wednesday
# greps for the new chapter number and then greps that for the "article" tag; if it finds it, notify and switch the chapter number

chapter_number=$(<"[HOMEDIR HERE]/onepiece-spoiler-crawler/new-chapter")

result=$(curl -L https://www.reddit.com/r/OnePiece/ | grep $chapter_number | grep -i "spoiler" | grep -i "article")

if [ "$result" != "" ]; then
  echo $((chapter_number + 1)) > /home/evand/onepiece-spoiler-crawler/new-chapter
  # Email variables
  recipient="[YOUR EMAIL HERE]"
  subject="ONE PIECE SPOILERS"
  body="Them spoilers be out. check https://www.reddit.com/r/OnePiece/"

  # Send the email
  echo -e "Subject: $subject\n\n$body" | msmtp --debug --from=[YOUR MSMTP EMAIL HERE] -t $recipient
fi
