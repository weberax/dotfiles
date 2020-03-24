#!/bin/bash
# adds a blank page to each page of existing pdf

if [[ $# -eq 0 ]]; then
	echo "Usage: $0 pdf_file"
	exit 1
elif [[ $# -eq 1 ]]; then
	echo "blank" | pandoc - -o /tmp/blank.pdf 
fi
	
n="`pdftk $1 dump_data | grep NumberOfPages | cut -d : -f2`"
page=`for ((a=1; a <= $n; a++)); do echo -n "A$a B1 "; done`
pdftk A=$1 B=${2:-/tmp/blank.pdf} cat $page output ${1%.pdf}_withblanks.pdf
exit 0
