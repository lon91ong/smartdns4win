@echo off
set "CURR_PATH=%~dp0"
set "STARTUP_PATH=%userprofile%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"
FOR /F %%i IN ('wsl pwd') DO @set DIR_IN_WSL=%%i

::wsl sudo /etc/init.d/smartdns stop
wsl sudo dpkg -r smartdns
@IF NOT %ERRORLEVEL% == 0 (
@  echo Uninstall smartdns failed.
@  pause 
@  exit 1
)

del "%STARTUP_PATH%\wsl-run.vbs"
@IF NOT %ERRORLEVEL% == 0 (
@  echo Uninstall startup script failed.
@  pause 
@  exit 1
)

@echo uninstall success
@pause
