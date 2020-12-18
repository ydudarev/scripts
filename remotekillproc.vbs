strComputer = InputBox("Имя компа?") 
strProctarget    = InputBox("имя_процесса")

Set objSWbemLocator = CreateObject("WbemScripting.SWbemLocator") 
Set objWMIService = objSWbemLocator.ConnectServer(strComputer, _ 
    "root\CIMV2") 
Set colProcessList = objWMIService.ExecQuery _
("Select * from Win32_Process Where Name = '" _
 & strProctarget  & "'") 

For Each objProcess in colProcessList
    objProcess.Terminate()
Next