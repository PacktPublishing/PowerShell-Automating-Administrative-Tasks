###################################################################
# Chapter 9 - Code File
###################################################################


###################################################################
# Example On How To use get-wmiobject to view a class
###################################################################
get-wmiobject –namespace root\cimv2 –class win32_computersystem


###################################################################
# Example On How To use get-ciminstance to view a class
###################################################################
get-ciminstance –namespace root\cimv2 –class win32_computersystem


###################################################################
# Example On How To View all of the attributes of a class
###################################################################
get-wmiobject –class win32_computersystem | get-member


###################################################################
# Example On How To Search in a list of classes for a specific value
###################################################################
get-wmiobject –list | where{$_.Name –like "*Time*"}


###################################################################
# Example On How To Search using get-cimclass for a specific value
###################################################################
get-cimclass | where{$_.CimClassName –like "*Time*"}


###################################################################
# Example On How To View and count the class properties of a class
###################################################################
$classProperties = (get-cimclass –class win32_Printer).CimClassProperties
$classProperties.count


###################################################################
# Example On How To use get-cimclass to view the cimclassmethods of a class
###################################################################
(get-cimclass –class win32_Printer).CimClassMethods


###################################################################
# Example On How To View qualifiers for cimclassmethods.
###################################################################
$method = (get-cimclass –class win32_Printer).CimClassMethods | where {$_.name -eq "SetDefaultPrinter"}
$method
$method.qualifiers


###################################################################
# Example On How To view to determine the writeable properties of a class
###################################################################
Get-cimclass win32_Environment | select –ExpandProperty CimClassProperties | where {$_.Qualifiers –match "write"}


###################################################################
# Example On How To view to determine the non-writeable properties of a class
###################################################################
Get-cimclass win32_Environment | select –ExpandProperty CimClassProperties | where {$_.Qualifiers –notmatch "write"} | select –ExpandProperty Name


###################################################################
# Example On How To view use the get-ciminstance
###################################################################
Get-ciminstance Win32_Environment


###################################################################
# Example On How To create a new property in a WMI class.
###################################################################
# Update the Domain\Username with valid credentials
New-CimInstance Win32_Environment -Property @{Name="PurchasedDate";VariableValue="10/17/2015"; UserName="DOMAIN\USERNAME"}
Get-Ciminstance Win32_Environment | Where {$_.name –match "PurchasedDate"}


###################################################################
# Example On How To modify a property in a WMI Class
###################################################################
$instance = Get-Ciminstance Win32_Environment | Where {$_.name –match "PurchasedDate"}
Set-ciminstance –ciminstance $instance –property @{Name="PurchasedDate";VariableValue="October 17, 2015";}
Get-Ciminstance win32_Environment | Where {$_.name –match "PurchasedDate"}


###################################################################
# Example On How To remove a property in a WMI class
###################################################################
$instance = Get-Ciminstance win32_environment | Where {$_.name –match "PurchasedDate"}
Remove-ciminstance –ciminstance $instance
Get-Ciminstance win32_environment | Where {$_.name –match "PurchasedDate"}


###################################################################
# Example On How To view the Properties of CimClassMethods
###################################################################
get-cimclass win32_process | select –ExpandProperty CimClassMethods


###################################################################
# Example On How To invoke a method using arugments.
###################################################################
Invoke-CimMethod Win32_Process -MethodName "Create" -Arguments @{ CommandLine = 'mspaint.exe'}


###################################################################
# Example On How To invoke a method using a query.
###################################################################
Invoke-CimMethod –Query 'select * from Win32_Process where name like "mspaint.exe"' –MethodName "Terminate"
