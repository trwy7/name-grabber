@echo off
:: start of code
set cho=n
set found=0
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
               echo This will not work if you have renamed your namegrabber folder, so change it back if you havent yet.
               pause
               cls
               echo THIS WILL DELETE ANY FOLDER NAMED "namegrabber"! MAKE SURE TO CHECK IF ANYTHING THERE IS IMPORTANT!
               echo.
               echo ANOTHER WARNING: THIS WILL DELETE %%cnamegrabber
               pause
               echo checking for namegrabber...
               if EXIST %%cnamegrabber\admins.txt set found=1
               if EXIST %%cnamegrabber\creator.txt set found=1
               if EXIST %%cnamegrabber\names.txt set found=1
               if EXIST %%cnamegrabber\usernames.txt set found=1
               if EXIST %%cnamegrabber\admins.txt rd /s /q %%cnamegrabber
               if EXIST %%cnamegrabber\creator.txt rd /s /q %%cnamegrabber
               if EXIST %%cnamegrabber\names.txt rd /s /q %%cnamegrabber
               if EXIST %%cnamegrabber\usernames.txt rd /s /q %%cnamegrabber
               timeout 2 > NUL
               cls
               if EXIST %%cnamegrabber echo We couldnt find anything related to namegrabber, so be free to delete the folder yourself.
               if %found% equ 1 echo We have successfully deleted namegrabber
               echo.
               echo press any key to exit
               pause > NUL
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