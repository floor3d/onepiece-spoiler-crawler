#!/bin/bash
# should be run every 15 minutes or so, from Monday to Wednesday
# greps for the new chapter number and then greps that for the "article" tag; if it finds it, notify me and switch the chapter number

chapter_number=$(<"/home/[YOU]/onepiece-spoiler-crawler/new-chapter")
scans_chapter=$(<"/home/[YOU]/onepiece-spoiler-crawler/scans-chapter")
result=$(curl -L https://www.reddit.com/r/OnePiece/ | grep $chapter_number | grep -i "spoiler" | grep -i "article")
scans_result=$(curl -L https://www.reddit.com/r/OnePiece/ | grep "One Piece: Chapter $scans_chapter<")

if [ "$result" != "" ]; then
  echo $((chapter_number + 1)) > /home/[YOU]/onepiece-spoiler-crawler/new-chapter
fi

if [ "$scans_result" != "" ]; then
  echo $((scans_chapter + 1)) > /home/[YOU]/onepiece-spoiler-crawler/scans-chapter
  ./email.sh scans
  rm current_chapter_spoilers
fi
