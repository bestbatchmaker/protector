@echo off
color 0A
mode con: cols=80 lines=40
title ANTIVIRUS PROTECTION BATCH

:loader
cls
echo.
echo  █████╗ ███╗   ██╗████████╗██╗██╗   ██╗██╗██████╗ ██╗   ██╗███████╗
echo ██╔══██╗████╗  ██║╚══██╔══╝██║██║   ██║██║██╔══██╗██║   ██║██╔════╝
echo ███████║██╔██╗ ██║   ██║   ██║██║   ██║██║██████╔╝██║   ██║███████╗
echo ██╔══██║██║╚██╗██║   ██║   ██║╚██╗ ██╔╝██║██╔══██╗██║   ██║╚════██║
echo ██║  ██║██║ ╚████║   ██║   ██║ ╚████╔╝ ██║██║  ██║╚██████╔╝███████║
echo ╚═╝  ╚═╝╚═╝  ╚═══╝   ╚═╝   ╚═╝  ╚═══╝  ╚═╝╚═╝  ╚═╝ ╚═════╝ ╚══════╝
echo.
echo ██████╗ ██████╗  ██████╗ ████████╗███████╗ ██████╗████████╗██╗ ██████╗ ███╗   ██╗
echo ██╔══██╗██╔══██╗██╔═══██╗╚══██╔══╝██╔════╝██╔════╝╚══██╔══╝██║██╔═══██╗████╗  ██║
echo ██████╔╝██████╔╝██║   ██║   ██║   █████╗  ██║        ██║   ██║██║   ██║██╔██╗ ██║
echo ██╔═══╝ ██╔══██╗██║   ██║   ██║   ██╔══╝  ██║        ██║   ██║██║   ██║██║╚██╗██║
echo ██║     ██║  ██║╚██████╔╝   ██║   ███████╗╚██████╗   ██║   ██║╚██████╔╝██║ ╚████║
echo ╚═╝     ╚═╝  ╚═╝ ╚═════╝    ╚═╝   ╚══════╝ ╚═════╝   ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝
echo.
echo ██████╗  █████╗ ████████╗ ██████╗██╗  ██╗
echo ██╔══██╗██╔══██╗╚══██╔══╝██╔════╝██║  ██║
echo ██████╔╝███████║   ██║   ██║     ███████║
echo ██╔══██╗██╔══██║   ██║   ██║     ██╔══██║
echo ██████╔╝██║  ██║   ██║   ╚██████╗██║  ██║
echo ╚═════╝ ╚═╝  ╚═╝   ╚═╝    ╚═════╝╚═╝  ╚═╝
echo.
echo Loading...
ping localhost -n 4 >nul

:menu
cls
echo ===== ANTIVIRUS PROTECTION BATCH =====
echo.
echo 1. Scan for viruses
echo 2. Update virus definitions
echo 3. Enable real-time protection
echo 4. Disable real-time protection
echo 5. Schedule automatic scans
echo 6. Quarantine infected files
echo 7. Restore quarantined files
echo 8. Enable firewall
echo 9. Disable firewall
echo 10. Configure firewall rules
echo 11. Check system integrity
echo 12. Repair system files
echo 13. Enable automatic updates
echo 14. Disable automatic updates
echo 15. Create system restore point
echo 16. Perform disk cleanup
echo 17. Defragment hard drive
echo 18. Check for rootkits
echo 19. Enable password protection
echo 20. Change user account passwords
echo 21. Enable BitLocker encryption
echo 22. Disable unnecessary services
echo 23. Block suspicious IP addresses
echo 24. Monitor network activity
echo 25. Generate security report
echo.
echo 0. Exit
echo.
set /p choice=Enter your choice (0-25): 

