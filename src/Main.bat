@echo off
echo Hello!
echo This app is used as a mini "survey". All it does is collect your name, and that is it.
pause
:choice
cls
echo What would you like to do
echo 1) continue
echo 2) cancel
echo 3) help
set/p "cho=>"
if %cho% equ 1 goto confirm
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
echo disclaimer: someone with knowledge can also see your username (%username%)
pause
goto help
:whatinfo
cls
echo They can only see your name
echo disclaimer: someone with knowledge can also see your username (%username%)
pause
goto help
:confirm
echo What do you want your name as?
set/p "name=>"
echo %name% > names.txt
echo %username% > usernames.txt
cls
echo done!
pause
exit