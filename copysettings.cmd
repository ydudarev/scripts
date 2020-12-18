@echo off
mode con cp select=1251 >nul
rem Разные настройки в зависимости от разных осей и языков
if exist "%SystemDrive%%Homepath%\Рабочий стол\." (
set foldername=%SystemDrive%%Homepath%\Рабочий стол\
) else (
set foldername=%SystemDrive%%Homepath%\Desktop\
)
rem Потом убрать нафиг. Это временная чистка
rem del "%foldername%*.rdp" /Q

set fpath="%foldername%Сервер 1с.rdp"
rem if exist %fpath% goto step2 все равно перезапишу, не так и долго
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
set fpath="%foldername%Старые базы.rdp"
rem if exist %fpath% goto end  все равно перезапишу, не так и долго
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
copy "\\PILOT\sysvol\epb.local\Policies\{31B2F340-016D-11D2-945F-00C04FB984F9}\USER\Scripts\Logon\1c.rdp" "%foldername%1с хитрая.rdp"
copy "\\PILOT\sysvol\epb.local\Policies\{31B2F340-016D-11D2-945F-00C04FB984F9}\USER\Scripts\Logon\Я завис(ла). Убейте меня нежно.bat" "%foldername%Я завис(ла). Убейте меня нежно.bat"
rem copy "\\PILOT\sysvol\epb.local\Policies\{31B2F340-016D-11D2-945F-00C04FB984F9}\USER\Scripts\Logon\кеш1С.bat" "%foldername%кеш1С.bat"