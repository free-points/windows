@echo off

secedit /configure /db E:\Security\CyberPatriotsTemplateDatabase.sdb
echo Local Policy Complete

NetSh Advfirewall set allprofiles state on
echo firewall enabled

DISM /online /enable-feature /featurename:Internet-Explorer-Optional-amd64
echo I.E. enabled

DISM /online /disable-feature /featurename:IIS-FTPServer
echo FTPServer disabled

DISM /online /disable-feature /featurename:TelnetServer
DISM /online /disable-feature /featurename:TelnetClient
echo Telnet disabled

netsh advfirewall firewall set rule group="File and Printer Sharing" new enable=No
echo File Sharing Disabled

reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update" /v AUOptions /t REG_DWORD /d 0 /f
echo auto-updates enabled

net start wuauserv
sc config wuauserv start= auto
echo update service enabled and started

net stop RemoteRegistry
sc config RemoteRegistry start= disabled
echo RemoteRegistry stopped and disabled

net stop WebClient
sc config WebClient start= disabled
echo WebClient stopped and disabled

net share C:\ /delete
echo C: drive unshared

setx /M MP_FORCE_USE_SANDBOX 1
echo Windows Defender Sandboxing enabled

powershell.exe Set-Processmitigation -System -Enable DEP,CFG,ForceRelocateImages,BottomUp,SEHOP
echo Exploit Setttings enabled

powershell.exe Add-MpPreference -AttackSurfaceReductionRules_Ids D4F940AB-401B-4EFC-AADC-AD5F3C50688A -AttackSurfaceReductionRules_Actions Enabled
powershell.exe Add-MpPreference -AttackSurfaceReductionRules_Ids 75668C1F-73B5-4CF0-BB93-3ECF5CB7CC84 -AttackSurfaceReductionRules_Actions Enabled
powershell.exe Add-MpPreference -AttackSurfaceReductionRules_Ids 92E97FA1-2EDF-4476-BDD6-9DD0B4DDDC7B -AttackSurfaceReductionRules_Actions Enabled
powershell.exe Add-MpPreference -AttackSurfaceReductionRules_Ids 3B576869-A4EC-4529-8536-B80A7769E899 -AttackSurfaceReductionRules_Actions Enabled
powershell.exe Add-MpPreference -AttackSurfaceReductionRules_Ids 5BEB7EFE-FD9A-4556-801D-275E5FFC04CC -AttackSurfaceReductionRules_Actions Enabled
powershell.exe Add-MpPreference -AttackSurfaceReductionRules_Ids BE9BA2D9-53EA-4CDC-84E5-9B1EEEE46550 -AttackSurfaceReductionRules_Actions Enabled
powershell.exe Add-MpPreference -AttackSurfaceReductionRules_Ids D3E037E1-3EB8-44C8-A917-57927947596D -AttackSurfaceReductionRules_Actions Enabled
powershell.exe Add-MpPreference -AttackSurfaceReductionRules_Ids d1e49aac-8f56-4280-b9ba-993a6d77406c -AttackSurfaceReductionRules_Actions Enabled
reg add "HKCU\Software\Policies\Microsoft\Office\12.0\Publisher\Security" /v vbawarnings /t REG_DWORD /d 4 /f
reg add "HKCU\Software\Policies\Microsoft\Office\12.0\Word\Security" /v vbawarnings /t REG_DWORD /d 4 /f
reg add "HKCU\Software\Policies\Microsoft\Office\14.0\Publisher\Security" /v vbawarnings /t REG_DWORD /d 4 /f
reg add "HKCU\Software\Policies\Microsoft\Office\14.0\Word\Security" /v vbawarnings /t REG_DWORD /d 4 /f
reg add "HKCU\Software\Policies\Microsoft\Office\15.0\Outlook\Security" /v markinternalasunsafe /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Policies\Microsoft\Office\15.0\Word\Security" /v blockcontentexecutionfrominternet /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Policies\Microsoft\Office\15.0\Excel\Security" /v blockcontentexecutionfrominternet /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Policies\Microsoft\Office\15.0\PowerPoint\Security" /v blockcontentexecutionfrominternet /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Policies\Microsoft\Office\15.0\Word\Security" /v vbawarnings /t REG_DWORD /d 4 /f
reg add "HKCU\Software\Policies\Microsoft\Office\15.0\Publisher\Security" /v vbawarnings /t REG_DWORD /d 4 /f
reg add "HKCU\Software\Policies\Microsoft\Office\16.0\Outlook\Security" /v markinternalasunsafe /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Policies\Microsoft\Office\16.0\Word\Security" /v blockcontentexecutionfrominternet /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Policies\Microsoft\Office\16.0\Excel\Security" /v blockcontentexecutionfrominternet /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Policies\Microsoft\Office\16.0\PowerPoint\Security" /v blockcontentexecutionfrominternet /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Policies\Microsoft\Office\16.0\Word\Security" /v vbawarnings /t REG_DWORD /d 4 /f
reg add "HKCU\Software\Policies\Microsoft\Office\16.0\Publisher\Security" /v vbawarnings /t REG_DWORD /d 4 /f
reg add "HKCU\Software\Microsoft\Office\14.0\Word\Options" /v DontUpdateLinks /t REG_DWORD /d 00000001 /f
reg add "HKCU\Software\Microsoft\Office\14.0\Word\Options\WordMail" /v DontUpdateLinks /t REG_DWORD /d 00000001 /f
reg add "HKCU\Software\Microsoft\Office\15.0\Word\Options" /v DontUpdateLinks /t REG_DWORD /d 00000001 /f
reg add "HKCU\Software\Microsoft\Office\15.0\Word\Options\WordMail" /v DontUpdateLinks /t REG_DWORD /d 00000001 /f
reg add "HKCU\Software\Microsoft\Office\16.0\Word\Options" /v DontUpdateLinks /t REG_DWORD /d 00000001 /f
reg add "HKCU\Software\Microsoft\Office\16.0\Word\Options\WordMail" /v DontUpdateLinks /t REG_DWORD /d 00000001 /f
echo Microsoft Office Secured

