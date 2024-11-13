@echo off
:: Check if the script is running with admin privileges
net session >nul 2>&1
if %errorLevel% NEQ 0 (
    echo Requesting administrative privileges...
    :: Relaunch the script with admin privileges
    powershell -Command "Start-Process -File '%~f0' -Verb RunAs"
    exit /b
)

set "bazarPath=C:\Program Files\Snippingtool\DRAG ME IN THE INJECTOR.dll"
set "mapperPath=C:\Program Files\Snippingtool\senex-valo-injector.exe"

:: Log the start of the process
echo Running mapper.exe with bazar.sys > log.txt 2>&1

:: Check if the mapperPath exists
if not exist "%mapperPath%" (
    echo Mapper executable not found at %mapperPath% >> log.txt 2>&1
    pause
    exit /b
)

:: Check if the bazarPath exists
if not exist "%bazarPath%" (
    echo Bazar.sys not found at %bazarPath% >> log.txt 2>&1
    pause
    exit /b
)

:: Run the mapper with bazar.sys as an argument
"%mapperPath%" "%bazarPath%" >> log.txt 2>&1

pause
