@echo off
mode con cp select=1251 >nul
rem ������ ��������� � ����������� �� ������ ���� � ������
if exist "%SystemDrive%%Homepath%\������� ����\." (
set foldername=%SystemDrive%%Homepath%\������� ����\
) else (
set foldername=%SystemDrive%%Homepath%\Desktop\
)
rem ����� ������ �����. ��� ��������� ������
rem del "%foldername%*.rdp" /Q

set fpath="%foldername%������ 1�.rdp"
rem if exist %fpath% goto step2 ��� ����� ����������, �� ��� � �����
echo screen mode id:i:2>%fpath%
echo desktopwidth:i:1024>>%fpath%
echo desktopheight:i:768>>%fpath%
echo session bpp:i:16>>%fpath%
echo winposstr:s:0,3,0,0,800,600>>%fpath%
echo full address:s:pyramid.epb.local>>%fpath%
echo compression:i:1>>%fpath%
echo keyboardhook:i:2>>%fpath%
echo audiomode:i:2>>%fpath%
echo redirectdrives:i:0>>%fpath%
echo redirectprinters:i:0>>%fpath%
echo redirectcomports:i:1>>%fpath%
echo redirectsmartcards:i:0>>%fpath%
echo displayconnectionbar:i:1>>%fpath%
echo autoreconnection enabled:i:1>>%fpath%
echo username:s:%USERNAME%>>%fpath%
echo domain:s:epb.local>>%fpath%
echo alternate shell:s:>>%fpath%
echo shell working directory:s:>>%fpath%
echo disable wallpaper:i:1>>%fpath%
echo disable full window drag:i:1>>%fpath%
echo disable menu anims:i:1>>%fpath%
echo disable themes:i:0>>%fpath%
echo disable cursor setting:i:0>>%fpath%
echo bitmapcachepersistenable:i:1>>%fpath%
echo allow font smoothing:i:1>>%fpath%
echo gatewayprofileusagemethod:i:1>>%fpath%
prompt for credentials:i:1

:step2
set fpath="%foldername%������ ����.rdp"
rem if exist %fpath% goto end  ��� ����� ����������, �� ��� � �����
echo screen mode id:i:2>%fpath%
echo desktopwidth:i:1024>>%fpath%
echo desktopheight:i:768>>%fpath%
echo session bpp:i:16>>%fpath%
echo winposstr:s:0,3,0,0,800,600>>%fpath%
echo full address:s:pilot.epb.local>>%fpath%
echo compression:i:1>>%fpath%
echo keyboardhook:i:2>>%fpath%
echo audiomode:i:2>>%fpath%
echo redirectdrives:i:0>>%fpath%
echo redirectprinters:i:0>>%fpath%
echo redirectcomports:i:0>>%fpath%
echo redirectsmartcards:i:0>>%fpath%
echo displayconnectionbar:i:1>>%fpath%
echo autoreconnection enabled:i:1>>%fpath%
echo username:s:%USERNAME%>>%fpath%
echo domain:s:epb.local>>%fpath%
echo alternate shell:s:>>%fpath%
echo shell working directory:s:>>%fpath%
echo disable wallpaper:i:1>>%fpath%
echo disable full window drag:i:1>>%fpath%
echo disable menu anims:i:1>>%fpath%
echo disable themes:i:0>>%fpath%
echo disable cursor setting:i:0>>%fpath%
echo bitmapcachepersistenable:i:1>>%fpath%
echo allow font smoothing:i:1>>%fpath%
echo gatewayprofileusagemethod:i:1>>%fpath%


:end
copy "\\PILOT\sysvol\epb.local\Policies\{31B2F340-016D-11D2-945F-00C04FB984F9}\USER\Scripts\Logon\1c.rdp" "%foldername%1� ������.rdp"
copy "\\PILOT\sysvol\epb.local\Policies\{31B2F340-016D-11D2-945F-00C04FB984F9}\USER\Scripts\Logon\� �����(��). ������ ���� �����.bat" "%foldername%� �����(��). ������ ���� �����.bat"
rem copy "\\PILOT\sysvol\epb.local\Policies\{31B2F340-016D-11D2-945F-00C04FB984F9}\USER\Scripts\Logon\���1�.bat" "%foldername%���1�.bat"