' ------------------------------------------------------------
' ������ �������� ��������� ��������
' �������� �� 05.03.2013
' ����� ������� 1,2,3 ��� 1 3 ��� 2.3 � ��� �� 5-10 
' ------------------------------------------------------------

Dim Shell, UserVar
Dim ProcArch, strPrintDrivers, iPrintDrivers
Dim ArrDrivers(), arr()
Dim FlagAlldell: FlagAlldell= false
Const HKEY_LOCAL_MACHINE = &H80000002 
Set WshShl = WScript.CreateObject("WScript.Shell")
Set Shell = WshShl.Environment("System")
'Read architecture
ProcArch = Shell("PROCESSOR_ARCHITECTURE") 'x86 or AMD64


Function IsCScript()
  If (InStr(UCase(WScript.FullName), "CSCRIPT") <> 0) Then
    IsCScript = True
      Else
    IsCScript = False
  end If
end Function


  if not IsCScript Then
      WshShl.Run "cscript " & WScript.ScriptFullName,0,True ("����������� ������ ��������� ������� �� CSCRIPT. ������������� ������.")  
      WScript.Quit
  end If
'




  
'����������� ��� ��������� ��������
 
strComputer = "." 
  
Set oReg=GetObject("winmgmts:{impersonationLevel=impersonate}!\\" & _  
    strComputer & "\root\default:StdRegProv") 
  
If ProcArch="x86" Then 
	strKeyPath = "System\CurrentControlSet\Control\Print\Environments\Windows NT x86\Drivers\Version-3" 
	Else If ProcArch="AMD64" Then 
		strKeyPath = "System\CurrentControlSet\Control\Print\Environments\Windows x64\Drivers\Version-3" 
	Else
		MsgBox "� ��� ��� � �������???.... ������ �� ������� :)"
		WScript.Quit
	End If
End if



oReg.EnumKey HKEY_LOCAL_MACHINE, strKeyPath, arrSubKeys 
strPrintDrivers = ""
i = 0
For Each subkey In arrSubKeys 
	i = i + 1
	ReDim Preserve ArrDrivers(i)
	ArrDrivers(i) = subkey
	strKeyPath_ver = strKeyPath & "\" & subkey
	oReg.GetStringValue HKEY_LOCAL_MACHINE,strKeyPath_ver,"DriverVersion",strValue
	if iPrintDrivers = 1 then
		strPrintDrivers = "1. "   &  subkey  & " version:" & strValue & vbCrLf 
	else
		strPrintDrivers = strPrintDrivers & CStr(i) & ". "  & subkey & " version:" & strValue &  vbCrLf
	end if
    
Next 
' �������� ������� ��� �������� 

arInputDrv = InputBox("������� ����� ��������, ������� �� ������ ������� " & vbCrLf&"����� ������� ��������� 1,2,3"& vbCrLf&"1-3 �����"& vbCrLf& vbCrLf& strPrintDrivers,"�������� ��������� ��������" , "" )
If len(arInputDrv)<1 Then arInputDrv=vbOKCancel
If arInputDrv= vbOKCancel Then  WScript.Quit

'����������� 
If InStr(arInputDrv, ",") Then 
		arrInputDrv = Split(arInputDrv,",")
	ElseIf InStr(arInputDrv, ".") Then 
		arrInputDrv = Split(arInputDrv,".")
	Else 
		arrInputDrv = Split(arInputDrv," ")
End If



a=0
For s=0 To  UBound(arrInputDrv)
	If InStr(arrInputDrv(s),"-") Then 
		n0= Split (arrInputDrv(s),"-")
		n1= CInt(n0(0))
		n2= CInt(n0(1))
		If n2>i  Then
			MsgBox "�� ����� �������� ��������. �������� ����� ��������"
	    	WScript.Quit
		End If 
		For ss=n1 To n2
			ReDim Preserve arr(a) 
			arr(a)= ss
			a=a+1
		Next
	Else 
			ReDim Preserve arr(a) 
			arr(a)=arrInputDrv(s)
			a=a+1
	End If
Next
If UBound (arr)>UBound (arrInputDrv) Then 
	ReDim Preserve arrInputDrv (UBound (arr))
	For s=0 To UBound (arrInputDrv)
	arrInputDrv(s)=arr(s)
	Next
end If

If len(arrInputDrv(0))<1 Then 
	MsgBox "�� ����� �������� ��������. �������� ����� ��������"
	     WScript.Quit
End If

rc=MsgBox ("��������� �������� ��� ����  ��������� ����������?" & vbCrLf&"� ���������� : " & UBound (arrInputDrv)+1, vbYesNo)

 If rc= vbYes Then 
 		FlagAlldell= True
 	Else 
 		FlagAlldell= false
 End If

