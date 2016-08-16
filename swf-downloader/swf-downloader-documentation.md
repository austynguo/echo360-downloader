** NOTE **

This project has been shelved due to finding an easier way to download echo360 lectures (this method is detailed in the README.md at the root of this project). This method could potentially serve as a backup, but given that flash is evil and is therefore going the way of the dinosaur there exists little motivation to continue with this. 

# Echo360 swf downloader

This documentation will go through the necessary steps to use this bash script to automate downloading echo360 lecture recordings.

## Project context
The motivation for this project is as a result of echo360 video downloads being disabled at the **University of Sydney**. Other echo360 downloaders exist, however many of these seem to either 1. Obtain a link to a video (.m4v format) from the RSS feed or 2. Append `/media.m4v?downloadOnly=true` which only works if the uni has explicitly enabled video downloads.

## Project goals
Whilst the initial code was written in less than an hour, the end goal is to have a script that:
- pulls .swf files from a given echo360 lecture recording
- converts these to .mp4
- stitches these multiple .mp4 files together
- downloads the audio.mp3 file of the lecture
- combines audio.mp3 with the merged .mp4 file
