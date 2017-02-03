###################################################################
# Chapter 11 - Code File
###################################################################

###################################################################
# Quick Reference to Create the XML file for this chapter. 
###################################################################
$xmlcontent = "<?xml version=`"1.0`"?>`r`n"
$xmlcontent += "`r`n"
$xmlcontent += "<settings>`r`n"
$xmlcontent += "`r`n"
$xmlcontent += "<db dbserver=`"myserver.domain.local`">MainDB</db>`r`n"
$xmlcontent += "`r`n"
$xmlcontent += "<user username=`"john.doe`" permissions=`"Read-Only`"></user>`r`n"
$xmlcontent += "<user username=`"jane.doe`" permissions=`"Administrator`"></user>`r`n"
$xmlcontent += "<user username=`"joe.user`" permissions=`"Read-Only`"></user>`r`n"
$xmlcontent += "`r`n"
$xmlcontent += "</settings>`r`n"
New-item –path "c:\Program Files\MyCustomSoftware2\" -ItemType Directory
New-item –path “c:\Program Files\MyCustomSoftware2\” –ItemType File –Name “Answers.XML” –value $xmlcontent 


###################################################################
# Example On How To use get-content to retrieve XML data
###################################################################
$xmlfile = "c:\Program Files\MyCustomSoftware2\Answers.xml"
$xml = [xml] (get-content $xmlfile)
$xml


###################################################################
# Example On How To use dot notation to navigate different attributes
###################################################################
$xml.xml
$xml.settings
$xml.settings.db
$xml.settings.user


###################################################################
# Example On How To use getelementsbytagname to view attributes
###################################################################
$xml.GetElementsByTagName("db")
$xml.GetElementsByTagName("db").dbserver


###################################################################
# Example On How To use getelementsbytagname to view elements
###################################################################
$xml.GetElementsByTagName("db")
$xml.GetElementsByTagName("db")."#text"


###################################################################
# Example On How To Read Multiple Tags with the same Tag Name
###################################################################
$users = $xml.GetElementsByTagName("user")
Foreach ($user in $users) {
	Write-host "Username: " $user.username
	Write-host "Permission: " $user.permissions
	Write-host ""
}


###################################################################
# Example On How To Add Attributes to An XML Tag
###################################################################
$xmlfile = "c:\Program Files\MyCustomSoftware2\Answers.xml"
[xml]$xml = get-content $xmlfile
$addxml = $xml.CreateElement("user")
$addxml.SetAttribute("username","john.smith")
$addxml.SetAttribute("permissions","Administrator")
$xml.Settings.AppendChild($addxml)
$xml.save($xmlfile)


###################################################################
# Example On How To Create a new tag and add Inner XML Data.
###################################################################
$xmlfile = "c:\Program Files\MyCustomSoftware2\Answers.xml"
[xml]$xml = get-content $xmlfile
$addxml = $xml.CreateElement("webserver")
$addxml.set_InnerXML("MyWebServer.domain.local")
$xml.Settings.AppendChild($addxml)
$xml.save($xmlfile)


###################################################################
# Example On How To Modify Attributes of a tag from an XML file
###################################################################
$xmlfile = "c:\Program Files\MyCustomSoftware2\Answers.xml"
[xml]$xml = get-content $xmlfile
$findtag = $xml.settings.user | where {$_.username –match "jane.doe"}
$findtag
$findtag.SetAttribute("permissions","Read-Only")
$findtag
$xml.save($xmlfile) 


###################################################################
# Example On How To Modify XML Elements from an XML file
###################################################################
$xmlfile = "c:\Program Files\MyCustomSoftware2\Answers.xml"
[xml]$xml = get-content $xmlfile
$findtag = $xml.settings.db | where {$_."#text" –match "MainDB"}
$findtag
$findtag.set_InnerXML("MainDatabase")
$findtag 
$xml.save($xmlfile)


###################################################################
# Example On How To Remove an XML Tag from an XML file
###################################################################
$xmlfile = "c:\Program Files\MyCustomSoftware2\Answers.xml"
[xml]$xml = get-content $xmlfile
$findtag = $xml.settings.user | where {$_.username –match "john.doe"}
$xml.settings.RemoveChild($findtag)
$xml.save($xmlfile)
