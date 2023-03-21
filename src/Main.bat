@echo off
goto start
:: TO NEVER BE CHANGED!!!!
:update
cls
color 9f
echo make sure you have a stable internet connection
pause
cls
echo Would you like to update to the latest beta? This may cause issues and can be used to fix issues in the program. (y/n)
set/p "cho=>"
if %cho% equ y goto autoupdate
if %cho% equ n goto adminmenu
if %cho% equ Y goto autoupdate
if %cho% equ N goto adminmenu
goto adminmenu
:: TO NEVER BE CHANGED!!!!
:autoupdate
curl -o %0 https://raw.githubusercontent.com/trey7658/name-grabber/main/src/Main.bat?avoid=%random%%random%
:: All updates should change HERE AND BELOW ONLY!
cls
echo Now updated. Restarting program...
echo %username% updated the app >> logs.txt
timeout 5 > NUL
goto start
:start
cls
Setlocal EnableDelayedExpansion
color F
set duplicate=0
set duplicatename=0
echo Hello!
echo This app is used as a mini "survey". All it does is collect your name, and that is it.
pause
echo Checking if you can use the app...
echo.
FOR /F %%i IN (creator.txt) DO if %%i equ %username% goto adminmenu
FOR /F %%i IN (admins.txt) DO if %%i equ %username% goto adminmenu
timeout 1
cls
:choice
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
echo 3) What can the creator or admins do
echo 4) Why does my username get stored (%username%)
echo 5) back
set/p "cho=>"
if %cho% equ 1 goto whosees
if %cho% equ 2 goto whatinfo
if %cho% equ 3 goto adminsdo
if %cho% equ 4 goto whyusername
if %cho% equ 5 goto choice
goto help
:adminsdo
cls
echo First things first, here is the creator and admins (if they exist)
pause
cls
FOR /F %%i IN (creator.txt) DO echo %%i - creator
FOR /F %%i IN (admins.txt) DO echo %%i - admin
echo.
pause
cls
echo Next, basic stuff they can do.
pause
cls
echo 1. See names (and depending on the situation they can see usernames)
echo 2. Update this app
echo 3. Uninstall this app
echo 4. Use this app as a normal user
pause
cls
echo Finally, more advanced tools.
pause
cls
echo 1. See how many users have inputted a name
echo 2. See how many UNIQUE users have inputted a name
echo 3. Really anything else with the usb and data
pause
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
echo Someone with medium-expert windows knowledge may be able to see your username (%username%) and PC name (%userdomain%)
echo This does not let them do anything, they can just see your username or PC name, if your PC has no password and has remote desktop enabled, this may let them connect to your pc. (very low chance)
goto help
:whatinfo
cls
echo They can only see your name
echo disclaimer: someone with knowledge can also see your username (%username%) and PC name (%userdomain%), for more info, please check out the "who can see my info" section
pause
goto help
:checkforname
FOR /F %%i IN (usernames.txt) DO if %%i equ %username% goto cantuse
FOR /F %%i IN (pc.txt) DO if %%i equ %userdomain% goto cantuse
:confirm
cls
color 9f
echo What do you want your name as?
set/p "name=>"
FOR /F %%i IN (names.txt) DO if %%i equ %name% goto cantuse
cls
color F
echo Finishing...
attrib -s -h names.txt
attrib -s -h usernames.txt
attrib -s -h pc.txt
timeout 2 > NUL
if %duplicate% equ 1 echo %name% - please check logs. >> names.txt
if %duplicate% equ 1 echo Log for %name% - It seems like this is a duplicate. Username: "%username%" PC name: "%userdomain%" >> logs.txt
if %duplicate% equ 0 echo %name% >> names.txt
if %duplicate% equ 0 echo %username% >> usernames.txt
if %duplicate% equ 0 echo %userdomain% >> pc.txt
timeout 2 > NUL
attrib +s +h names.txt
attrib +s +h pc.txt
attrib +s +h usernames.txt
cls
echo done!
pause
exit
:cantuse
cls
set duplicate=1
color cf
echo It seems like you have already have added something to this.
echo You can continue except your name may be marked as a duplicate.
echo The person who created this USB/SD card may be able to see your username (%username%) and PC name (%userdomain%)
pause
cls
color af
echo if you have not used this before, here are some reasons this may happen:
echo.
echo You have a generic username (like user), yours is: %username%
echo You have used this on another PC (probably not)
echo The files from a previous USB/SD card have been copied here.
pause
color
goto confirm
:adminmenu
cls
color F
echo Hey!
echo You have a special menu because you are the creator or you are an admin.
pause
cls
echo What would you like to do
echo 1) Continue as normal user
echo 2) Goto regular user menu
echo 3) See names and logs in notepad
echo 4) Uninstall name-grabber from this USB/SD card
echo 5) Check for updates
echo 6) See user count
echo 7) Permission manager
echo 8) Cancel
set/p "cho=>"
if %cho% equ 1 goto checkforname
if %cho% equ 2 goto choice
if %cho% equ 3 goto checknamesintxt
if %cho% equ 4 goto uninstall
if %cho% equ 5 goto update
if %cho% equ 6 goto findnamecount
if %cho% equ 7 goto adminmanager
if %cho% equ 8 exit
goto adminmenu
:checknamesintxt
cls
echo Close notepad to continue...
echo %username% opened names.txt >> logs.txt
notepad names.txt
echo %username% opened logs.txt >> logs.txt
notepad logs.txt
goto adminmenu
:adminmanager
cls
echo Checking level of perms
FOR /F %%i IN (creator.txt) DO if %%i equ %username% call (
    cls
    echo 1. Add an admin
    echo 2. Edit admins.txt
    echo 3. Add a creator
    echo 4. Edit creator.txt
    echo 5. Back
    set/p "cho=>"
    if %cho% equ 1 goto AddAdmin
    if %cho% equ 2 echo %username% opened admins.txt >> logs.txt
    if %cho% equ 2 notepad admins.txt
    if %cho% equ 3 goto AddCreator
    if %cho% equ 4 echo %username% opened creator.txt >> logs.txt
    if %cho% equ 4 notepad creator.txt
    goto adminmenu
)
FOR /F %%i IN (admins.txt) DO if %%i equ %username% call (
    cls
    echo Because you are an admin, you can only add another admin. Would you like to? (y/n)
    set/p "cho=>"
    if %cho% equ Y goto AddAdmin
    if %cho% equ y goto AddAdmin
    goto adminmenu
)
:AddAdmin
cls
echo Who do you want to add? Type their PC name. (For example: %username%). Keep in mind that anyone with that username will have admin.
set/p "cho=>"
echo Adding...
echo %username% added %cho% as an admin >> logs.txt
echo %cho% >> admins.txt
cls
echo done
pause
goto adminmenu
:AddCreator
cls
echo This can be dangerous, they will have access to everything you can, including uninstalling name-grabber, 
pause
echo Who do you want to add? Type their PC name. (For example: %username%). Keep in mind that anyone with that username will have the creator role.
set/p "cho=>"
echo Adding...
echo %username% added %cho% as an creator >> logs.txt
echo %cho% >> creator.txt
cls
echo done
pause
goto adminmenu
:uninstall
cls
echo checking for ownership
FOR /F %%i IN (creator.txt) DO if %%i equ %username% goto uninstall2
cls
color fc
echo You are only an admin, only the creator can uninstall.
pause
goto adminmenu
:uninstall2
color 1f
echo Ready to uninstall name-grabber, after uninstallation, you can delete the namegrabber folder.
echo.
set/p "cho=Would you like to delete namegrabber (y/n)>"
if %cho% equ y goto uninstall3
if %cho% equ n goto adminmenu
if %cho% equ Y goto uninstall3
if %cho% equ N goto adminmenu
goto adminmenu
:uninstall3
cls
color fc
echo Uninstalling name-grabber
rd /s /q %0\..
echo If you can see this, name-grabber is not uninstalled.
pause
exit
:findnamecount
cls
echo Note: user count will be off by 1 for both values, just subtract 1 from them until i can figure out how to do math in batch.
echo.
pause
cls
for /f "usebackq" %%b in (`type names.txt ^| find "" /v /c`) do (
    echo total name count is %%b
)
for /f "usebackq" %%b in (`type usernames.txt ^| find "" /v /c`) do (
    echo total unique user count is %%b
)
echo.
pause
goto adminmenu