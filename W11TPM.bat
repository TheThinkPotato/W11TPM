@ECHO OFF

CALL :Title

IF /i %1% == HELP GOTO help

IF /i %1% == NEW GOTO add

IF /i %1% == REMOVE GOTO remove

IF /i %1% == READ GOTO read

GOTO help

:help
echo This tool will add or remove the needed regestry key for windows 11 tpm check on install.
echo By running this tool during an install of windows 11 or in window 10 before an upgrade will enable you to add or 
echo remove the TPM bypass check on the Windows 11 install.
echo.
echo To add or remove a TPM bypass key you must be running as an administrator
echo.
echo ========================================================================================================
echo W11TPM NEW       -creates TPM bypess regestry key
echo W11TPM REMOVE    -removes TPM bypass key
echo.
echo NEW (or) new        = create TPM bypass key
echo REMOVE (or) remove  = deletes TPM bypass key
echo READ (or) read      = check if key exists and the information it holds.
echo HELP (or) help      = displays help.
echo ========================================================================================================
echo.
GOTO END

:add
reg add HKLM\SYSTEM\Setup\LabConfig /v BypassTPMCheck /t REG_DWORD /d 1
reg add HKLM\SYSTEM\Setup\LabConfig /v BypassSecureBootCheck /t REG_DWORD /d 1
reg add HKLM\SYSTEM\Setup\LabConfig /v BypassRAMCheck /t REG_DWORD /d 1
reg add HKLM\SYSTEM\Setup\MoSetup /v AllowUpgradesWithUnsupportedTPMOrCPU /t REG_DWORD /d 1
GOTO END

:remove
reg delete HKLM\SYSTEM\Setup\LabConfig /v BypassTPMCheck
reg delete HKLM\SYSTEM\Setup\LabConfig /v BypassSecureBootCheck
reg delete HKLM\SYSTEM\Setup\LabConfig /v BypassRAMCheck
reg delete HKLM\SYSTEM\Setup\MoSetup /v AllowUpgradesWithUnsupportedTPMOrCPU
GOTO END

:read
reg query HKLM\SYSTEM\Setup\LabConfig /v BypassTPMCheck
reg query HKLM\SYSTEM\Setup\LabConfig /v BypassSecureBootCheck
reg query HKLM\SYSTEM\Setup\LabConfig /v BypassRAMCheck
reg query HKLM\SYSTEM\Setup\MoSetup /v AllowUpgradesWithUnsupportedTPMOrCPU
GOTO END


:Title
 echo. 
 echo  Windows 11 TPM bypass tool. V1.0a
 echo ===================================
 echo. 
 exit /b 0
}

:END