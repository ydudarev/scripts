@echo off 
echo.
echo.
echo.
echo.
echo.
echo Внимание!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
echo Данная программа закрывает ВСЕ ваши соединения (и зависшие сессии) 
echo на основном сервере терминалов.
echo Поэтому, если вы СЛУЧАЙНО запустили эту программу - закройте ее
echo.
echo.
echo.
echo.
echo.
pause 
FOR /F "tokens=2,3" %%i in ('qwinsta /SERVER:server_4') do (if /i %%i==%USERNAME% logoff %%j /SERVER:Server_4)