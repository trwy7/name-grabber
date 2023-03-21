@echo off
:: start of code
set cho=n
set drivefound=0
echo Welcome!
for /F "tokens=1*" %%a in ('fsutil fsinfo drives') do (
   for %%c in (%%b) do (
      for /F "tokens=3" %%d in ('fsutil fsinfo drivetype %%c') do (
         if %%d equ Removable (
            set drivefound=1
            if %cho% equ n (
               cls
               echo Found usb/sd card %%c. To not use drive, please unplug it and try again.
               echo.
               echo Press any key to use drive %%c
               pause > NUL
               cls
               echo This will copy files into a folder on your drive called namegrabber. This will not format the drive. Make sure you have a stable internet connection
               echo anyone with this usb can see your windows username which is: %username%
               if EXIST %%cnamegrabber echo.
               if EXIST %%cnamegrabber echo error: a folder called namegrabber already exists on %%c. You can continue if you are updating, or delete the folder and restart.
               pause
               cls
               if EXIST %%cnamegrabber echo This will remove all names and admins, so just update from the app to avoid this.
               if EXIST %%cnamegrabber pause
               cls
               md %%cnamegrabber
               echo downloading required files...
               if not EXIST src\Main.bat curl -o %%cnamegrabber\rename.bat -S -s https://raw.githubusercontent.com/trey7658/name-grabber/main/src/Main.bat?avoid=%random%%random%
               if EXIST src\Main.bat copy src\Main.bat %%cnamegrabber\rename.bat
               echo This is the file used for storing names of people > %%cnamegrabber\names.txt 
               attrib +H +S %%cnamegrabber\names.txt
               echo %username% > %%cnamegrabber\creator.txt
               attrib +H +S %%cnamegrabber\creator.txt
               echo NotActuallyARealUsername > %%cnamegrabber\usernames.txt
               attrib +H +S %%cnamegrabber\usernames.txt
               echo NotActuallyARealUsername > %%cnamegrabber\admins.txt
               attrib +H +S %%cnamegrabber\admins.txt
               cls
               echo done
               pause
               cls
               echo To add an admin, please download the file called "AddAdmin.bat" and put it on your namegrabber usb folder. It is in the name-grabber github repository
               echo.
               echo An admin can view names of people who use the USB.
               pause
               start https://github.com/trey7658/name-grabber/wiki/Getting-names-after-install
               exit
            )
         )
      )
   )
)
cls
if %drivefound% equ 0 echo No removable drives found
if %drivefound% equ 1 echo No other removable drives found
pause
exit