@Echo off

reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v "MigrateProxy" /t REG_DWORD /d 00000001 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v "ProxyEnable" /t REG_DWORD /d 00000001 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v "ProxyServer" /t REG_SZ /d 10.77.44.102:8080 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v "ProxyOverride" /t REG_SZ /d "10.77.*.*;*.tech.nis-glonass.ru" /f      
