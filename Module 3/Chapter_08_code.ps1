###################################################################
# Chapter 8 - Code File
###################################################################


###################################################################
# Example On How To Create a Folder and Registry Item
###################################################################
New-item –path "c:\Program Files\" -name MyCustomSoftware –ItemType Directory
New-item –path HKCU:\Software\MyCustomSoftware\ -force


###################################################################
# Example On How To Create Files Leveraging Triggers
###################################################################
$logpath = "c:\Program Files\MyCustomSoftware\Logs\"
New-item –path $logpath –ItemType Directory | out-null
$itemname = (get-date –format "yyyyMMddmmss") + "MyLogFile.txt"
$itemvalue = "Starting Logging at: " + " " + (get-date)
New-item –path $logpath -name $itemname –ItemType File –value $itemvalue
$logfile = $logpath + $itemname
$logfile


###################################################################
# Example On How To Create Registry Properties
###################################################################
$regpath = "HKCU:\Software\MyCustomSoftware\"
$regname = "BuildTime"
$regvalue = "Build Started At: " + " " + (get-date)
New-itemproperty –path $regpath –name $regname –PropertyType String –value $regvalue
$verifyValue = Get-itemproperty –path $regpath –name $regname
Write-Host "The $regName named value is set to: " $verifyValue.$regname


###################################################################
# Example On How To Verify Files, Folders, and Registry Items
###################################################################
$testfolder = test-path "c:\Program Files\MyCustomSoftware\Logs"
#Update The Following Line with the Date/Timestamp of your file
$testfile = test-path "c:\Program Files\MyCustomSoftware\Logs\201503163824MyLogFile.txt"
$testreg = test-path "HKCU:\Software\MyCustomSoftware\"
If ($testfolder) { write-host "Folder Found!" }
If ($testfile) { write-host "File Found!" }
If ($testreg) { write-host "Registry Key Found!" }


###################################################################
# Example On How To Copy and Move Files
###################################################################
New-item –path "c:\Program Files\MyCustomSoftware\AppTesting" –ItemType Directory | Out-null
New-item –path "c:\Program Files\MyCustomSoftware\AppTesting\Help" -ItemType Directory | Out-null
New-item –path "c:\Program Files\MyCustomSoftware\AppTesting\" –name AppTest.txt –ItemType File | out-null
New-item –path "c:\Program Files\MyCustomSoftware\AppTesting\Help\" –name HelpInformation.txt –ItemType File | out-null
New-item –path "c:\Program Files\MyCustomSoftware\" -name ConfigFile.txt –ItemType File | out-null
move-item –path "c:\Program Files\MyCustomSoftware\AppTesting" –destination "c:\Program Files\MyCustomSoftware\Archive" –force
copy-item –path "c:\Program Files\MyCustomSoftware\ConfigFile.txt" "c:\Program Files\MyCustomSoftware\Archive\Archived_ConfigFile.txt" –force


###################################################################
# Example On How To Rename Files and Folders
###################################################################
New-item –path "c:\Program Files\MyCustomSoftware\OldConfigFiles\" –ItemType Directory | out-null
Rename-item –path "c:\Program Files\MyCustomSoftware\OldConfigFiles" –newname "c:\Program Files\MyCustomSoftware\ConfigArchive" -force
copy-item –path "c:\Program Files\MyCustomSoftware\ConfigFile.txt" "c:\Program Files\MyCustomSoftware\ConfigArchive\ConfigFile.txt" –force
Rename-item –path "c:\Program Files\MyCustomSoftware\ConfigArchive\ConfigFile.txt" –newname "c:\Program Files\MyCustomSoftware\ConfigArchive\Old_ConfigFile.txt" –force


###################################################################
# Example On How To Rename Registry Keys
###################################################################
New-item –path "HKCU:\Software\MyCustomSoftware\" –name CInfo –force | out-null
Rename-item –path "HKCU:\Software\MyCustomSoftware\CInfo" –newname ConnectionInformation –force


###################################################################
# Example On How To Rename Registry Properties
###################################################################
$regpath = "HKCU:\Software\MyCustomSoftware\ConnectionInformation"
$regname = "DBServer"
$regvalue = "mySQLserver.mydomain.local"
New-itemproperty –path $regpath –name $regname –PropertyType String –value $regvalue | Out-null
Rename-itemproperty –path $regpath –name DBServer –newname DatabaseServer


###################################################################
# Example On How To Delete Files - Part 1 - Staging New Files
###################################################################
# Create New Directory
new-item –path "c:\program files\MyCustomSoftware\Graphics\" –ItemType Directory | Out-null
# Create Files for This Example
new-item –path "c:\program files\MyCustomSoftware\Graphics\" –name FirstGraphic.bmp –ItemType File | Out-Null
new-item –path "c:\program files\MyCustomSoftware\Graphics\" –name FirstGraphic.png –ItemType File | Out-Null
new-item –path "c:\program files\MyCustomSoftware\Graphics\" –name SecondGraphic.bmp –ItemType File | Out-Null
new-item –path "c:\program files\MyCustomSoftware\Graphics\" –name SecondGraphic.png –ItemType File | Out-Null
new-item –path "c:\program files\MyCustomSoftware\Logs\" –name 201301010101LogFile.txt –ItemType File | Out-Null
new-item –path "c:\program files\MyCustomSoftware\Logs\" –name 201302010101LogFile.txt –ItemType File | Out-Null
new-item –path "c:\program files\MyCustomSoftware\Logs\" –name 201303010101LogFile.txt –ItemType File | Out-Null
# Create New Registry Keys and Named Values
New-item –path "HKCU:\Software\MyCustomSoftware\AppSettings" | Out-null
New-item –path "HKCU:\Software\MyCustomSoftware\ApplicationSettings" | Out-null
New-itemproperty –path "HKCU:\Software\MyCustomSoftware\ApplicationSettings" –name AlwaysOn –PropertyType String –value True | Out-null
New-itemproperty –path "HKCU:\Software\MyCustomSoftware\ApplicationSettings" –name AutoDeleteLogs –PropertyType String –value True | Out-null



###################################################################
# Example On How To Delete Files - Part 2 - Deleting Files
###################################################################
# Get Current year
$currentyear = get-date –f yyyy
# Build the Exclude String
$exclude = "*" + $currentyear + "*"
# Remove Items from System
Remove-item –path "c:\Program Files\MyCustomSoftware\Graphics\" –include *.bmp –force -recurse
Remove-item –path "c:\Program Files\MyCustomSoftware\Logs\" –exclude $exclude -force –recurse
Remove-itemproperty –path "HKCU:\Software\MyCustomSoftware\ApplicationSettings" –Name AutoDeleteLogs
Remove-item –path "HKCU:\Software\MyCustomSoftware\ApplicationSettings"
