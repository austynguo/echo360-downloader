# Echo360 downloader

This documentation will go through the necessary steps to download echo360 lecture recordings by using Chrome to find the link of the video stream and using VLC player to capture and export said stream.

## TL;DR of steps for the techies:
- Use Chrome developer settings to spoof user agent of an iPad
- echo360 now thinks you're an ipad and no longer serves you the video stream in flash (yay!)
- Collect http link of stream using l33t h4x0r skillz (just kidding, it's pretty easy)
- Enter stream link into VLC and wait for it to download/export to .mp4 (or format of choosing)
- ???
- Profit!!!

## Project context
The motivation for this project is as a result of echo360 video streams being served via the web security nightmare that is Adobe Flash with no option for an alternative download at the *University of Sydney*. (Plus, Flash is getting killed off - I'm not waiting around leaving my machine exposed in the meantime). Other echo360 downloaders exist, however many of these seem to either 1. Obtain a link to a video (.m4v format) from the RSS feed or 2. Append `/media.m4v?downloadOnly=true` (or similar) which worked on older versions and/or only works if the uni has explicitly enabled video downloads.

## Software/Ingredients required:
* Chrome - (I used Version 52.0.2743.116 (64-bit))
  * The steps provided assume you are using Chrome. It is definitely possible to use other browsers e.g. Firefox
* VLC Player - (I used version 2.2.2 on Ubuntu and version 2.2.4 while testing on Windows 10)
* Last but not least, echo360 - (As of August 2016, USyd was using EchoCenter.5.4.2015-03-09.90)

## Steps (AKA the fun part):
1. Open Chrome up, hit the F12 key to open the developer settings panel
2. Top right hand corner, there is an icon that looks like a phone on top of a tablet -> click this
3. This should change your screen to emulate a pre-defined user agent, in this case a mobile device such as a phone or tablet
4. In the top middle of the screen click the drop down list containing the device names
5. Click 'Edit', this should open up a panel over the dev panel
6. Add a 'Custom device' - This is the step where we make Chrome pretend to be an iPad (or any other device given the appropriate user agent)
  - User agents field:
`Mozilla/5.0 (iPad; CPU OS 7_0 like Mac OS X. AppleWebKit/537.51.1 (KHTML, like Gecko. Version/7.0 Mobile/11A465 Safari/9537.5`
  - Screen resolution: Can be whatever you want (I used 1280x800 for ease of viewing).
  - Name: Whatever you want (mine was called spoofymcspoofface).
  - Device Pixel Ratio: Leave empty
7. Load up the recording you want to download. You can load this in 'normal desktop mode', hit F12 to toggle to your spoofed ipad, and then refresh.
8. Your recording should appear in 'ipad' mode. My recording actually wouldn't play through the browser using this method but that matters little because we're not here for that.
9. Right click the video and select "Inspect". This should bring up the link in question within the developer settings panel.
10. For me, the link was to a `.m3u8` file (a playlist file NOT a video file)
11. Copy this link address by double clicking over it and paste this into a text editor (we will need this link later).
    - Example link format (the x's denote link info I don't want to share - don't try this link because it won't work.)
    - http://delivery.streaming.sydney.edu.au:xxxx/echo/_definst_/xxxx/x/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/mp4:audio-vga-streamable.m4v/playlist.m3u8
12. Download the file by pasting this link into a new tab
13. Navigate to where you downloaded the file and right-click and 'Open As' in a text editor (e.g. Notepad)
14. You will see that the file contents will be similar to:
```
#EXTM3U
#EXT-X-VERSION:3
#EXT-X-STREAM-INF:BANDWIDTH=1008032,CODECS="avc1.66.22,mp4a.40.2",RESOLUTION=648x360
chunklist_w280308744.m3u
```
15. We only care about the last line of the file i.e. `chunklist_wXXXXXXXXX.m3u8`
16. Remember that link we copied in to a text editor before? Remove `playlist.m3u8` from the end of the link and replace it with `chunklist_wXXXXXXXXX.m3u8`.
Your link should now look like this:
http://delivery.streaming.sydney.edu.au:xxxx/echo/_definst_/xxxx/x/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/mp4:audio-vga-streamable.m4v/chunklist_wXXXXXXXXX.m3u8
17. Open up VLC player. Navigate to 'Media > Convert/Save' and paste your link in
  - Shortcut `Ctrl + R`
18. Leave the default settings aside from the 'Destination' - this is where you will select a place to save your exported video
  - Windows e.g. `C:\Users\usernamehere\Documents\fileName.mp4`
  - Linux/MacOS e.g. `\home\documents\fileName.mp4`
19. Click the 'Start' button at the bottom of window
20. Your video has started downloading! You can track the approximate progress of the download by looking at the position bar. (For some reason 100% file download occurs when the video position scroller hits the 50% mark)

**Note:** If you try to open a video file whilst downloading the stream, you'll disrupt it and have to start over. Simultaneous downloads seem possible by openining multiple VLC windows, however in my experience this is hit and miss (the exported video doesn't play properly), so best practice is to **download one video at a time**.


For me a ~2 hr lecture came out as a 640x360 px ~125mb .mp4 file. Video quality is a little on the potato side (in part due to the resolution that is served to iPads), but it is definitely watchable and audio is fine.

## Streaming lectures in VLC
As an aside you can also use this method to stream inside VLC as opposed to the Flash web interface which I find clunky and awkward. Instead of making VLC save the stream, use the option to simply open and play a network stream e.g. 'Media > Open Network Stream' and paste the link that we edited.

## Plans for the future?
Maybe a script or browser extension if I'm bothered. This project is an afternoon's worth of procrastination to avoid other work :)

Feel free to contribute or make improvements by forking/making a pull request.

## Legal
I hold no responsibility or liability for any actions or consequences that arise from your use of this information. It is just that, simply information. Use at your own risk.
