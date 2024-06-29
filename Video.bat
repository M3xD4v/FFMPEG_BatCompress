@echo off

if %2 == "low" (
    ffmpeg -hwaccel cuda -i %1 -c:v h264_nvenc -crf 28 -b:v 1000k -c:a aac -b:a 96k "low_Compressed.mp4"
) else if %2 == "high" (
    ffmpeg -hwaccel cuda -i %1 -c:v h264_nvenc -crf 25 -b:v 2000k -c:a aac -b:a 128k "high_Compressed.mp4"
) else if %2 == "ultra" (
    ffmpeg -hwaccel cuda -i %1 -c:v h264_nvenc -crf 18 -b:v 4000k -c:a aac -b:a 192k "ultra_Compressed.mp4"
) else if %2 == "mute" (
    ffmpeg -i %1 -c: copy -an "Muted.mp4"
)
