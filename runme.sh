#!/bin/sh
if [ $# -ne 1 ]; then
   echo "usage: $(basename $0) <srt to translate> "
   echo "output file will be suffixed with .translated"
   exit 1
fi

if [ ! -r "$1" ]; then
   echo "srt file $1 is not readable or does not exist"
   exit 2
fi

awk -f tr.awk < "$1" > "$1.translated"
