@echo off
echo Nob
tasklist | find /i "ngrok.exe" >Nul && goto check || echo "Unable to get NGROK tunnel," & ping 127.0.0.1 >Nul & exit
:check
ping 127.0.0.1 > nul
cls
for /L %%a in (1,1,58) Do ping -n 300 127.0.0.1 > nul
echo Finished