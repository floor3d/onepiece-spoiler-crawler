# onepiece-spoiler-crawler
Crawls r/OnePiece to check if spoilers have released. As of now, it is a trivial implementation and may be expanded in the future.

### How to
1. set up msmtp, place .msmtprc in home directory
2. copy file structure
3. update the two chapter files to be the next chapter release
4. add cronjob to run every X minutes / hours (whatever you want)
--> my cronjob
   `*/15 * * * * [homedir]/onepiece-spoiler-crawler/spoiler-check.sh > /dev/null 2>&1`
5. spoil
