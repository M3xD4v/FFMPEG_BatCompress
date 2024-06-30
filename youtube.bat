@echo off

rem Prompt user for video URL
set /p url="Enter the video URL: "

rem Prompt user for resolution
set /p resolution="Enter the desired resolution (e.g., 480, 720, 1080): "

rem Set the yt-dlp command with the user input
yt-dlp -S "height:%resolution%" %url%

rem Pause the script to allow the user to see the output
pause
