@echo off 
echo.
echo.
echo.
echo.
echo.
echo ��������!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
echo ������ �ணࠬ�� ����뢠�� ��� ��� ᮥ������� (� �����訥 ��ᨨ) 
echo �� �᭮���� �ࢥ� �ନ�����.
echo ���⮬�, �᫨ �� �������� �����⨫� ��� �ணࠬ�� - ���ன� ��
echo.
echo.
echo.
echo.
echo.
pause 
FOR /F "tokens=2,3" %%i in ('qwinsta /SERVER:server_4') do (if /i %%i==%USERNAME% logoff %%j /SERVER:Server_4)