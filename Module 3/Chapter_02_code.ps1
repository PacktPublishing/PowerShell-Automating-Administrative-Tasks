###################################################################
# Chapter 2 - Code File
###################################################################

###################################################################
#  Example On How To Convert to Uppercase
###################################################################
$a = "Error: This is an example error"
$a.toUpper()


###################################################################
#  Example On How To Convert to Lowercase
###################################################################
$string = "The MAC Address is " 
$mac = "00:A0:AA:BB:CC:DD"
$message = $string + $mac.toLower()
$message


###################################################################
#  Example On How To Replace items in Strings
###################################################################
$usernames = "CN=juser,CN=jdoe,CN=jsmith,CN=bwhite,CN=sjones"
$usernames = $usernames.replace("CN=","")
$usernames


###################################################################
#  Example On How To Split Strings
###################################################################
$usernames = "juser,jdoe,jsmith,bwhite,sjones"
$userarray = $usernames.split(",")
$userarray


###################################################################
#  Example On How To Count Strings
###################################################################
$services = get-service
$services.count


###################################################################
#  Example On How To Count the Length of Strings
###################################################################
$path = "c:\windows\system32\drivers\1394bus.sys"
$path.length


###################################################################
#  Example On How To Trim White Space in Strings
###################################################################
$csvValue = "   servername.mydomain.com   "
$csvValue.trim()



###################################################################
#  Example On How To Trim Strings of a specific value
###################################################################
$csvValue = "servername.mydomain.com"
$csvValue = $csvValue.trim(".mydomain.com")
$csvValue



###################################################################
#  Example On How To Trim Strings at the Start and End of the string.
###################################################################
$csvValue = "FQDN: servername.mydomain.com"
$csvValue = $csvValue.trimStart("FQDN: ")
$csvValue = $csvValue.trimEnd(".mydomain.com")
$csvValue


###################################################################
#  Example On How To Trim will automatically remove items at the 
#  start and end of a string.
###################################################################
$csvValue = "computername.mydomain.com"
$csvValue.Trim("com")


###################################################################
#  Example On How To Select a Substring
###################################################################
$string = "TESTING123"
$string = $string.substring("7")
$string


###################################################################
#  Example On How To Select A Substring in the middle of a string
###################################################################
$string = "TESTING123"
$string = $string.substring("0","4")
$string


###################################################################
#  Example On How To Use the Contains Method on Strings
###################################################################
$ping = ping ThisDoesNotExistTesting.com –r 1
$ping
$deadlink = $ping.contains("Ping request could not find host")
$deadlink


###################################################################
#  Example On How To use the StartsWith Method on Strings
###################################################################
$ping = ping ThisDoesNotExistTesting.com –r 1
$ping
$deadlink = $ping.StartsWith("Ping request could not find host")
$deadlink


# True False EndsWith Example
###################################################################
#  Example On How To use the EndsWith Method on Strings
###################################################################
$ping = ping ThisDoesNotExistTesting.com –r 1
$ping
$deadlink = $ping.EndsWith("Please check the name and try again.")
$deadlink


###################################################################
#  Example On How To Generate pi
###################################################################
[math]::pi


###################################################################
#  Example On How To Generate Euler's Number
###################################################################
[math]::e


###################################################################
#  Example On How To Generate the Square root of a number
###################################################################
[math]::sqrt("996004")


###################################################################
#  Example On How To Round a number
###################################################################
$number = "214.123857123495731234948327312341657"
[math]::Round($number,"5")


###################################################################
#  Example On How To Format numbers
###################################################################
$number =12375134.132412
"{0:N4}" –f $number


###################################################################
#  Example On How To Format a number into a Hexadcimal
###################################################################
$number =12375134
$number = "{0:X0}" –f $number
$number


###################################################################
#  Example On How To Calculate TB / GB / MB / KB from Bytes
###################################################################
# 16 GB of Memory in Bytes
$ComputerMemory = 16849174528
$ComputerMemory / 1TB
$ComputerMemory / 1GB
$ComputerMemory / 1MB
$ComputerMemory / 1KB


###################################################################
#  Example On How To Generate the Date & Time
###################################################################
$time = get-date
$time


###################################################################
#  Example On How To Format the Date Time.
###################################################################
$date = get-date –format "MM/dd/yyyy HH:MM:ss tt"
$date


###################################################################
#  Example On How To Format the Date time and include strings
###################################################################
$date = get-date –format "MMddyyyyHHMMss"
$logfile = "Script" + $date + ".log"
$logfile


###################################################################
#  Example On How To Add Days to a date time value
###################################################################
$date = (get-date).AddDays(30).ToString("MM/dd/yyyy")
$date


###################################################################
#  Example On How To Format Ticks into a different Date Time Format
###################################################################
$date = [datetime]::FromFileTime("130752344000000000")
$date


###################################################################
#  Example On How To Force a String Data Type
###################################################################
[string]$myString = "Forcing a String Container"
$myString



###################################################################
#  Example On How To Try To Place a String Into an Integer Data Type
#  NOTE: This command is designed to throw an exception
###################################################################
[int]$myInt = "Trying to Place a String in an Int Container"



###################################################################
#  Example On How To use the pipeline
###################################################################
$services = get-service | where{$_.name –like "*Event*"} | Sort-object name
$services


###################################################################
#  Example On How To Use multiple Values in the Pipeline.
###################################################################
$largeFiles = get-childitem “c:\windows\system32\” | where{$_.length –gt 20MB}
$count = $largeFiles.count
Write-host "There are $count Files over 20MB"
write-host "Files Over 20MB in c:\Windows\System32\ :"
$largefiles | select-object name,length,lastwritetime | format-list
