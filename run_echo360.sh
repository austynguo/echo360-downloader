#!/bin/bash
# Written by Austyn Guo, 26/08/2016

echo -e '\e[92mEcho360 VLC Stream link generator\e[0m'
echo -e '\e[92mPaste your target URL here and press [ENTER]\e[0m'

read targetURL
echo #new line
# Download targetURL using wget
wget $targetURL

# Remove tail end of URL
newURL=${targetURL::-13}

# echo $newURL
# Create new URL by parsing last line of downloaded file
newURL=$newURL`cat playlist.m3u8 | tail -n 1`

# Echo out new URL
echo -e '\e[92mYour new URL is:\e[0m'
echo -e '\e[96m'$newURL'\e[0m'

# Clean up, delete unneeded files
rm playlist.m3u8
