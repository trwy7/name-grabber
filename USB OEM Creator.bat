@echo off
cls
set cho=n
set drivefound=0
echo Welcome!
echo.
echo Make sure to read what this version does before you continue. There are some differences between this and the regular one.
pause
cls
echo Only have partitions/removable drives that you want to add the installer to
pause
cls
for /F "tokens=1*" %%a in ('fsutil fsinfo drives') do (
   for %%c in (%%b) do (
      for /F "tokens=3" %%d in ('fsutil fsinfo drivetype %%c') do (
         if %%d equ Removable (
            set drivefound=1
            cls
            echo Found usb/sd card %%c. To not use drive, please unplug it and try again.
            echo.
            echo Press any key to use drive %%c
            pause > NUL
            cls
            echo This will copy files onto your drive. This will not format the drive. Make sure you have a stable internet connection
            pause
            cls
            echo downloading required files...
            if not EXIST src\OEMSetup.bat curl -o %%cnamegrabber.bat -S -s https://raw.githubusercontent.com/trey7658/name-grabber/main/src/OEMSetup.bat?avoid=%random%%random%
            if EXIST src\OEMSetup.bat copy src\OEMSetup.bat %%cNamegrabberSetup.bat
            cls
            echo done
         )
      )
   )
)
cls
if %drivefound% equ 0 echo No removable drives found
pause
exit
