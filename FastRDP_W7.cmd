@echo off
Title FastRDP v 1.0

reg add "HKLM\Software\Policies\Microsoft\SystemCertificates\AuthRoot" /v "DisableRootAutoUpdate"  /t REG_DWORD  /d 0 /f 

echo Clear complete! %data%  %Time% >> c:\FastRDP.txt