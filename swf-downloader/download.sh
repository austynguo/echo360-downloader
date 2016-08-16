#!/bin/sh

# Author: Austyn Guo
# Date: 15/08/16
# Project: Bash script for automating .swf file downloads of echo360 (lecture streaming system)

# url still needs to be hardcoded at this point
url="https://delivery.streaming.sydney.edu.au/echo/1632/5/d07655a2-363e-442d-90da-072cdb052eeb/slides/"
# Example full URL below
# https://delivery.streaming.sydney.edu.au/echo/1632/5/d07655a2-363e-442d-90da-072cdb052eeb/slides/00240000.swf

# Increment by 15,000 until you reach 7,200,000 milliseconds
# Probably a better way to do this based on HTTP response headers (e.g. End when 404 File not found received)
for i in {0..7200000..15000}; 
do
	fileNumber=${i};
	# echo "Length of fileNumber ${fileNumber} is ${#fileNumber}"
	printf "\n"
	while [[ ${#fileNumber} < 8 ]]; do
		# Prepend leading zeroes to file name
		fileNumber=0$fileNumber;
		# echo "This is file: ${fileNumber}"
	done
wget "${url}${fileNumber}.swf"
done

# 3600 seconds in an hour
# each .swf downloaded is 15 seconds or 15,000 milliseconds long.
# Given max length of a lecture is ~2 hrs = 7200 seconds / 15 seconds = max 480 swf clips?