@echo off 


mkdir a
cd a 
echo this is a batch script txt file >>a.txt
start notepad a.txt
timeout /nobreak /t 5 >nul
taskkill /f /im notepad.exe >nul
cd ..
rmdir /s /q a
puase 