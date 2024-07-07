@echo off

rem Generate a random 3-digit number
set /a random_id=%random% %% 900 + 100
echo Your random 3-digit ID is: %random_id%


if %2 == "low" (
    "C:\ArchContext\ffmpeg.exe"  -i %1   -crf 28 -b:v 1000k -c:a aac -b:a 96k "low_%random_id%.mp4"
) else if %2 == "high" (
    "C:\ArchContext\ffmpeg.exe"  -i %1   -crf 25 -b:v 2000k -c:a aac -b:a 128k "high_%random_id%.mp4"
) else if %2 == "ultra" (
    "C:\ArchContext\ffmpeg.exe"  -i %1   -crf 18 -b:v 4000k -c:a aac -b:a 192k "ultra_%random_id%.mp4"
) else if %2 == "mute" (
    "C:\ArchContext\ffmpeg.exe" -i %1 -c: copy -an "Muted.mp4"
) else if %2 == "speed" (
    "C:\ArchContext\ffmpeg.exe"  -i %1 -vf "setpts=PTS/2" -an "speed_%random_id%.mp4"
)
pause-00