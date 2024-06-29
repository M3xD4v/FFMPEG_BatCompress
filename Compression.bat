@echo off
rem 16 stings pwd

setlocal ENABLEEXTENSIONS ENABLEDELAYEDEXPANSION
set alfanum=ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789

set pwd=
FOR /L %%b IN (0, 1, 16) DO (
SET /A rnd_num=!RANDOM! * 62 / 32768 + 1
for /F %%c in ('echo %%alfanum:~!rnd_num!^,1%%') do set pwd=!pwd!%%c
)



rem Generate a random 3-digit number
set /a random_id=%random% %% 900 + 100
echo Your random 3-digit ID is: %random_id%

if %2 == "compress" (
    "C:\Program Files\7-Zip\7z.exe" a archive_%random_id%.zip -tzip -mx=9 %1
) else if %2 == "compress_password" (
    "C:\Program Files\7-Zip\7z.exe" a archive_%random_id%.zip -tzip -mx=9 %1 -p"%pwd%"
    echo %pwd%
) else (
    "C:\Program Files\7-Zip\7z.exe" a archive_%random_id%.zip -tzip -mx=9 %* -p"%pwd%"
    set DEST_DIR=%USERPROFILE%\Desktop
    move archive_%random_id%.zip %USERPROFILE%\Desktop
    echo %pwd%
) 
pause