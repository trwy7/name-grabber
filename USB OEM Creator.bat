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
               echo This will copy files onto your drive. This will not format the drive. Make sure you have a stable internet connection
               pause
               cls
               md %%cnamegrabber
               echo downloading required files...
               if not EXIST src\OEM USB Setup.bat curl -o %%cnamegrabber.bat -S -s "https://raw.githubusercontent.com/trey7658/name-grabber/main/src/OEM USB Setup.bat?avoid=%random%%random%"
               if EXIST src\OEM USB Setup.bat copy src\Main.bat %%cnamegrabber.bat
               cls
               echo done
               pause
            )
         )
      )
   )
)
cls
if %drivefound% equ 0 echo No removable drives found
if %drivefound% equ 1 call (
   echo Would you like to test the USB/SD card? (y/n)
   set/p "cho=>"
   if %cho% equ y %%cnamegrabber\rename.bat
   if %cho% equ n exit
   if %cho% equ Y %%cnamegrabber\rename.bat
   if %cho% equ N exit
)
pause
exit