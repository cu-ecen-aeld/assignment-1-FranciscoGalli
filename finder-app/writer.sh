#!/bin/bash

writefile=$1
writestr=$2

if [ $# -ne 2 ]; then
	echo "Error: invalid number of arguments. It should be 2: directory path+filename and string content"
	exit 1
fi

file_path=$(dirname "$writefile")

if [ ! -d "$file_path" ]; then
	echo "Directory does not exist, creating it: $file_path"
	mkdir -p "$file_path"
	if [ $? -ne 0 ]; then
		echo "Error creating dir $file_path"
		exit 1
	fi
fi

echo "$writestr" > "$writefile"

if [ $? -ne 0 ]; then
	echo "Error: couldn't create or write to the file $writefile"
	exit 1
fi

exit 0
