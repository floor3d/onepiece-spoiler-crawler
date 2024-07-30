# onepiece-spoiler-crawler
Crawls r/OnePiece to check if spoilers have released. As of now, it is a trivial implementation and may be expanded in the future.

### How to
1. set up msmtp, place .msmtprc in home directory
2. copy file structure
3. update the two chapter files to be the next chapter release
4. Change the files to point to your proper paths
5. add cronjob to run every X minutes / hours (whatever you want)
--> my cronjob
   `*/10 * * * * /home/[me]/onepiece-spoiler-crawler/spoiler-check.sh > /dev/null 2>&1; /home/[me]/onepiece-spoiler-crawler/venv/bin/python3 /home/[me]/onepiece-spoiler-crawler/extract_spoilers.py > /dev/null 2>&1
6. spoil

The spoiler check script updates the current and spoiler chapters. The python script gives you the actual text from the spoiler posts. These could be both one thing but that would be too simple, and I am too lazy to de-complicate it, so here is the overengineered solution!