echo. & echo Configuring UAC
reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /V PromptOnSecureDesktop /T REG_DWORD /D 1 /F >> nul 2>&1
reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /V ConsentPromptBehaviorAdmin /T REG_DWORD /D 1 /F >> nul 2>&1
reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /V ConsentPromptBehaviorUser /T REG_DWORD /D 0 /F >> nul 2>&1
reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /V FilterAdministratorToken /T REG_DWORD /D 1 /F >> nul 2>&1
reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /V EnableInstallerDetection /T REG_DWORD /D 1 /F >> nul 2>&1
reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /V EnableLUA /T REG_DWORD /D 1 /F >> nul 2>&1
reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /V EnableVirtualization /T REG_DWORD /D 1 /F >> nul 2>&1
echo. & echo UAC configured

echo. & echo Configuring services

REM Services that should be burned at the stake.
for %%S in (tapisrv,bthserv,mcx2svc,remoteregistry,seclogon,telnet,tlntsvr,p2pimsvc,simptcp,fax,msftpsvc,nettcpportsharing,iphlpsvc,lfsvc,bthhfsrv,irmon,sharedaccess,xblauthmanager,xblgamesave,xboxnetapisvc) do (
	sc config %%S start= disabled >> nul 2>&1
	sc stop %%S >> nul 2>&1
)

REM Services that are an automatic start.
for %%S in (eventlog,mpssvc) do (
	sc config %%S start= auto >> nul 2>&1
	sc start %%S >> nul 2>&1
)

REM Services that are an automatic (delayed) start.
for %%S in (windefend,sppsvc,wuauserv) do (
	sc config %%S start= delayed-auto >> nul 2>&1
	sc start %%S >> nul 2>&1
)

REM Services that are a manual start.
for %%S in (wersvc,wecsvc) do (
	sc config %%S start= demand >> nul 2>&1
)

echo. & echo Services configured.

echo. & echo Deleting Windows Shares

REG QUERY HKLM\System\CurrentControlSet\Services\LanmanServer\Shares > %APPDATA%\shares.txt

findstr /I /V HKEY_LOCAL_MACHINE %APPDATA%\shares.txt | findstr /I /V HKLM >> %APPDATA%\shares2.txt

setlocal EnableDelayedExpansion
for /F "usebackq delims=" %%S in ("%APPDATA%\shares2.txt") do (
    set "tempy=%%S"
	REM Grabs the first section in the line deliniated by 4 spaces.
    for /F "tokens=1 delims=|" %%N in ("!tempy:    =|!") do (
        net share "%%N" /Delete >> nul 2>&1
    )
)
endlocal

del %APPDATA%\shares.txt & del %APPDATA%\shares2.txt

echo. & echo Windows Shares deleted.

net stop WinRM
sc config WinRM start= disabled
echo Windows Remote Management service stopped and disabled

reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows NT\DNSClient" /v EnableMulticast /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" /v SMB1 /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v EnableLUA /t REG_DWORD /d 1 /f
net stop WinRM
wmic /interactive:off nicconfig where TcpipNetbiosOptions=1 call SetTcpipNetbios 2
powershell.exe Disable-WindowsOptionalFeature -Online -FeatureName smb1protocol -norestart
powershell.exe Disable-WindowsOptionalFeature -Online -FeatureName MicrosoftWindowsPowerShellV2 -norestart
powershell.exe Disable-WindowsOptionalFeature -Online -FeatureName MicrosoftWindowsPowerShellV2Root -norestart
echo Disabled DNS multicast, smbv1, netbios, powershellv2, Enables UAC

wmic /OUTPUT:E:\UserScripts\UsersAU.txt useraccount get name
echo UsersAU.txt created

pause
net user
echo SCRIPT COMPLETE
pause

