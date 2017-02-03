$hash = @{
ServiceName = (Get-Service -Name Bits).Name
Status = (Get-Service -Name Bits).Status
CanStop = (Get-Service -Name Bits).CanStop
CanPauseandContinue = (Get-Service -Name Bits).CanPauseAndContinue
}

$value = New-Object PSOBject -Property $hash
($value | Convertto-xml -NoTypeInformation).save("C:\Temp\Data.xml")

[xml]$xml = Get-Content C:\Temp\Data.xml
$xml.Objects.Object.Property