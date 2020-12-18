@echo off
net use * /delete /y
net use l: \\pilot\common

%windir%\system32\cscript.exe \\epb.local\sysvol\epb.local\Policies\{31B2F340-016D-11D2-945F-00C04FB984F9}\User\Scripts\Logon\disk.vbs
start \\pilot\sysvol\epb.local\Policies\{31B2F340-016D-11D2-945F-00C04FB984F9}\USER\Scripts\Logon\Bginfo.exe\pilot\sysvol\epb.local\Policies\{31B2F340-016D-11D2-945F-00C04FB984F9}\USER\Scripts\Logon\config.bgi /timer:0 /accepteula