@echo off

rem Get the file extension
for %%i in (%1) do set ext=%%~xi


rem Generate a random 3-digit number
set /a random_id=%random% %% 900 + 100
echo Your random 3-digit ID is: %random_id%


if %2 == "16" (
    "C:\PATH_Programs\pngquant" 16 %1 -o 16output_%random_id%.png
) else if %2 == "128" (
  "C:\PATH_Programs\pngquant" 128 %1 -o 128output_%random_id%.png
) else if %2 == "256" (
    "C:\PATH_Programs\pngquant" 256 %1 -o 256output_%random_id%.png
) else if %2 == "low" (
    "C:\PATH_Programs\pngquant" --quality=20-40 %1 -o low_output_%random_id%.png
) else if %2 == "high" (
    "C:\PATH_Programs\pngquant" --quality=40-65 %1 -o high_output_%random_id%.png
) else if %2 == "ultra" (
    "C:\PATH_Programs\pngquant" --quality=65-80 %1 -o ultra_output_%random_id%.png
) else if %2 == "convert_png" (
  magick %1 image_%random_id%.png
)