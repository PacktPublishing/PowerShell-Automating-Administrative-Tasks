
$UserName = (Get-Item  env:\username).Value 
$ComputerName = (Get-Item env:\Computername).Value
$filepath = (Get-ChildItem env:\userprofile).value


Add-Content  "$Filepath\style.CSS"  -Value " body {
font-family:Calibri;
 font-size:10pt;
}
th { 
background-color:black;

color:white;
}
td {
 background-color:#19fff0;
color:black;
}"

Write-Host "CSS File Created Successfully... Executing Inventory Report!!! Please Wait !!!" -ForegroundColor Yellow 
#ReportDate
$ReportDate = Get-Date | Select -Property DateTime |ConvertTo-Html -Fragment

#General Information
$ComputerSystem = Get-WmiObject -Class Win32_ComputerSystem | 
Select -Property Model , Manufacturer , Description , PrimaryOwnerName , SystemType |ConvertTo-Html -Fragment

#Boot Configuration
$BootConfiguration = Get-WmiObject -Class Win32_BootConfiguration |
Select -Property Name , ConfigurationPath | ConvertTo-Html -Fragment 

#BIOS Information
$BIOS = Get-WmiObject -Class Win32_BIOS | Select -Property PSComputerName , Manufacturer , Version | ConvertTo-Html -Fragment

#Operating System Information
$OS = Get-WmiObject -Class Win32_OperatingSystem | Select -Property Caption , CSDVersion , OSArchitecture , OSLanguage | ConvertTo-Html -Fragment

#Time Zone Information
$TimeZone = Get-WmiObject -Class Win32_TimeZone | Select Caption , StandardName |
ConvertTo-Html -Fragment

#Logical Disk Information
$Disk = Get-WmiObject -Class Win32_LogicalDisk -Filter DriveType=3 | 
Select SystemName , DeviceID , @{Name=”size(GB)”;Expression={“{0:N1}” -f($_.size/1gb)}}, @{Name=”freespace(GB)”;Expression={“{0:N1}” -f($_.freespace/1gb)}} |
ConvertTo-Html -Fragment

#CPU Information
$SystemProcessor = Get-WmiObject -Class Win32_Processor  | 
Select SystemName , Name , MaxClockSpeed , Manufacturer , status |ConvertTo-Html -Fragment

#Memory Information
$PhysicalMemory = Get-WmiObject -Class Win32_PhysicalMemory |
Select -Property Tag , SerialNumber , PartNumber , Manufacturer , DeviceLocator , @{Name="Capacity(GB)";Expression={"{0:N1}" -f ($_.Capacity/1GB)}} | ConvertTo-Html -Fragment

#Software Inventory
$Software = Get-WmiObject -Class Win32_Product |
Select Name , Vendor , Version , Caption | ConvertTo-Html -Fragment 

ConvertTo-Html -Body "<font color = blue><H4><B>Report Executed On</B></H4></font>$ReportDate
<font color = blue><H4><B>General Information</B></H4></font>$ComputerSystem
<font color = blue><H4><B>Boot Configuration</B></H4></font>$BootConfiguration
<font color = blue><H4><B>BIOS Information</B></H4></font>$BIOS
<font color = blue><H4><B>Operating System Information</B></H4></font>$OS
<font color = blue><H4><B>Time Zone Information</B></H4></font>$TimeZone
<font color = blue><H4><B>Disk Information</B></H4></font>$Disk
<font color = blue><H4><B>Processor Information</B></H4></font>$SystemProcessor
<font color = blue><H4><B>Memory Information</B></H4></font>$PhysicalMemory
<font color = blue><H4><B>Software Inventory</B></H4></font>$Software" -CssUri  "$filepath\style.CSS" -Title "Server Inventory" | Out-File "$FilePath\$ComputerName.html"

Write-Host "Script Execution Completed" -ForegroundColor Yellow
Invoke-Item -Path "$FilePath\$ComputerName.html"