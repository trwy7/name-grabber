@echo off
:: start of code
set cho=n
echo Welcome!
cls
echo This program will setup namegrabber on this usb.
echo.
pause
cls
echo This will copy files into a folder on your drive called namegrabber. This will not format the drive. Make sure you have a stable internet connection
echo anyone with this usb can see your windows username which is: %username%
pause
cls
md %0\..\namegrabber
echo downloading required files...
curl -o %0\..\namegrabber\rename.bat -S -s https://raw.githubusercontent.com/trey7658/name-grabber/main/src/Main.bat?avoid=%random%%random%
echo This is the file used for storing names of people > %0\..\namegrabber\names.txt 
attrib +H +S %0\..\namegrabber\names.txt
echo %username% > %0\..\namegrabber\creator.txt
attrib +H +S %0\..\namegrabber\creator.txt
echo NotActuallyARealUsername > %0\..\namegrabber\usernames.txt
attrib +H +S %0\..\namegrabber\usernames.txt
echo NotActuallyARealUsername > %0\..\namegrabber\admins.txt
attrib +H +S %0\..\namegrabber\admins.txt
echo NotActuallyARealDomain > %0\..\namegrabber\pc.txt
attrib +H +S %0\..\namegrabber\pc.txt
echo Logs start here > %0\..\namegrabber\logs.txt
attrib +H +S %0\..\namegrabber\logs.txt
echo This is to show that is is an Preinstalled version > %0\..\namegrabber\Preinstalled
attrib +H +S %0\..\namegrabber\Preinstalled
cls
echo done
pause
del %0