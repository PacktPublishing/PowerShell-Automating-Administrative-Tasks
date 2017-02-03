<#
.Synopsis
   To add two integer values
.DESCRIPTION
   Windows PowerShell Script Demo to add two values
   This accepts pipeline values
.EXAMPLE
   Add-Values -Param1 20 -Param2 30
.EXAMPLE
   12,23 | Add-Values
#> 

function Add-Values
{
    [CmdletBinding()]
    [Alias()]
    [OutputType([int])]
    Param
    (
        # Param1 help description
        [Parameter(Mandatory=$true,
                   ValueFromPipeline = $true,
                   ValueFromPipelineByPropertyName=$true,
                   Position=0)]
        #Accepts Only Integer
        [int]$Param1,

        #Accepts only interger
        [Parameter(Mandatory=$true,
                   ValueFromPipeline = $true,
                   ValueFromPipelineByPropertyName=$true,
                   Position=0)]
        [int]$Param2
    )

    Begin
    {
        "Script Begins"
    }
    Process
    {
        $result = $Param1 + $Param2
    }
    End
    {
        $result
    }
}
