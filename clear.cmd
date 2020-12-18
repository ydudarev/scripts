rem проверка
@echo off
chcp 866
Title Clear script v 3.0
ver|find "5."&& goto xp_2k
:W7
FOR /F %%A IN ('DIR/B "C:\Users"') DO (
	DEL/S/Q/F "C:\Users\%%A\AppData\Local\Microsoft\Windows\Temporary Internet Files\*.*"
	rmdir /s /q "C:\Users\%%A\AppData\Local\Temporary Internet Files\"	
rem 	DEL/S/Q/F "C:\Users\%%A\AppData\Roaming\Microsoft\Windows\Network Shortcuts\*.*"
	DEL/S/Q/F "C:\Users\%%A\AppData\Roaming\Microsoft\Windows\Printer Shortcuts\*.*"
	DEL/S/Q/F "C:\Users\%%A\AppData\Roaming\Microsoft\Windows\Cookies\*.txt"
	DEL/S/Q/F "C:\Users\%%A\AppData\Roaming\Microsoft\Windows\Recent\*.*" 
rem 	DEL/S/Q/F "C:\Users\%%A\AppData\Local\ESET\ESET NOD32 Antivirus\Quarantine\*.*" 
	DEL/S/Q/F "C:\Users\%%A\AppData\Local\Temp\*.*" 

	 )
rmdir /s /q "C:\$Recycle.Bin\"

net stop wuauserv 
echo "Do not stop the script"
rmdir /s /q  %systemroot%\SoftwareDistribution\Download
rmdir /s /q  %systemroot%\SoftwareDistribution\DataStore
net start wuauserv 
rem работа с dism
c:\windows\system32\dism /online /cleanup-image /spsuperseded
c:\windows\SysWOW64\dism /online /cleanup-image /spsuperseded
goto end

:xp_2k
FOR /F %%A IN ('DIR/B "C:\Documents and Settings"') DO (
	DEL/S/Q/F "C:\Documents and Settings\%%A\Local Settings\Temp\*.*"
	DEL/S/Q/F "C:\Documents and Settings\%%A\Local Settings\Temporary Internet Files\*.*"
	rmdir /s /q "C:\Documents and Settings\%%A\Local Settings\Temporary Internet Files\*.*"
rem	DEL/S/Q/F "C:\Documents and Settings\%%A\NetHood\*.*"
rem 	DEL/S/Q/F "C:\Documents and Settings\%%A\Local Settings\Application Data\ESET\ESET NOD32 Antivirus\Quarantine\*.*"
	DEL/S/Q/F "C:\Documents and Settings\%%A\PrintHood\*.*"
	DEL/S/Q/F "C:\Documents and Settings\%%A\Cookies\*.txt"
	DEL/S/Q/F "C:\Documents and Settings\%%A\Recent\*.txt")

rem net stop wuauserv 
rmdir /s /q %systemroot%\ie8updates
rmdir /s /q %systemroot%\ie7updates
rmdir /s /q %systemroot%\ie8
rmdir /s /q %systemroot%\ie7
del /s /q  "%systemroot%\system32\config\systemprofile\Local Settings\Temp\*.*"
rem rmdir /s /q  %systemroot%\SoftwareDistribution\Download
rem rmdir /s /q  %systemroot%\SoftwareDistribution\DataStore
rem net start wuauserv 


net stop bits
net stop wuauserv
net stop cryptsvc
echo "***************************************"
echo "        Do not stop the script"
echo "***************************************"
Title Clear script v 3.0 -- Do not stop the script

del /f /s /q %windir%\SoftwareDistribution\download\*.*
rem ren %systemroot%\System32\Catroot2 Catroot2.old
rem ren %systemroot%\SoftwareDistribution SoftwareDistribution.old
del /f /s /q %systemroot%\System32\Catroot2
del /f /s /q %windir%\SoftwareDistribution\*.*
del /f /s /q %windir%\windowsupdate.log

