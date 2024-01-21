@echo off 
setlocal enabledelayedexpansion

:: Get computer details
set "computerName=%COMPUTERNAME%"
set "username=%USERNAME%"
set "os=%OS%"
set "osVersion="
set "currentDate=%date%"
set "currentTime=%time%"

:: Get OS version using ver command
for /f "tokens=*" %%v in ('ver') do set "osVersion=%%v"


:: Get RAM details using PowerShell
for /f "delims=" %%m in ('powershell "(Get-CimInstance -ClassName Win32_ComputerSystem).TotalPhysicalMemory / 1GB"') do set "ram=%%m GB"

:: Get storage details using PowerShell
for /f "delims=" %%d in ('powershell "(Get-CimInstance -ClassName Win32_LogicalDisk | Where-Object { $_.DeviceID -eq 'C:' }).Size / 1GB"') do set "totalSpace=%%d GB"
for /f "delims=" %%d in ('powershell "(Get-CimInstance -ClassName Win32_LogicalDisk | Where-Object { $_.DeviceID -eq 'C:' }).FreeSpace / 1GB"') do set "freeSpace=%%d GB"
mkdir Batch_Script
cd Batch_Script
echo Hello Everyone >>Batch_Script.txt
echo This is a Batch_Script txt file >>Batch_Script.txt
echo When you run bat file >>Batch_Script.txt
echo Btach Script folder is created and notepad will be open and close after 10 sec >>Batch_Script.txt
echo Folder is also will be deleated >>Batch_Script.txt
echo ------x---------------x----------->>Batch_Script.txt
echo This is a detail of your computer >>Batch_Script.txt
echo Computer Name: !computerName! >>Batch_Script.txt
echo User Name: !username! >> Batch_Script.txt
echo Operating System: !os! >> Batch_Script.txt
echo Operating System: !osVersion! >> Batch_Script.txt
echo Installed RAM: !ram! >> Batch_Script.txt
echo Total Storage: !totalSpace! >> Batch_Script.txt
echo Free Storage: !freeSpace! >> Batch_Script.txt
echo Current Date: !currentDate! >> Batch_Script.txt
echo Current Time: !currentTime! >> Batch_Script.txt
echo ------x---------------x----------->>Batch_Script.txt
start notepad Batch_Script.txt
timeout /nobreak /t 10 >nul
taskkill /f /im notepad.exe >nul
cd ..
rmdir /s /q Batch_Script
endlocal