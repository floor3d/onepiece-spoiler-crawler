# onepiece-spoiler-crawler
Crawls r/OnePiece to check if spoilers have released

### How to
1. set up msmtp, place .msmtprc in home directory
2. copy file structure
3. add cronjob to run every X minutes / hours (whatever you want)
--> my cronjob
   `*/15 * * * * [homedir]/onepiece-spoiler-crawler/spoiler-check.sh > /dev/null 2>&1`
4. spoil
