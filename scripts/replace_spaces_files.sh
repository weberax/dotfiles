#!/bin/sh
# replaces spaces in filenames for all files in current directory

for f in *; do mv "$f" "${f// /_}"; done

