#!/bin/bash

# Email variables
recipient="[YOUR EMAIL HERE]"
subject="JUAN PIECE SPOILERS"
body="Them spoilers be out. check https://www.reddit.com/r/OnePiece/"

if [ "$1" == "scans" ]; then
    subject="JUAN PIECE SCANS"
    body="Them scans be out, I think. Check TCBScans or One Piece reddit..!"
fi

if [ "$1" == "update" ]; then
    subject="JUAN PIECE SPOILERS UPDATE"
    body="According to my calculations, we have a spoilers update! Here's what i found:"
    file_path="/[path_to]/current_chapter_spoilers"
    current_chapter_spoilers=$(cat "$file_path")
    body="$body"$'\n'"$current_chapter_spoilers"
fi

# Send the email
echo -e "Subject: $subject\n\n$body" | msmtp --debug --from=[YOUR EMAIL] -t $recipient
