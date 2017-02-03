Function Get-SystemInformation
{
    [CmdletBinding()]
    PARAM (
        [Parameter(ValueFromPipeline = $true)]
        [Alias("Host")]
        [ValidateCount(0,15)]
        $ComputerName
    )

    BEGIN
    {
    
    }
    PROCESS
    {
        Write-Verbose -Message "Working On $ComputerName"  
        $ComputerSystem = Get-WmiObject -Class Win32_ComputerSystem -ComputerName $ComputerName
        $OperatingSystem = Get-WmiObject -class win32_OperatingSystem -ComputerName $ComputerName
        $Bios = Get-WmiObject -class win32_BIOS -ComputerName $ComputerName
        Write-Verbose -Message "Result $ComputerName..."
        $Properties = [Ordered]@{
            ComputerName = $ComputerName
            Manufacturer = $ComputerSystem.Manufacturer
            Model = $ComputerSystem.Model
            OperatingSystem = $OperatingSystem.Caption
            OperatingSystemVersion = $OperatingSystem.Version
            SerialNumber = $Bios.SerialNumber
        }          
        New-Object -TypeName PSobject -Property $Properties
    }
    
    END
    {
    
    } 
}

#Using Alias
Get-SystemInformation -host localhost -Verbose

#Using Param Name with Verbose
Get-SystemInformation -ComputerName localhost -Verbose
