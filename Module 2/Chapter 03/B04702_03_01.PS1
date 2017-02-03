Configuration WebServer
{
    Node $env:COMPUTERNAME
    {
        File DSCConfig
        {
            DestinationPath = 'C:\DSCConfig'
            Type = 'Directory'
            Ensure = 'Present'
        }
        WindowsFeature WebServer
        {
            Name = 'Web-Server'
            LogPath = 'C:\Web-Server.log'
            Ensure = 'Present'
            IncludeAllSubFeature = $true
        }

        WindowsFeature ASPNET45
        {
            Name = 'Web-Asp-Net45'
            LogPath = 'C:\Web-Asp-Net45.log'
            Ensure = 'Present'
            IncludeAllSubFeature = $true
        }
    }
}
WebServer -OutputPath C:\DSCConfig -Verbose