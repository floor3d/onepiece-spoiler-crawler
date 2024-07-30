import requests
from bs4 import BeautifulSoup
import subprocess

email = "/home/[YOU]/onepiece-spoiler-crawler/email.sh update"

def crawl_spoiler_post(link):
    r = requests.get(link)
    html_doc = r.text
    soup = BeautifulSoup(html_doc, 'html.parser')
    post_text = ""
    for div in soup.find_all('div'):
        if div.get("id") is not None and "post-rtjson-content" in div.get("id"):
            post_text = div.text
            break
    if len(post_text) == 0:
        return
    write_me = False
    with open("current_chapter_spoilers", "a+") as f:
        f.seek(0)
        current_spoilers = f.read()
        print(len(current_spoilers))
        print(len(post_text))
        if len(current_spoilers) < len(post_text):
            print("[!] Updating current spoilers!")
            write_me = True
            f.write(post_text)
        else:
            print("[-] No updates.")
    if write_me:
        subprocess.run(['bash', '-c', email])



def main():
    with open("new-chapter", "r") as nc:
        with open("scans-chapter", "r") as sc:
            if sc.read() == nc.read():
                print("dont give a damn! EXITING!")
                return

    r = requests.get("https://www.reddit.com/r/OnePiece/")
    html_doc = r.text
    soup = BeautifulSoup(html_doc, 'html.parser')

    for article in soup.find_all('article'):
        article_text = article.get('aria-label').strip()
        if ("one piece" in article_text.lower() or "chapter" in article_text.lower()) and "spoiler" in article_text.lower():
            print(article_text)
            link = "https://www.reddit.com" + article.find('a').get("href")
            print(link)
            crawl_spoiler_post(link)


main()
