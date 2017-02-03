###################################################################
# Chapter 3 - Code File
###################################################################

###################################################################
#  Example On Boolean Comparison Results
###################################################################
$TrueVariable = $True
$FalseVariable = $False
if ($TrueVariable) { Write-Host "Statement is True." }
if ($FalseVariable) { Write-Host "Statement is False." }

###################################################################
#  Example On How to Use the Equal Operator
###################################################################
$value1 = "PowerShell"
$value2 = "PowerShell"
if ($value1 –eq $value2) { write-host "It’s Equal!" }

###################################################################
#  Example On How to Use Not Equal Operators with Characters
###################################################################
$value1 = "PowerShell"
$value2 = "POSH"
if ($value1 –ne $value2) { write-host "Values Are Not Equal" }

###################################################################
#  Example On How to Use Not Equal Operators
###################################################################
$value = "This is a value."
$length = $value.length
If ($length –ne 0) { Write-host "The variable has data in it. Do this action" }

###################################################################
#  Example On How to Use the Less Than Operator Example
###################################################################
$number1 = 10
$number2 = 20
If ($number1 –lt $number2) { write-host "Value $number1 is less than $number2" }

###################################################################
#  Example On How to uUse the Greater Than Operators
###################################################################
$olddate = get-date
Start-sleep –seconds 2
$newdate= get-date
If ($newdate –gt $olddate) { write-host "Value $newdate is greater than $olddate" }

###################################################################
#  Example On How to Use the Contains / NotContains Operators
###################################################################
$myarray = "this", "is", "my", "array"
If ($myarray –contains "this") { write-host "The array contains the word: this" }
If ($myarray –notcontains "that") { write-host "The array does not contain the word: that" }

###################################################################
#  Example On How to Use the Like / NotLike Operators
###################################################################
$myexample = "This is a PowerShell example."
If ($myexample –like "*shell*") { write-host "The variable has a word that is like shell" }
If ($myexample –notlike "*that*") { write-host "The variable doesn’t have a word that is like that" }

###################################################################
#  Example On How to Use the Match / NotMatch Operators
###################################################################
$myexample = "The network went down."
If ($myexample –match "[o]") { Write-Host "The variable matched the letter o. (Contains two o’s)" }
$matches
If ($myexample –notmatch "[U]") { Write-Host "The variable does not match U. (Doesn’t have a U)" }

###################################################################
#  Example On How to Use The And / Or Operators 
###################################################################
$myvar = $True
$myothervar = $False
If ($myvar –eq $True –AND $myothervar –eq $False) { Write-host "Both statements evaluate to be True" }
If ($myvar –eq $True –OR $myothervar –eq $True) { Write-host "At least one statement evaluates to be True" }