For S=0 To UBound(arrInputDrv)
InputDrv=arrInputDrv(S)
If not IsNumeric(InputDrv) then
	MsgBox "�� ����� �������� ��������. �������� ����� ��������"
	     WScript.Quit
End If
InputDrv = CInt(InputDrv)
If InputDrv > i or InputDrv=0  THEN
	MsgBox "�� ����� �������� �����. �������� ����� ��������"
	     WScript.Quit
End If


If FlagAlldell= False Then 
	rc=MsgBox ("����� ������ ������� �������� " &  ArrDrivers(InputDrv), vbYesNo)
	Else 
	rc= vbYes
End If

 If rc= vbYes Then 
 		DellPrint (InputDrv)
 	Else 
 		MsgBox "������� �������� " &  ArrDrivers(InputDrv) & "  ��������."
 End If
Next

MsgBox "������ ������ ��������." & vbCrLf & vbCrLf & " �����."
WScript.Quit

Function DellPrint(InputDrv)
' ���������� ������ ������ ��� ��������
Dim FileDelList()

strKeyPath2 = strKeyPath & "\" &  ArrDrivers(InputDrv)
strValueName = "Dependent Files" 
oReg.GetMultiStringValue HKEY_LOCAL_MACHINE,strKeyPath2, _ 
    strValueName,FileDelList
Wscript.Echo "Delete Driver's Files" 
Wscript.Echo UBound(FileDelList)
ReDim Preserve FileDelList(UBound(FileDelList)+3)

strKeyName = "Driver"
oReg.GetStringValue HKEY_LOCAL_MACHINE,strKeyPath2,strKeyName,strValue
FileDelList(UBound(FileDelList)-2) = strValue

strKeyName = "Configuration File"
oReg.GetStringValue HKEY_LOCAL_MACHINE,strKeyPath2,strKeyName,strValue
FileDelList(UBound(FileDelList)-1) = strValue

strKeyName = "Data File"
oReg.GetStringValue HKEY_LOCAL_MACHINE,strKeyPath2,strKeyName,strValue
FileDelList(UBound(FileDelList)) = strValue


strValue = ""
For Each strValue In FileDelList
    Wscript.Echo  strValue 
Next 

Wscript.Echo "Stop Spooler Service"
Set objWMIService = GetObject("winmgmts:\\" & strComputer & "\root\CIMV2") 
Set objShare = objWMIService.Get("Win32_Service.Name='Spooler'") 
Set objOutParams = objWMIService.ExecMethod("Win32_Service.Name='Spooler'", "StopService")

Wscript.Echo "Kill (PrintIsolationHost.exe, Explorer,  DeviceDisplayObjectProvider.exe)"


Set WshShell = CreateObject("WScript.Shell")

wshshell.run("taskkill /F /IM PrintIsolationHost.exe") 
wshshell.run("taskkill /F /IM explorer.exe") 
wshshell.run("taskkill /F /IM DeviceDisplayObjectProvider.exe") 


wscript.sleep 3000 

Wscript.Echo "Delete Driver's Files" 
 
' ������� ����� 

'������� ������� ��������, ����� ��� ������ �������� ����� ������ ��������� ������

If ProcArch="x86" Then 
	FolderSpec = "c:\Windows\System32\spool\drivers\w32x86\3\"
Else 
	FolderSpec = "c:\Windows\System32\spool\drivers\x64\3\"
End If

Set fso = CreateObject("Scripting.FileSystemObject")
For Each strValue In FileDelList
	If fso.FileExists(FolderSpec & strValue) then
		        	Wscript.Echo  "�������� " & FolderSpec & strValue  
		     	deleteAFile (FolderSpec & strValue)
'        		Wscript.Echo  strValue & " --- ������. ()"
        	end if

	If fso.FileExists(FolderSpec & strValue) then
        		Wscript.Echo  strValue & " --- !!! �, ���, �� ������ !!! ���� �� ����� !!!"
        	end if

Next 


'������� ������ ������� �� ���� ��������
Wscript.Echo "������� ������ � �������"
oReg.DeleteKey HKEY_LOCAL_MACHINE, strKeyPath2 

' �������� ������ ������ ������
Wscript.Echo "Start Spooler Service"
        wscript.sleep 3000 
 Set objOutParams = objWMIService.ExecMethod("Win32_Service.Name='Spooler'", "StartService")
' ������ ������� ����
'Wscript.Echo "Start Explorer"
'wshshell.run("c:\Windows\explorer.exe") 

Wscript.Echo "��� �������� ��������� �������. "


 WScript.Echo "The script is complete."

end Function 

Function deleteAfile(filespec)
On Error Resume Next
Set fso = CreateObject("Scripting.FileSystemObject")
deleteAfile = true
fso.deleteFile filespec , true

If Err.Number Then
 wscript.echo "  " & filespec  &"  Error " & Err.Description 
 Else
 wscript.echo  " - ������ -"
 Err.Clear
 End If
end Function 