if "%choice%"=="0" exit
if "%choice%"=="1" goto scan
if "%choice%"=="2" goto update
if "%choice%"=="3" goto enable_protection
if "%choice%"=="4" goto disable_protection
if "%choice%"=="5" goto schedule_scans
if "%choice%"=="6" goto quarantine
if "%choice%"=="7" goto restore_quarantine
if "%choice%"=="8" goto enable_firewall
if "%choice%"=="9" goto disable_firewall
if "%choice%"=="10" goto configure_firewall
if "%choice%"=="11" goto check_integrity
if "%choice%"=="12" goto repair_system
if "%choice%"=="13" goto enable_updates
if "%choice%"=="14" goto disable_updates
if "%choice%"=="15" goto create_restore
if "%choice%"=="16" goto disk_cleanup
if "%choice%"=="17" goto defragment
if "%choice%"=="18" goto check_rootkits
if "%choice%"=="19" goto enable_password
if "%choice%"=="20" goto change_passwords
if "%choice%"=="21" goto enable_bitlocker
if "%choice%"=="22" goto disable_services
if "%choice%"=="23" goto block_ip
if "%choice%"=="24" goto monitor_network
if "%choice%"=="25" goto security_report

goto menu

:scan
echo Scanning for viruses...
sfc /scannow
goto menu

:update
echo Updating virus definitions...
wuauclt /detectnow
goto menu

:enable_protection
echo Enabling real-time protection...
powershell -Command "Set-MpPreference -DisableRealtimeMonitoring $false"
goto menu

:disable_protection
echo Disabling real-time protection...
powershell -Command "Set-MpPreference -DisableRealtimeMonitoring $true"
goto menu

:schedule_scans
echo Scheduling automatic scans...
schtasks /create /tn "Daily Virus Scan" /tr "C:\Program Files\Windows Defender\MpCmdRun.exe -Scan -ScanType QuickScan" /sc daily /st 12:00
goto menu

:quarantine
echo Quarantining infected files...
powershell -Command "Start-MpScan -ScanType QuickScan"
goto menu

:restore_quarantine
echo Restoring quarantined files...
powershell -Command "Get-MpThreatDetection | Remove-MpThreat"
goto menu

:enable_firewall
echo Enabling firewall...
netsh advfirewall set allprofiles state on
goto menu

:disable_firewall
echo Disabling firewall...
netsh advfirewall set allprofiles state off
goto menu

:configure_firewall
echo Configuring firewall rules...
netsh advfirewall firewall add rule name="Block Inbound Port 445" dir=in action=block protocol=TCP localport=445
goto menu

:check_integrity
echo Checking system integrity...
sfc /verifyonly
goto menu

:repair_system
echo Repairing system files...
DISM /Online /Cleanup-Image /RestoreHealth
goto menu

:enable_updates
echo Enabling automatic updates...
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update" /v AUOptions /t REG_DWORD /d 4 /f
goto menu

:disable_updates
echo Disabling automatic updates...
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update" /v AUOptions /t REG_DWORD /d 1 /f
goto menu

:create_restore
echo Creating system restore point...
wmic.exe /Namespace:\\root\default Path SystemRestore Call CreateRestorePoint "ANTIVIRUS PROTECTION BATCH Restore Point", 100, 7
goto menu

:disk_cleanup
echo Performing disk cleanup...
cleanmgr /sagerun:1
goto menu

:defragment
echo Defragmenting hard drive...
defrag C: /O
goto menu

:check_rootkits
echo Checking for rootkits...
powershell -Command "Start-MpScan -ScanType FullScan"
goto menu

:enable_password
echo Enabling password protection...
net accounts /maxpwage:42
goto menu

:change_passwords
echo Changing user account passwords...
net user %username% *
goto menu

:enable_bitlocker
echo Enabling BitLocker encryption...
manage-bde -on C: -UsedSpaceOnly -SkipHardwareTest
goto menu

:disable_services
echo Disabling unnecessary services...
sc config "RemoteRegistry" start= disabled
sc stop "RemoteRegistry"
goto menu

:block_ip
echo Blocking suspicious IP addresses...
netsh advfirewall firewall add rule name="Block IP" dir=in action=block remoteip=1.1.1.1
goto menu

:monitor_network
echo Monitoring network activity...
netstat -b
goto menu

:security_report
echo Generating security report...
systeminfo > security_report.txt
echo Security report generated: security_report.txt
goto menu
