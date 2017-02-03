###################################################################
# Chapter 4 - Code File
###################################################################

###################################################################
# Example On How To Create a Function
###################################################################
Function Display-Text { Write-Host "Showing Text" }
Display-Text


###################################################################
# Example On How To Create a Function with Parameters in Parentheses
###################################################################
Function Display-Text($variable1,$variable2) {
    Write-Host "First Function Argument: $variable1"
    Write-Host "Second Function Argument: $variable2"
}
Display-Text "Hello" "Readers"


###################################################################
# Example On How To Create a Function with a Parameter Block
###################################################################
Function Display-Text { Param($variable1, $variable2)
    Write-Host "First Function Argument: $variable1"
    Write-Host "Second Function Argument: $variable2"
}
Display-Text "Hello" "Readers"


###################################################################
# Example On How To Create a Function with a [Parameter()] Decorator
###################################################################
Function Display-Text {
	#Declare the Parameter Block
    Param(
        #Set The First Parameter as Mandatory with a Help Message
        [Parameter(Mandatory=$True,HelpMessage="Error: Please Enter A Computer Name")]$computername, 
        #Set the Second Parameter as Not Mandatory
        [Parameter(Mandatory=$false)]$Message
    )
    Write-Host "First Mandatory Function Argument: $computername"
    Write-Host "Second Function Argument: $Message"
}
Display-Text –computername "MyComputerName" "MyMessage"
Display-Text


###################################################################
# Example On How To Create a Function That Returns Values
###################################################################
Function Create-WarningMessage {
	$MyError = "This is my Warning Message!"
	$MyError
}
Function Create-Message { return "My Return message." }
Function Create-Message2 { Write-Output "My Write-Output message." }
Create-WarningMessage | Write-Warning
Create-Message
Create-Message2


###################################################################
# Example On How to Use the Do / While Looping Structure
###################################################################
$x = 1
$myVar = $False
Do { 
    If ($x –ne "4") { 
	    Write-Host "This Task Has Looped $x Times"
    }
    If ($x –eq "4") {
	    $myVar = $True
	    Write-Host "Successfully executed the script $x times"
    }
    $x++
}
While ($myVar -eq $False)



###################################################################
# Example on How to Use the Do / until Looping Structure
###################################################################
$x = 1
$myVar = $False
Do { 
    If ($x –ne "4") { 
        Write-Host "This Task Has Looped $x Times"
    }
    If ($x –eq "4") {
        $myVar = $True
        Write-Host "Successfully executed the script $x times"
    }
    $x++
}
Until ($myVar -eq $True)


###################################################################
# Example on How to use the Foreach Looping Structure
###################################################################
$users = "Mitch", "Ted", "Tom", "Bill"
ForEach ($user in $users) {
    Write-host "Hello $user!"
}


###################################################################
# Example on how to Use the For Looping Structure
###################################################################
For ($x = 1; $x –lt "5"; $x++) {
    write-host "Hello World! Loop Attempt Number: $x"
}


###################################################################
# Example on How to Create a Switch
###################################################################
$x = "that"
Switch ($x) { 
	this { write-host "Value $x equals this." }
	that { write-host "Value $x equals that." } 
	Default { write-host "Value Doesn’t Match Any Other Value" }
}


###################################################################
# Example on How to Use Loops, Switches, and Functions Together
# A Menu System for Use With This Example
###################################################################
# A Menu System for Use With This Example
Function menu-system {
    Write-host "*********************************************"
    Write-Host "* Please Make A Selection Below:"
    Write-Host "*"
    Write-Host "* [1] Backup User Permissions."
    Write-host "*"
    Write-Host "* [2] Delete User Permissions."
    Write-host "*"
    Write-Host "* [3] Restore User Permisssions."
    Write-host "*"
    Write-host "*********************************************"
    Write-host ""
    Write-host "Please Make A Selection:"
    # Prompt for a User Input.
    $x = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
    # A Switch to Evaluate User Input.
    Switch ($x.character) {
        1 { write-host "Option 1: User Permissions Backed Up." }
        2 { write-host "Option 2: User Permissions Deleted." }
        3 { write-host "Option 3: User Permissions Restored." }
        Default { 
            return $True
        }
	}
}
# A Loop Structure That will Loop Until $Restart doesn’t equal true.
Do {
    $restart = Menu-system
    If ($restart –eq $True) { 
        cls
        write-host "!! Invalid Selection: Please Try Again" 
        write-host "" 
    }
}
Until ($restart –ne $True)
