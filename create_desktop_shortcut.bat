@echo off
REM Create desktop shortcut for aVPN after installation

set SCRIPT="%TEMP%\create_shortcut.vbs"

echo Set oWS = WScript.CreateObject("WScript.Shell") > %SCRIPT%
echo sLinkFile = oWS.SpecialFolders("Desktop") ^& "\aVPN.lnk" >> %SCRIPT%
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> %SCRIPT%
echo oLink.TargetPath = "%~dp0avpn.exe" >> %SCRIPT%
echo oLink.WorkingDirectory = "%~dp0" >> %SCRIPT%
echo oLink.Description = "aVPN VPN Client" >> %SCRIPT%
echo oLink.Save >> %SCRIPT%

cscript //nologo %SCRIPT%
del %SCRIPT%

echo Desktop shortcut created successfully.
