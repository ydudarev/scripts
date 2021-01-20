@echo off
reg add "HKEY_CURRENT_USER\Software\Microsoft\Office\16.0\Outlook\AutoDiscover" /v "ExcludeExplicitO365Endpoint"  /t REG_DWORD  /d 1 /f