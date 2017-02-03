###################################################################
# Chapter 13 - Code File
###################################################################

###################################################################
# Example On How To Launch PowerShell with the Remote Signed Execution Policy
###################################################################
$filepath = "powershell.exe"
$arguments = "-ExecutionPolicy RemoteSigned"
start-process –filepath $filepath –Verb RunAs -ArgumentList $arguments


###################################################################
# Example On How To use invoke-item to start a program
###################################################################
invoke-item "c:\windows\system32\calc.exe"


###################################################################
# Example On How To use invoke expression to ping the local system.
###################################################################
$string = “ping 127.0.0.1”
invoke-expression $string


###################################################################
# Contents of c:\temp\scripts\MasterScript.ps1
###################################################################
function wh { param([string]$message)
    write-host “Wh Function Output is: $message"
}
write-host "MasterScript.ps1: Launching Child Script..."
invoke-expression -command c:\temp\scripts\childscript.ps1


###################################################################
# Contents of c:\temp\scripts\ChildScript.ps1
###################################################################
wh "From ChildScript.ps1: The wh Function resides in MasterScript.ps1 file."
wh "From ChildScript.ps1: Childscript.ps1 is accessing the wh Function successfully from memory."
pause


###################################################################
# Example On How To Invoke the master script 
###################################################################
invoke-expression -command c:\temp\scripts\masterscript.ps1 


###################################################################
# Example On How To Create a configuration item
###################################################################
configuration InstallTelnet {
    param($computers)
    Node $computers {
        WindowsFeature Telnet-Client
        {
            Name = "TelnetClient"
            Ensure = "Present"
            IncludeAllSubFeature = "True"        
        }
    }

}


###################################################################
# Example On How To Create a configuration item for Telnet Client 
# and Server using Desired Configuration Management
###################################################################
configuration InstallTelnet {
    param($computers)
    Node $computers {
        WindowsFeature Telnet-Client
        {
            Name = "TelnetClient"
            Ensure = "Present"
            IncludeAllSubFeature = "True"        
        }
        WindowsFeature Telnet-Server
        {
            Name = "TelnetServer"
            Ensure = "Present"
            IncludeAllSubFeature = "True"  
            DependsOn = "[WindowsFeature]Telnet-Client" 
        }
    }

}
$computer = $env:computername
InstallTelnet -computers $computer


###################################################################
# Example On How To Push a DSM Configuration to a system.
###################################################################
start-DscConfiguration -path .\InstallTelnet -wait -force


###################################################################
# Example On How To View the Desired State Configuration On A System
###################################################################
get-dscconfiguration


###################################################################
# Example On How To Restore a Desired State Configuration On A System
###################################################################
Remove-WindowsFeature -name Telnet-Server
write-host "Telnet-Server Feature Has Been Manually Removed From The System"
$testresult = test-dscconfiguration
if ($testresult -like "False") { 
    Restore-dscconfiguration 
}
$testresult = test-dscconfiguration
if ($testresult -like "True") { 
    write-host "Telnet-Server Successfully Restored on The System" 
}
