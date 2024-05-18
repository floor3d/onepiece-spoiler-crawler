#!/bin/bash
# should be run every 15 minutes or so, from Monday to Wednesday
# greps for the new chapter number and then greps that for the "article" tag; if it finds it, notify me and switch the chapter number

chapter_number=$(<"/home/evand/onepiece-spoiler-crawler/new-chapter")
scans_chapter=$(<"/home/evand/onepiece-spoiler-crawler/scans-chapter")
result=$(curl -L https://www.reddit.com/r/OnePiece/ | grep $chapter_number | grep -i "spoiler" | grep -i "article")
scans_result=$(curl -L https://tcb-backup.bihar-mirchi.com/ | grep "One Piece" | grep "Chapter $chapter_number")

if [ "$result" != "" ]; then
  echo $((chapter_number + 1)) > /home/evand/onepiece-spoiler-crawler/new-chapter
  # Email variables
  recipient=[]
  subject="JUAN PIECE SPOILERS"
  body="Them spoilers be out. check https://www.reddit.com/r/OnePiece/"

  # Send the email
  echo -e "Subject: $subject\n\n$body" | msmtp --debug --from=[] -t []
fi

if [ "$scans_result" != "" ]; then
  echo $((scans_chapter + 1)) > /home/evand/onepiece-spoiler-crawler/scans-chapter
  # Email variables
  recipient=[]
  subject="JUAN PIECE SCANS"
  body="Them scans be out. check https://tcb-backup.bihar-mirchi.com/ "

  # Send the email
  echo -e "Subject: $subject\n\n$body" | msmtp --debug --from=[] -t []
fi
