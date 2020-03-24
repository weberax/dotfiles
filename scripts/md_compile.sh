#!/bin/bash
# markdown previewer script by Axel

if [[ $# -eq 1 ]]; then
	echo "compiling"
	pandoc -V documentclass:scrartcl $1 -f gfm --pdf-engine=pdflatex -o ${1%md}pdf
	exit 0
elif [ $2 == 'auto' ]; then
	zathura ${1%md}pdf &
	echo $1 | entr -c $0 $1 
else
	echo "usage: $0 file.md [auto]"
	exit 1
fi
