
@echo off
rem ��ਯ� ����ன�� NTP ������ Windows
echo ��ਯ� ����ன�� NTP ������ Windows
echo.



rem -- ������ � ����⢥ �ࢥ� �� 㬮�砭�� 0 �����
echo.
echo =======================================================
echo ������ � ����⢥ �ࢥ� �� 㬮�砭�� 0 �����
REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\DateTime\Servers /ve /t REG_SZ /d 0 /f

rem -- ।����㥬 ���祭�� �ࢥ� ���������� �� ᯨ᪠ ��� ����஬ 0
echo.
echo =======================================================
echo �����塞 ⥪�騥 ���祭�� �ࢥ� ���������� ᯨ᪠ �ࢥ஢ �� 10.0.0.103
REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\DateTime\Servers /v 0 /t REG_SZ /d 10.0.0.103 /f

rem -- ����砥� NTP ������
echo.
echo =======================================================
echo ����砥� NTP ������
REG ADD HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\W32Time\Parameters /v Type /t REG_SZ /d NTP /f

rem -- ������ ⥪�騩 �ࢥ� ����������
echo.
echo =======================================================
echo ������ ⥪�騩 �ࢥ� ���������� 10.0.0.103
REG ADD HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\W32Time\Parameters /v NtpServer /t REG_SZ /d 10.0.0.103,0x9 /f

rem -- ��⠭�������� ��ਮ� ����������
echo.
echo =======================================================
echo ��⠭�������� ��ਮ� ���������� 60 �����
rem -- ��ॢ�� �६��� � ᥪ㭤�
set /a ntp_update*=60
REG ADD HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\W32Time\TimeProviders\NtpClient /v SpecialPollInterval /t REG_DWORD /d 1440 /f

rem -- ������ �㦡� �६��� ��⮬���᪨� �����
echo.
echo =======================================================
echo ������ �㦡� �६��� ��⮬���᪨� ����� 
sc config w32time start= auto

rem -- ����᪠��/��१���᪠�� ������饭���/����饭��� �㦡� �६��� 
echo. && echo======================================================= && echo ����⪠ ��१���᪠ �㦡� �६��� && echo. && sc stop w32time && PING -n 5 -w 1000 127.0.0.1 >nul && sc start w32time || echo. && echo ======================================================= && echo ����⪠ ����᪠ �㦡� �६��� && echo. && sc start w32time 

echo.
pause