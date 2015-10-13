!include "MUI.nsh"
 
Name "FusionLauncher"
RequestExecutionLevel admin
!define INSTALLNAME "FusionLauncher"
!define COMPANY "Project Fusion"
!define VERSION 0.9.1
;in KB!
!define INSTALLSIZE 20000

OutFile "./${INSTALLNAME}_Setup.exe"
InstallDir $PROGRAMFILES\${INSTALLNAME}

!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_COMPONENTS
!insertmacro MUI_PAGE_INSTFILES


!insertmacro MUI_UNPAGE_CONFIRM
!insertmacro MUI_UNPAGE_INSTFILES


!insertmacro MUI_LANGUAGE "English"

Section ""
    SetShellVarContext current
	SetOutPath $INSTDIR
	File /r Files\*
	WriteUninstaller $INSTDIR\uninstall.exe
	CreateDirectory "$LOCALAPPDATA\Fusion\"
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${INSTALLNAME}" "DisplayName" "${INSTALLNAME}"
    WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${INSTALLNAME}" "UninstallString" '"$INSTDIR\uninstall.exe"'
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${INSTALLNAME}" "Publisher" "${COMPANY}"
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${INSTALLNAME}" "DisplayIcon" "$INSTDIR\Fusion.ico"
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${INSTALLNAME}" "DisplayVersion" ${VERSION}
	WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${INSTALLNAME}" "EstimatedSize" ${INSTALLSIZE}
    WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${INSTALLNAME}" "NoModify" 1
    WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${INSTALLNAME}" "NoRepair" 1
SectionEnd

Section "Desktop Shortcut"
    CreateShortCut "$DESKTOP\${INSTALLNAME}.lnk" "$INSTDIR\${INSTALLNAME}.exe" ""
SectionEnd

Section "Start Menu Shortcuts"
  CreateDirectory "$SMPROGRAMS\${INSTALLNAME}"
  CreateShortCut "$SMPROGRAMS\${INSTALLNAME}\Uninstall.lnk" "$INSTDIR\uninstall.exe" "" "$INSTDIR\uninstall.exe" 0
  CreateShortCut "$SMPROGRAMS\${INSTALLNAME}\${INSTALLNAME}.lnk" "$INSTDIR\${INSTALLNAME}.exe" "" "$INSTDIR\${INSTALLNAME}.exe" 0
  CreateShortCut "$SMPROGRAMS\${INSTALLNAME}\FusionUpdater.lnk" "$INSTDIR\FusionUpdater.exe" "" "$INSTDIR\FusionUpdater.exe" 0
SectionEnd

Section "Uninstall"
  SetShellVarContext current
  DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${INSTALLNAME}"
  Delete $INSTDIR\*
  RMDir /r $INSTDIR  
  
  ;SHORTCUTS
  Delete "$DESKTOP\${INSTALLNAME}.lnk"
  Delete "$SMPROGRAMS\${INSTALLNAME}\*"
  RMDir "$SMPROGRAMS\${INSTALLNAME}"
  
  ;APP-DATA
  Delete "$LOCALAPPDATA\Fusion\*"
  RMDir /r "$LOCALAPPDATA\Fusion"
  
SectionEnd

