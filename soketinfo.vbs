dim cpuman, socket, cname
On Error Resume Next
Set objService = GetObject("winmgmts:{impersonationLevel=impersonate}!\\.\root\CIMV2")
If Err.Number <> 0 Then
	WScript.Echo Err.Number & ": " & Err.Description
	WScript.Quit
End If
For Each objProc In objService.ExecQuery("SELECT * FROM Win32_Processor")
	WScript.Echo objProc.Manufacturer'производитель
	WScript.Echo objProc.SocketDesignation'тип chip socket'а
	WScript.Echo objProc.SystemName'имя компьютера
Next