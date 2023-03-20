@echo off
set duplicate=0
echo Hello!
echo This app is used as a mini "survey". All it does is collect your name, and that is it.
pause
:choice
echo Checking if you can use the app...
echo.
FOR /F %%i IN (creator.txt) DO if %%i equ %username% echo Hello creator!
FOR /F %%i IN (admins.txt) DO if %%i equ %username% echo Hello admin!
timeout 1
cls
echo What would you like to do
echo 1) continue
echo 2) cancel
echo 3) help
set/p "cho=>"
if %cho% equ 1 goto checkforname
if %cho% equ 2 exit
if %cho% equ 3 goto help
goto choice
:help
cls
echo What do you want to know?
echo 1) Who can see my info
echo 2) What info gets shared
echo 3) back
set/p "cho=>"
if %cho% equ 1 goto whosees
if %cho% equ 2 goto whatinfo
if %cho% equ 3 goto choice
goto help
:whosees
cls
FOR /F %%i IN (creator.txt) DO echo Only someone with medium windows knowledge or the creator of this usb (%%i) can see your inputed name.
pause
cls
echo If any, here are the admins that can also see your inputted name:
FOR /F %%i IN (admins.txt) DO echo %%i
pause
cls
echo Someone with medium-expert windows knowledge may be able to see your username (%username%)
goto help
:whatinfo
cls
echo They can only see your name
echo disclaimer: someone with knowledge can also see your username (%username%)
pause
goto help
:checkforname
FOR /F %%i IN (usernames.txt) DO if %%i equ %username% goto cantuse
FOR /F %%i IN (creator.txt) DO if %%i equ %username% goto adminmenu
FOR /F %%i IN (admins.txt) DO if %%i equ %username% goto adminmenu
:confirm
cls
color 9f
echo What do you want your name as?
set/p "name=>"
cls
color
echo Finishing...
attrib -s -h names.txt
attrib -s -h usernames.txt
timeout 2 > NUL
if %duplicate% equ 1 echo %name% - may be a duplicate >> names.txt
if %duplicate% equ 0 echo %name% >> names.txt
echo %username% >> usernames.txt
timeout 2 > NUL
attrib +s +h names.txt
attrib +s +h usernames.txt
cls
echo done!
pause
exit
:cantuse
cls
set duplicate=1
color fc
echo It seems like you have already have added something to this.
echo You can continue except your name may be marked as a duplicate.
pause
echo if you have not used this before, here are some reasons this may happen:
echo.
echo You have a generic username (like user), yours is: %username%
echo You have used this on another PC (probably not)
echo The files from a previous USB/SD card have been copied here.
color
goto confirm