%windir%\system32\regsvr32.exe /U /s %windir%\system32\vbscript.dll
%windir%\system32\regsvr32.exe /U /s %windir%\system32\mshtml.dll
%windir%\system32\regsvr32.exe /U /s %windir%\system32\msjava.dll
%windir%\system32\regsvr32.exe /U /s %windir%\system32\msxml.dll
%windir%\system32\regsvr32.exe /U /s %windir%\system32\actxprxy.dll
%windir%\system32\regsvr32.exe /U /s %windir%\system32\shdocvw.dll
%windir%\system32\regsvr32.exe /U /s %windir%\system32\Mssip32.dll
%windir%\system32\regsvr32.exe /U /s %windir%\system32\wintrust.dll
%windir%\system32\regsvr32.exe /U /s %windir%\system32\initpki.dll
%windir%\system32\regsvr32.exe /U /s %windir%\system32\dssenh.dll
%windir%\system32\regsvr32.exe /U /s %windir%\system32\rsaenh.dll
%windir%\system32\regsvr32.exe /U /s %windir%\system32\gpkcsp.dll
%windir%\system32\regsvr32.exe /U /s %windir%\system32\sccbase.dll
%windir%\system32\regsvr32.exe /U /s %windir%\system32\slbcsp.dll
%windir%\system32\regsvr32.exe /U /s %windir%\system32\cryptdlg.dll
%windir%\system32\regsvr32.exe /U /s %windir%\system32\Urlmon.dll
%windir%\system32\regsvr32.exe /U /s %windir%\system32\Oleaut32.dll
%windir%\system32\regsvr32.exe /U /s %windir%\system32\msxml2.dll
%windir%\system32\regsvr32.exe /U /s %windir%\system32\Browseui.dll
%windir%\system32\regsvr32.exe /U /s %windir%\system32\shell32.dll
%windir%\system32\regsvr32.exe /U /s %windir%\system32\Mssip32.dll
%windir%\system32\regsvr32.exe /U /s %windir%\system32\atl.dll
%windir%\system32\regsvr32.exe /U /s %windir%\system32\jscript.dll
%windir%\system32\regsvr32.exe /U /s %windir%\system32\msxml3.dll
%windir%\system32\regsvr32.exe /U /s %windir%\system32\softpub.dll
%windir%\system32\regsvr32.exe /U /s %windir%\system32\wuapi.dll
%windir%\system32\regsvr32.exe /U /s %windir%\system32\wuaueng.dll
%windir%\system32\regsvr32.exe /U /s %windir%\system32\wuaueng1.dll
%windir%\system32\regsvr32.exe /U /s %windir%\system32\wucltui.dll
%windir%\system32\regsvr32.exe /U /s %windir%\system32\wups.dll
%windir%\system32\regsvr32.exe /U /s %windir%\system32\wups2.dll
%windir%\system32\regsvr32.exe /U /s %windir%\system32\wuweb.dll

%windir%\system32\regsvr32.exe /s %windir%\system32\vbscript.dll
%windir%\system32\regsvr32.exe /s %windir%\system32\mshtml.dll
%windir%\system32\regsvr32.exe /s %windir%\system32\msjava.dll
%windir%\system32\regsvr32.exe /s %windir%\system32\msxml.dll
%windir%\system32\regsvr32.exe /s %windir%\system32\actxprxy.dll
%windir%\system32\regsvr32.exe /s %windir%\system32\shdocvw.dll
%windir%\system32\regsvr32.exe /s %windir%\system32\Mssip32.dll
%windir%\system32\regsvr32.exe /s %windir%\system32\wintrust.dll
%windir%\system32\regsvr32.exe /s %windir%\system32\initpki.dll
%windir%\system32\regsvr32.exe /s %windir%\system32\dssenh.dll
%windir%\system32\regsvr32.exe /s %windir%\system32\rsaenh.dll
%windir%\system32\regsvr32.exe /s %windir%\system32\gpkcsp.dll
%windir%\system32\regsvr32.exe /s %windir%\system32\sccbase.dll
%windir%\system32\regsvr32.exe /s %windir%\system32\slbcsp.dll
%windir%\system32\regsvr32.exe /s %windir%\system32\cryptdlg.dll
%windir%\system32\regsvr32.exe /s %windir%\system32\Urlmon.dll
%windir%\system32\regsvr32.exe /s %windir%\system32\Oleaut32.dll
%windir%\system32\regsvr32.exe /s %windir%\system32\msxml2.dll
%windir%\system32\regsvr32.exe /s %windir%\system32\Browseui.dll
%windir%\system32\regsvr32.exe /s %windir%\system32\shell32.dll
%windir%\system32\regsvr32.exe /s %windir%\system32\Mssip32.dll
%windir%\system32\regsvr32.exe /s %windir%\system32\atl.dll
%windir%\system32\regsvr32.exe /s %windir%\system32\jscript.dll
%windir%\system32\regsvr32.exe /s %windir%\system32\msxml3.dll
%windir%\system32\regsvr32.exe /s %windir%\system32\softpub.dll
%windir%\system32\regsvr32.exe /s %windir%\system32\wuapi.dll
%windir%\system32\regsvr32.exe /s %windir%\system32\wuaueng.dll
%windir%\system32\regsvr32.exe /s %windir%\system32\wuaueng1.dll
%windir%\system32\regsvr32.exe /s %windir%\system32\wucltui.dll
%windir%\system32\regsvr32.exe /s %windir%\system32\wups.dll
%windir%\system32\regsvr32.exe /s %windir%\system32\wups2.dll
%windir%\system32\regsvr32.exe /s %windir%\system32\wuweb.dll


