mkdir D:\Home\Desktop
mkdir D:\Home\My_Document
xcopy "%UserProfile%\����稩 �⮫" D:\Home\Desktop /s/e/y
xcopy "%UserProfile%\��� ���㬥���" D:\Home\My_Document /s/e/y
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v Desktop /t REG_SZ /d "D:\Home\Desktop" /f
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v Desktop /t REG_EXPAND_SZ /d "D:\Home\Desktop" /f
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v Personal /t REG_EXPAND_SZ /d "D:\Home\My_Document" /f