Configuration CreateFolder
{
    param([Parameter(Mandatory = $true)]
    $FolderName,
    [Parameter(Mandatory = $true)]
    $ComputerName,
    $Ensure = 'Present',
    $Type = 'Directory'
    )
    Node $ComputerName
    {
        File CreateFolder
        {
            DestinationPath =  $FolderName
            Ensure = $Ensure
            Type = $Type
            
        }
    }
   
}
 
CreateFolder -FolderName 'C:\Temp\PSDSC' -ComputerName localhost
Start-DscConfiguration .\CreateFolder -Wait -Verbose -Force