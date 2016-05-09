#!/bin/sh
if [ $# -ne 1 ]; then
   echo "usage: $(basename $0) '<text to translate>' "
   echo "you gave $@"
   exit 1
fi
before="$1"
# echo "$before"
after=$(curl 'https://translate.google.com/' -H 'Host: translate.google.com' -H 'User-Agent: Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:45.0) Gecko/20100101 Firefox/45.0' -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8' -H 'Accept-Language: en-US,en;q=0.5' --compressed -H 'Referer: https://translate.google.com/' -H 'Connection: keep-alive' --data "sl=en&tl=zh-CN&js=n&prev=_t&hl=en&ie=UTF-8&text=""$before""&file=&edit-text=" 2>/dev/null | grep -oP '(?<=TRANSLATED_TEXT='"'"')[^'"'"']+')
echo "$after"
