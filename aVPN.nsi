!include "MUI2.nsh"
!include "FileFunc.nsh"

Name "aVPN"
OutFile "aVPN-Setup.exe"
InstallDir "$PROGRAMFILES\aVPN"
RequestExecutionLevel admin

!define MUI_ICON "${NSISDIR}\Contrib\Graphics\Icons\modern-install.ico"
!define MUI_HEADERIMAGE
!define MUI_HEADERIMAGE_BITMAP "nsis\images\header-openconnect.bmp"
!define MUI_WELCOMEFINISHPAGE_BITMAP "nsis\images\install-openconnect.bmp"

!define MUI_ABORTWARNING
!define MUI_FINISHPAGE_RUN "$INSTDIR\avpn.exe"

!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_PAGE_FINISH

!insertmacro MUI_UNPAGE_CONFIRM
!insertmacro MUI_UNPAGE_INSTFILES

!insertmacro MUI_LANGUAGE "SimpChinese"

Section "MainSection" SEC01
  SetOutPath "$INSTDIR"
  SetOverwrite on
  
  File /r "${BUILD_DIR}\bin\*.*"
  File /r "${BUILD_DIR}\Drivers\*.*"
  
  CreateDirectory "$SMPROGRAMS\aVPN"
  CreateShortCut "$SMPROGRAMS\aVPN\aVPN.lnk" "$INSTDIR\avpn.exe"
  CreateShortCut "$DESKTOP\aVPN.lnk" "$INSTDIR\avpn.exe"
  
  WriteUninstaller "$INSTDIR\Uninstall.exe"
  
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\aVPN" "DisplayName" "aVPN"
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\aVPN" "UninstallString" "$INSTDIR\Uninstall.exe"
SectionEnd

Section "Uninstall"
  Delete "$INSTDIR\Uninstall.exe"
  Delete "$DESKTOP\aVPN.lnk"
  Delete "$SMPROGRAMS\aVPN\aVPN.lnk"
  RMDir "$SMPROGRAMS\aVPN"
  
  RMDir /r "$INSTDIR"
  
  DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\aVPN"
SectionEnd
