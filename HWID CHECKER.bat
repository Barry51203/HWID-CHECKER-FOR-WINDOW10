@echo off
mode con: cols=86 lines=59
TITLE HWID Checker v2.0 by CARFTY MRFKER
Color d

setlocal EnableDelayedExpansion

set "animation="
set "animation2=Developed by CARFTY MRFKER."
set "percentage=0"

for /L %%i in (1,1,10) do (
    echo Loading...
    set /a "percentage=percentage+10"
    set "animation=!animation!="
    set "animation2=!animation2:~1!!animation2:~0,1!"
    echo -------------+
    echo !animation! !percentage! percent
    echo -------------+
    echo !animation2!
    timeout /nobreak /t 1 >nul
    cls
)

echo Loading complete!
goto menu

:menu
cls
ECHO "+=============================================================================+"
ECHO "?                                                                            ?"
ECHO "?                .o88b.  .d8b.  d8888b. d88888b d888888b db    db            ?"
ECHO "?               d8P  Y8 d8' `8b 88  `8D 88'     `~~88~~' `8b  d8'            ?"
ECHO "?               8P      88ooo88 88oobY' 88ooo      88     `8bd8'             ?"
ECHO "?               8b      88~~~88 88`8b   88~~~      88       88               ?"
ECHO "?               Y8b  d8 88   88 88 `88. 88         88       88               ?"
ECHO "?                 88P'  YP   YP 88  YD  YP         YP       YP               ?"
ECHO "?                                                                            ?"
ECHO "+=============================================================================+"
ECHO "?                                                                            ?"
echo "?		      : HWID CHECKER TOOLS v 2.0                               ?"
echo "?		      : Developed by CARFTY MRFKER.                            ?"
echo "?		      : 2.0 @ 12-11-2023                                       ?"
echo "?		      : 0.0 @ 0-0-0000                                         ?"
ECHO "?                                                                            ?"
ECHO "+=============================================================================+"

echo Please choose what you want to do:
echo 1. HWID CHECKER
echo 2. Create a HWID storage file
echo 3. HWID CHECKER - Create a HWID storage file

set /p choice=Please enter a number (1-3): 
cls

if "%choice%"=="1" (
    REM Run HWID Checker
    color e
    ECHO [+] Checking HWID...
    echo [!] DISK DRIVE
    wmic diskdrive get model,serialnumber

    echo [!] CPU Serialnumber   
    wmic cpu get serialnumber

    echo [!] CPU Processorid        
    wmic cpu get processorid

    echo [!] BIOS          
    wmic bios get serialnumber

    echo [!] Motherboard   
    wmic baseboard get serialnumber

    echo [!] Ram Serialnumber           
    wmic memorychip get serialnumber

    echo [!] smBIOS UUID
    wmic path win32_computersystemproduct get uuid

    echo [!] MAC Address
    getmac

    echo [!] Developed by CARFTY MRFKER
    pause>nul
    goto menu

) else if "%choice%"=="2" (
    REM Create HWID Storage Files
    mkdir HWID.carfty
    wmic cpu get serialnumber > HWID.carfty\CPUserialnumber.txt
    wmic diskdrive get model,serialnumber > HWID.carfty\DISKDRIVEserialnumber.txt
    wmic cpu get processorid > HWID.carfty\CPUprocessorid.txt
    wmic bios get serialnumber > HWID.carfty\BIOSserialnumber.txt
    wmic baseboard get serialnumber > HWID.carfty\Motherboard.txt
    wmic memorychip get serialnumber > HWID.carfty\Ramserialnumber.txt
    wmic path win32_computersystemproduct get uuid > HWID.carfty\smBIOSUUID.txt
    getmac > HWID.carfty\MAC.txt

    color a
    echo HWID storage files created successfully!
    pause>nul
    goto menu

) else if "%choice%"=="3" (
    REM Run both HWID Checker and Create Files
    color b
    echo Running HWID Checker and creating files...
    REM (Include steps from both 1 and 2)
    goto menu

) else (
    echo Invalid choice. Please try again.
    pause>nul
    goto menu
)
