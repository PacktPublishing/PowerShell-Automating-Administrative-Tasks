###################################################################
# Chapter 6 - Code File
###################################################################

###################################################################
# Example Of How To Use CMDlet Parameters for Exception Handling
###################################################################
Function serviceExample($svcName) { 
Get-service $svcName –ErrorAction SilentlyContinue –ErrorVariable err

    If ($err) {
	    Write-host "Error! Error Details: $err"
        return
    }
	
    Write-host "Successfully Retrieved Service Information for $svcName. "
}
ServiceExample "Windows Update"
Write-host "" 
ServiceExample "Does Not Exist"


###################################################################
# Example Of How to leverage the Try/Catch Method For Exception Handling
###################################################################
Try {
    1+ "abcd"
}
Catch {
	Write-host "Error Processing the Command: $_"
}
Write-host "" 
Write-host "Attempting to Add a String without Exception Handling:"
1+ "abcd"

###################################################################
# Example Of How to leverage the Try/Catch Method and CMDlet Paramerters For Exception Handling
###################################################################
Try {
    Get-process "Doesn’t Exist" –ErrorAction SilentlyContinue –ErrorVariable err
}
Catch {
	Write-host "Try/Catch Exception Details: $_"
}
if ($err) {
	Write-host "Cmdlet Error Handling Error Details: $err"
}


###################################################################
# Example Of Legacy Exception Handling
###################################################################
$err = netsh advfirewall firewall add rule name="Test Allow 12345" protocol=TCP dir=out localport=12345 action=Allow
If ($err –notlike "Ok.") {
	Write-host "Error Processing netsh command: $err"
}
Write-host "Data Contained in the Variable Err is $err"


###################################################################
# Example Of Legacy Exception Handling
###################################################################
$err = netsh advfirewall firewall add rule name="Test Allow 12345" protocol=TCP dir=out localport=1234567 action=Allow
If ($err –notlike "Ok.") {
	Write-host "Error Processing netsh command: $err"
}


###################################################################
# Example Of Legacy Exception Handling and parsing the error message
###################################################################
$err = netsh advfirewall firewall add rule name="Test Allow 12345" protocol=TCP dir=out localport=1234567 action=Allow
If ($err –notlike "Ok.") {
	Write-host "Array Line 0: " $err[0]
	Write-host "Array Line 1: " $err[1]
	Write-host "Array Line 2: " $err[2]
	Write-host "Array Line 3: " $err[3]
	Write-host ""
	Write-host "Error Processing netsh command:" $err[1]
}


###################################################################
# Example Of Using the -WhatIf Trigger
###################################################################
Get-service "Windows Update"
Stop-service "Windows Update" –WhatIf
Get-service "Windows Update"


###################################################################
# Example Of Creating A User Array - Validating Arrays
###################################################################
$array = "user.name", "joe.user", "jane.doe"
$array


###################################################################
# Example Of Counting an Array- Validating Variables
###################################################################
$services = get-service
$service.count
$services.count

