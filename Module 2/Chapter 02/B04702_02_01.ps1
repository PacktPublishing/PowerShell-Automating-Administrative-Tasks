Function Get-SystemInformation
{
    param(
    [Parameter(Mandatory = $true)]
    [String]
    $ComputerName
    )

    $OS = Get-WmiObject -Class Win32_OperatingSystem
    $BIOS = Get-WmiObject -Class Win32_Bios
    $CS = Get-WmiObject -Class Win32_ComputerSystem

    $Properties = New-Object psobject -Property @{
    
    "OSName" = $OS.Caption
    "ServicePack" = $OS.CSDVersion
    "SerialNumber" = $BIOS.SerialNumber
    "Manufacturer" = $BIOS.Manufacturer
    "BootUpState" = $CS.BootupState

    }

    $Properties
}
Get-SystemInformation -ComputerName localhost