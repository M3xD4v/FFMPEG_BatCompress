@echo off

rem Create the "Compressed" folder if it doesn't exist
if not exist "Compressed" mkdir "Compressed"

rem Change to the directory containing the videos
cd /d "%~dp0"
rem Ask user to choose compression preset
:preset_choice
echo Choose compression preset:
echo 1. Low compression
echo 2. High compression
echo 3. Ultra compression
set /p choice=Enter choice (1-3):
rem Set compression parameters based on user choice
if "%choice%"=="1" (
set crf=28
set bitrate=1000k
set audio_bitrate=96k
set name=low
echo Low compression preset selected.
) else if "%choice%"=="2" (
set crf=25
set bitrate=2000k
set audio_bitrate=128k
set name=high
echo High compression preset selected.
) else if "%choice%"=="3" (
set crf=18
set bitrate=4000k
set audio_bitrate=192k
set name=ultra
echo Ultra compression preset selected.
) else (
echo Invalid choice. Please try again.
goto preset_choice
)
rem Loop through all video files in the current directory
for %%f in (*.mp4 *.avi *.mov *.mkv) do (
echo Processing %%f
ffmpeg -hwaccel cuda -i "%%f" -c:v h264_nvenc -crf %crf% -b:v %bitrate% -c:a aac -b:a %audio_bitrate% "%%~nf_%name%.mp4"
)

rem Loop through all files in the current directory
for %%f in (*.mp4) do (
rem Check if the file name contains "_low", "_high", or "ultra"
echo %%f | findstr /i "%name%" >nul
if not errorlevel 1 (
rem Move the file to the "Compressed" folder
move "%%f" "Compressed"
echo Moved %%f to Compressed
)
)


echo All videos have been compressed.
pause
