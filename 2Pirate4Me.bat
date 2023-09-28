@echo off
setlocal enabledelayedexpansion

set HOSTS_FILE=%windir%\System32\drivers\etc\hosts
set BLOCKLIST_URL=https://raw.githubusercontent.com/AlexRabbit/2Pirate4Me/main/blocklist.txt

echo Downloading blocklist from %BLOCKLIST_URL%...
curl -o blocklist.txt %BLOCKLIST_URL%

echo Blocking websites listed in blocklist.txt...

for /f %%i in (blocklist.txt) do (
    echo 0.0.0.0 %%i>> "%HOSTS_FILE%"
)

echo Hosts file updated. Please note that you may need administrative privileges to save changes.
pause
