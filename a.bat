@echo off 


mkdir Batch_Script
cd Batch_Script
echo Hello Everyone >>Batch_Script.txt
echo This is a Batch_Script txt file >>Batch_Script.txt
echo When you run bat file >>Batch_Script.txt
echo Btach Script folder is created and notepad will be open and close after 10 sec >>Batch_Script.txt
echo Folder is also will be deleated >>Batch_Script.txt
start notepad Batch_Script.txt
timeout /nobreak /t 10 >nul
taskkill /f /im notepad.exe >nul
cd ..
rmdir /s /q Batch_Script
