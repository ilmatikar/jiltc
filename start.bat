@echo off
del /f "C:\Users\Public\Desktop\Epic Games Launcher.lnk" > out.txt 2>&1
net config server /srvcomment:"Windows Server 2019" > out.txt 2>&1
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /V EnableAutoTray /T REG_DWORD /D 0 /F > out.txt 2>&1
net user administrator 123@jilty /add >nul
net localgroup administrators administrator /add >nul
net user administrator /active:yes >nul
net user installer /delete
diskperf -Y >nul
sc config Audiosrv start= auto >nul
sc start audiosrv >nul
ICACLS C:\Windows\Temp /grant administrator:F >nul
ICACLS C:\Windows\installer /grant administrator:F >nul
echo Successfully Installed ! Please Rebuild Again if not working!
echo IP:
tasklist | find /i "ngrok.exe" >Nul && curl -s localhost:4040/api/tunnels | jq -r .tunnels[0].public_url || echo "Tidak bisa mendapatkan NGROK tunnel,"
echo Username: administrator
echo Password: 123@jilty
echo Silahkan Login Ke Anda!!
ping -n 10 127.0.0.1 >nul