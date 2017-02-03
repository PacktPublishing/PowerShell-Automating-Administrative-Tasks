<#
.Synopsis
   A script to retrieve OS information.
.DESCRIPTION
   This PowerShell script will retrieve OS information like Name , OS Architecture, Serial Number and Last Bootup time.
   This script use CIM instance.
.EXAMPLE
   Get-OSInformation -ComputerName localhost
.EXAMPLE
   Get-OSInformation -ComputerName localhost , remotecomputer
#>
function Get-OSInformation
{
    [CmdletBinding()]
    [Alias()]
    [OutputType([int])]
    Param
    (
        # Param1 help description
        [Parameter(Mandatory=$true,
                   ValueFromPipelineByPropertyName=$true,
                   Position=0)]
        [String[]]$ComputerName

    )

    Begin
    {
        #Intentionally left blank
    }
    Process
    {
        foreach($computer in $ComputerName)
        {
            $params = @{'ComputerName' = $Computer
                        'Class' = 'CIM_OperatingSystem'}
            Get-CimInstance @Params | 
            Select Caption , OSArchitecture , SerialNumber , LastBootUptime
        }
    }
    End
    {
        #Intentionally left blank
    }
}

#Get-OSInformation -ComputerName localhost , localhost