%windir%\system32\regsvr32.exe /s /i browseui.dll
%windir%\system32\regsvr32.exe /s corpol.dll
%windir%\system32\regsvr32.exe /s dxtmsft.dll
%windir%\system32\regsvr32.exe /s dxtrans.dll
%windir%\system32\regsvr32.exe /s "%ProgramFiles%\internet explorer\hmmapi.dll"
%windir%\system32\regsvr32.exe /s ieaksie.dll
%windir%\system32\regsvr32.exe /s ieapfltr.dll
%windir%\system32\regsvr32.exe /s iedkcs32.dll
%windir%\system32\regsvr32.exe /s "%ProgramFiles%\internet explorer\iedvtool.dll"
%windir%\system32\regsvr32.exe /s iepeers.dll
%windir%\system32\regsvr32.exe /s "%ProgramFiles%\internet explorer\ieproxy.dll"
%windir%\system32\regsvr32.exe /s /i /n inetcpl.cpl
%windir%\system32\regsvr32.exe /s jscript.dll
%windir%\system32\regsvr32.exe /s licmgr10.dll
%windir%\system32\regsvr32.exe /s msdbg2.dll
%windir%\system32\regsvr32.exe /s mshtmled.dll
%windir%\system32\regsvr32.exe /s msident.dll
%windir%\system32\regsvr32.exe /s mstime.dll
%windir%\system32\regsvr32.exe /s "%ProgramFiles%\internet explorer\pdm.dll"
%windir%\system32\regsvr32.exe /s tdc.ocx
%windir%\system32\regsvr32.exe /s /i urlmon.dll
%windir%\system32\regsvr32.exe /s vbscript.dll
%windir%\system32\regsvr32.exe /s "%CommonProgramFiles%\microsoft shared\vgx\vgx.dll"
%windir%\system32\regsvr32.exe /s /i /n wininet.dll
 echo registering system files
