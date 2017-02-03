###################################################################
# Chapter 9 - Code File
###################################################################


###################################################################
# Setup the Computer System for the Examples in this Chapter
###################################################################
# If the files, folders, and registry items don’t exist, create them.
if (!(test-path "HKCU:\Software\MyCustomSoftware\ConnectionInformation")) { New-item –path "HKCU:\Software\MyCustomSoftware\ConnectionInformation" -force | out-null  }
if (!(test-path "HKCU:\Software\MyCustomSoftware\AppSettings")) { New-item –path "HKCU:\Software\MyCustomSoftware\AppSettings" -force | out-null   }
if (!(test-path "c:\Program Files\MyCustomSoftware\Graphics\")){ New-item –path "c:\Program Files\MyCustomSoftware\" -name Graphics –ItemType Directory | out-null  }
if (!(test-path "c:\Program Files\MyCustomSoftware\Logs\")){ New-item –path "c:\Program Files\MyCustomSoftware\" -name Logs –ItemType Directory | out-null  }
if (!(test-path "c:\Program Files\MyCustomSoftware\Graphics\FirstGraphic.png")) { New-item –path "c:\Program Files\MyCustomSoftware\Graphics\" -name "FirstGraphic.png" –ItemType File | out-null  }
if (!(test-path "c:\Program Files\MyCustomSoftware\Graphics\SecondGraphic.png")) { New-item –path "c:\Program Files\MyCustomSoftware\Graphics\" -name "SecondGraphic.png" –ItemType File | out-null }


###################################################################
# Example On How To View Attributes of Folders and Attributes
###################################################################
$regItem = get-item –path "HKCU:\Software\MyCustomSoftware\"
$regItem
$regChildItem = get-childitem –path "HKCU:\Software\MyCustomSoftware\"
$regChildItem
$dirItem = get-item –path "c:\Program Files\MyCustomSoftware\Graphics\"
$dirItem
$dirChildItem = get-childitem –path "c:\Program Files\MyCustomSoftware\Graphics\"
$dirChildItem


###################################################################
# Example On How To View Extended Attributes
###################################################################
get-item –path "c:\Program Files\MyCustomSoftware\Graphics\FirstGraphic.png" | get-member


###################################################################
# Example On How To Set Mode and Extended File and Folder Attributes
###################################################################
# Get file attributes
$file = get-item –path "c:\Program Files\MyCustomSoftware\Graphics\FirstGraphic.png"
$attributes = $file.attributes
$attributes
# Append ReadOnly attribute to existing attributes
$newattributes = "$attributes, ReadOnly"
# Write over existing attributes with new attributes
$file.attributes = $newattributes
$file.attributes


###################################################################
# Example On How To Remove Mode and Extended File and Folder Attributes
###################################################################
# Get File Attributes
$file = get-item –path "c:\Program Files\MyCustomSoftware\Graphics\FirstGraphic.png"
$attributes = $file.attributes
# Convert attributes to string
$attributes = $attributes.tostring()
# Split individual attributes into array
$attributes = $attributes.split(",")
# Read through the individual attributes
Foreach ($attribute in $attributes) {
	# If read Only, skip
	if ($attribute –like "*ReadOnly*") { 
write-host "Skipping Attribute: $attribute" 
}
# Else add attribute to attribute list
	else { 
$newattribute += "$attribute," 
Write-Host "Attribute Added: $attribute"
}
}
# Remove the trailing comma
$newattribute = $newattribute.trimend(",")
# Write over existing attributes with new attributes
$file.attributes = $newattribute
Write-host "New File attributes are: " $file.attributes


###################################################################
# Example On How To Copy Access Control Lists
###################################################################
# Get the existing ACL on the FirstGraphic.png file
$fileACL = get-acl –path "c:\Program Files\MyCustomSoftware\Graphics\FirstGraphic.png"
# Set the ACL from FirstGraphic.png on SecondGraphic.png 
Set-acl –path "c:\Program Files\MyCustomSoftware\Graphics\SecondGraphic.png" –aclobject $fileACL
# Get the existing ACL on the Logs directory
$dirACL = get-acl –path "c:\Program Files\MyCustomSoftware\Logs"
# Set the ACL from the Logs directory on the Graphics directory
Set-acl –path "c:\Program Files\MyCustomSoftware\Graphics" –aclobject $dirACL
# Get the existing ACL from the ConnectionInformation key
$regACL = get-acl –path "HKCU:\Software\MyCustomSoftware\ConnectionInformation"
# Set the ACL from ConnectionInformation on the AppSettings key
Set-acl –path "HKCU:\Software\MyCustomSoftware\AppSettings" –aclobject $regACL



###################################################################
# Example On How To Set Permissions on a Folder / Access Control List Modification
###################################################################
# Get the ACL from the Graphics directory
$ACL = Get-Acl "c:\program files\MyCustomSoftware\Graphics"
# Search the updated ACL for the Everyone group
$ACL.access | where { $_.IdentityReference –contains "Everyone" }
# Populate group variable for permissions
$group = "Everyone"
# Populate the permissions variable for setting permissions
$permission = "FullControl, Synchronize"
# Designate the inheritance information for permissions
$inherit = [system.security.accesscontrol.InheritanceFlags]"ContainerInherit, ObjectInherit"
# Designate the propagation information for permission propagation
$propagation = [system.security.accesscontrol.PropagationFlags]"None"
# Set to Allow Permissions
$accesstype = "Allow"
# Create the New Access Control list Rule
$Rule = New-Object system.security.accesscontrol.filesystemaccessrule($group,$permission,$inherit,$propagation,$accesstype)
# Merge new permissions with the existing ACL object
$ACL.SetAccessRule($RULE)
# Set the ACL on folder
Set-Acl -path "c:\program files\MyCustomSoftware\Graphics" -aclobject $Acl
# Get Updated ACL on folder
$ACL = Get-Acl "c:\program files\MyCustomSoftware\Graphics"
# Search the updated ACL for the Everyone group
$ACL.access | where { $_.IdentityReference –contains "Everyone" }


###################################################################
# Example On How To Set Permissions on a Registry Key / Access Control List Modification
###################################################################
# Get the ACL from the ConnectionInformation registry key
$ACL = Get-Acl "HKCU:\Software\MyCustomSoftware\ConnectionInformation"
# Search the updated ACL for the Everyone group
$ACL.access | where { $_.IdentityReference –contains "Everyone" }
# Populate group variable for permissions
$group = "Everyone"
# Populate the permissions variable for setting permissions
$permission = "FullControl"
# Set to Allow Permissions
$accesstype = "Allow"
# Create the New Access Control list Rule
$Rule = New-Object system.security.accesscontrol.RegistryAccessrule($group,$permission,$accesstype)
# Merge new permissions with the existing ACL object
$ACL.SetAccessRule($RULE)
# Set the ACL on registry key
Set-Acl -path "HKCU:\Software\MyCustomSoftware\ConnectionInformation" -aclobject $Acl
# Get Updated ACL on registry key
$ACL = Get-Acl "HKCU:\Software\MyCustomSoftware\ConnectionInformation"
# Search the updated ACL for the Everyone group
$ACL.access | where { $_.IdentityReference –contains "Everyone" }
