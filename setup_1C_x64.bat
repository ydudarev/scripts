set lc_dir="%userprofile%\AppData\Roaming\1C\1CEStart"
set srv_dir="\\storage2\soft\1C\ibases.v8i"
set srv_nethasp="\\storage2\soft\1C\hasp\CLIENT\nethasp.ini"
set lc_nethasp="C:\Program Files\1cv8\conf\"
set srv_path="\\storage2\soft\1C\setup_8314z\distr2_64\windows\setup64full"
set lc_path="D:\tmp\"
rem echo "Копиируем nethasp и список баз"
rem xcopy %srv_nethasp% %lc_nethasp% /Y /C /R
rem xcopy %srv_dir% %lc_dir% /Y /C /R
rem echo "Копиируем файлы дистрибутива 1С на рабочую станцию"
rem xcopy %srv_path% %lc_path% /Y /C /R /I
cd %lc_path%
start "%lc_path%setup.exe"