%windir%\system32\regsvr32.exe /s extmgr.dll
%windir%\system32\regsvr32.exe /s mscoree.dll
%windir%\system32\regsvr32.exe /s oleacc.dll
%windir%\system32\regsvr32.exe /s ole32.dll
%windir%\system32\regsvr32.exe /s actxprxy.dll
%windir%\system32\regsvr32.exe /s asctrls.ocx
%windir%\system32\regsvr32.exe /s cdfview.dll
%windir%\system32\regsvr32.exe /s comcat.dll
%windir%\system32\regsvr32.exe /s /i /n comctl32.dll
%windir%\system32\regsvr32.exe /s cryptdlg.dll
%windir%\system32\regsvr32.exe /s /i /n digest.dll
%windir%\system32\regsvr32.exe /s dispex.dll
%windir%\system32\regsvr32.exe /s hlink.dll
%windir%\system32\regsvr32.exe /s mlang.dll
%windir%\system32\regsvr32.exe /s mobsync.dll
%windir%\system32\regsvr32.exe /s /i msieftp.dll
%windir%\system32\regsvr32.exe /s msr2c.dll
%windir%\system32\regsvr32.exe /s msxml.dll
%windir%\system32\regsvr32.exe /s oleaut32.dll
%windir%\system32\regsvr32.exe /s proctexe.ocx
%windir%\system32\regsvr32.exe /s /i scrobj.dll
%windir%\system32\regsvr32.exe /s /i shdocvw.dll
%windir%\system32\regsvr32.exe /s sendmail.dll
%windir%\system32\regsvr32.exe /s /i ieframe.dll
echo correcting bugs in the registry
 reg add "HKCR\TypeLib\{EAB22AC0-30C1-11CF-A7EB-0000C05BAE0B}\1.1\0\win32" /ve /t REG_SZ /d %systemroot%\system32\ieframe.dll /f
echo all tasks have been finished


net start bits
net start wuauserv
net start cryptsvc

wuauclt /detectnow /resetauthorization


attrib -r -h -s -a /S /D "%systemroot%\$*"
FOR /D %%$ IN (%systemroot%\$*) DO rmdir /s /q "%%$"
DEL/S/Q/F "C:\windows\KB*.log"
DEL /f /q /s /a : r s h a i l - "C:\RECYCLER\*.*"
rmdir /s /q "C:\RECYCLER\*.*"

:end
rmdir /s /q  "c:\Documents and Settings\All Users\Application Data\ESET\ESET NOD32 Antivirus\Logs\*.*"

attrib -r -h -s -a /S /D "%systemroot%\temp\*.*"
DEL /f /q /s "%systemroot%\temp\*.*"
FOR /F %%s IN ('DIR/B /a:d %systemroot%\temp') DO (
if not "%%s" == "sys"  rmdir /s /q "%systemroot%\temp\%%s"
)
rem   ¢¤àã£ temp ­¥ ¢ Windows\Temp ...
attrib -r -h -s -a /S /D "%temp%\*.*"
DEL /f /q /s "%temp%\*.*"
FOR /F %%s IN ('DIR/B /a:d %temp%') DO (
if not "%%s" == "sys"  rmdir /s /q "%temp%\%%s"
)

echo  ®á«¥¤­¨¥ èâà¨å¨
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Active Setup Temp Folders" /v "StateFlags0032"  /t REG_DWORD  /d 2 /f 
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Compress old files" /v "StateFlags0032"  /t REG_DWORD  /d 2 /f 
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Content Indexer Cleaner" /v "StateFlags0032"  /t REG_DWORD  /d 2 /f 
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Downloaded Program Files" /v "StateFlags0032"  /t REG_DWORD  /d 2 /f 
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Internet Cache Files" /v "StateFlags0032"  /t REG_DWORD  /d 2 /f 
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Memory Dump Files" /v "StateFlags0032"  /t REG_DWORD  /d 2 /f 
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Microsoft_Event_Reporting_2.0_Temp_Files" /v "StateFlags0032"  /t REG_DWORD  /d 2 /f 
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Office Setup Files" /v "StateFlags0032"  /t REG_DWORD  /d 2 /f 
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Offline Pages Files" /v "StateFlags0032"  /t REG_DWORD  /d 2 /f 
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Old ChkDsk Files" /v "StateFlags0032"  /t REG_DWORD  /d 2 /f 
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Recycle Bin" /v "StateFlags0032"  /t REG_DWORD  /d 2 /f 
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Setup Log Files" /v "StateFlags0032"  /t REG_DWORD  /d 2 /f 
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Temporary Files" /v "StateFlags0032"  /t REG_DWORD  /d 2 /f 
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\WebClient and WebPublisher Cache" /v "StateFlags0032"  /t REG_DWORD  /d 2 /f 

start /LOW cleanmgr.exe /sagerun:32 /VERYLOWDISK
Title Clear script v 3.0 -- Clear complete!
echo Clear complete! 
echo Clear complete! %data%   %Time% >>c:\vbs.txt

pause 0
