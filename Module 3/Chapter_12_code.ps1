###################################################################
# Chapter 12 - Code File
###################################################################

###################################################################
# Example On How To Create Local Users with a function
###################################################################
$computername = [system.net.dns]::GetHostName()
Function create-user { param($Computer, $username, $password)
$ADSI = [ADSI]"WinNT://$Computer"
$user = $ADSI.Create("User", $username)
$user.setpassword("$Password")
$user.setinfo()
}
create-user $computername "svcLocalAccount" "P@ssw0rd"
create-user $computername "remLocalAccount" "P@ssw0rd"


###################################################################
# Example On How To Delete Local Users with a function
###################################################################
$computername = [system.net.dns]::GetHostName()
Function delete-user { param($Computer, $username)
$ADSI = [ADSI]"WinNT://$Computer"
$ADSI.Delete("user", "$username")
}
delete-user $computername "remLocalAccount"


###################################################################
# Example On How To Create Local Groups with a Function
###################################################################
Function create-group{ param($computer, $groupname, $description)
$ADSI = [ADSI]"WinNT://$Computer"
$Group = $ADSI.Create("Group", $groupname)
$Group.setinfo()
$Group.Description = "$description"
$Group.setinfo()
}
# Create the MyLocalGroup
create-group $computername "MyLocalGroup" "This is a test local group"
# Create the remLocalGroup
create-group $computername "remLocalGroup" "This is a test local group"


###################################################################
# Example On How To Delete Local Groups with a Function
###################################################################
$computername = [system.net.dns]::GetHostName()
Function delete-group { param($computer, $groupname)
$ADSI = [ADSI]"WinNT://$Computer"
$ADSI.Delete("Group", $groupname)
}
# Delete the local group remLocalGroup
delete-group $computername "remLocalGroup"


###################################################################
# Example On How To Add  Members From A Group
###################################################################
$computername = [system.net.dns]::GetHostName()
Function add-groupmember { param($computer, $user, $groupname)
$userADSI = ([ADSI]"WinNT://$computer/$user").path
$group = [ADSI]"WinNT://$computer/$groupname, group"
	$group.Add($userADSI)
}
add-groupmember $computername "svcLocalAccount" "MyLocalGroup"
add-groupmember $computername "svcLocalAccount" "Administrators"


###################################################################
# Example On How To Remove Members From A Group
###################################################################
$computername = [system.net.dns]::GetHostName()
Function delete-groupmember { param($computer, $user, $groupname)
$userADSI= ([ADSI]"WinNT://$computer/$user").path
$group = [ADSI]"WinNT://$computer/$groupname, group"
	$group.Remove($userADSI)
}
delete-groupmember $computername "svcLocalAccount" "Administrators"


###################################################################
# Example On How To Determine if A User or Group Exists
###################################################################
$computername = [system.net.dns]::GetHostName()
Function get-ADSISearch { param($computer, $objecttype, $object)
$test = [ADSI]::Exists("WinNT://$computer/$object, $objecttype")
If ($test) { Write-host "Local $objecttype Exists. Test Variable Returned: $test" }
If (!$test) { Write-host "Local $objecttype Does Not Exist. Test Variable Returned: $test" }
}
get-ADSISearch $computername "User" "svcLocalAccount"
get-ADSISearch $computername "Group" "MyLocalGroup"
get-ADSISearch $computername "Group" "NotARealGroup"

###################################################################
# Example On How To Enumerate the local group members 
###################################################################
$computername = [system.net.dns]::GetHostName()
Function get-groupmember { param($computer,$groupname)
    $group = [ADSI]"WinNT://$computer/$groupname"
    @($group.Invoke("Members")) | foreach { $_.GetType().InvokeMember("Name",'GetProperty',$null, $_, $null) }
}
$members = get-groupmember $computername "MyLocalGroup"
Write-host "The members for MyLocalGroup are: $members"
$members = get-groupmember $computername "Administrators"
Write-host "The members for Administrators are: $members"


###################################################################
# Example On How To Get Service Information
###################################################################
Get-service –DisplayName "Windows Audio"
Get-service –DisplayName "Windows Audio" –RequiredServices
(Get-service –DisplayName "Windows Audio").Status 


###################################################################
# Example On How To Stop and Start Services
###################################################################
stop-service –DisplayName "Windows Audio"
(Get-service –DisplayName "Windows Audio").Status
start-service –DisplayName "Windows Audio"
(Get-service –DisplayName "Windows Audio").Status


###################################################################
# Example On How To Change the Starup Type of a Windows service
###################################################################
(get-wmiobject win32_service –filter "DisplayName='Windows Audio'").StartMode
stop-service –name "Audiosrv"
set-service –name "Audiosrv" –startup "Manual"
(get-wmiobject win32_service –filter "DisplayName='Windows Audio'").StartMode
set-service –name "Audiosrv" –startup "Automatic"
(get-wmiobject win32_service –filter "DisplayName='Windows Audio'" ).StartMode
Start-service –name "Audiosrv"


###################################################################
# Example On How To Change the Description of a Windows Service
###################################################################
$olddesc = (get-wmiobject win32_service –filter "DisplayName='Windows Audio'").description
stop-service –DisplayName "Windows Audio"
Set-service –name "Audiosrv" –Description "My New Windows Audio Description."
(get-wmiobject win32_service –filter "DisplayName='Windows Audio'").description
Set-service –name "Audiosrv" –Description $olddesc
(get-wmiobject win32_service –filter "DisplayName='Windows Audio'").description
start-service –DisplayName "Windows Audio"


###################################################################
# Example On How To Search for A Process
###################################################################
$process = get-process powersh*
$process
get-process -id $process.id


###################################################################
# Example On How To View the File Versions of A Process
###################################################################
$process = get-process powersh*
get-process -id $process.id –FileVersionInfo


###################################################################
# Example On How To View the Modules of a Process
###################################################################
$process = get-process powersh*
$modules = get-process -id $process.id –module
$modules.count


###################################################################
# Example On How To Start a Notepad Process
###################################################################
start-process -FilePath notepad.exe
$process = get-process notepad*


###################################################################
# Example On How To Start and stop a Notepad Process
###################################################################
start-process -FilePath notepad.exe
$process = get-process notepad*
stop-process -ID $process.id


###################################################################
# Example On How To Query the Windows Features
###################################################################
$featureinfo = get-WindowsFeature | Where {$_.DisplayName -match "Telnet"}
foreach ($feature in $featureinfo) {
    Write-host "Feature Display Name:" $feature.DisplayName
    Write-host "Feature Name:" $feature.Name
    Write-host "Feature Install State:" $feature.InstallState
    Write-host ""
}


###################################################################
# Example On How To Install Windows Features
###################################################################
Install-windowsFeature -name Telnet-Client -IncludeAllSubFeature -IncludeManagementTools
install-windowsFeature -name Telnet-Server -IncludeAllSubFeature –IncludeManagementTools


###################################################################
# Example On How To Uninstall Windows Features
###################################################################
Uninstall-WindowsFeature -Name "Telnet-Server"
uninstall-WindowsFeature -Name "Telnet-Client"


