@echo off

rem Get the file extension
for %%i in (%1) do set ext=%%~xi

rem Generate a random 3-digit number
set /a random_id=%random% %% 900 + 100
echo Your random 3-digit ID is: %random_id%


if %2 == "255" (
  magick %1 -colors 255 image_%random_id%%ext%
) else if %2 == "64" (
  magick %1 -colors 64 image_%random_id%%ext%
) else if %2 == "16" (
  magick %1 -colors 16 image_%random_id%%ext%
) else if %2 == "convert_png" (
  magick %1 image_%random_id%.png
) else if %2 == "strip" (
  magick %1 -strip image_%random_id%%ext%
) else if %2 == "rotate" (
  magick %1 -rotate "90" image_%random_id%%ext%
) else if %2 == "flop" (
  magick %1 -flop  image_%random_id%%ext%
) else if %2 == "flip" (
  magick %1 -flip  image_%random_id%%ext%
)

