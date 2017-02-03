Configuration PSWA
{
    WindowsFeature IIS {
        Name = 'Web-Server'
        Ensure = 'Present'
        IncludeAllSubFeature = $true
    }
    WindowsFeature PS {
        Name = "WindowsPowerShellWebAccess"
        Ensure = "Present"
        IncludeAllSubFeature = $true 
    }
    Script PSWA {
        SetScript = {
            Install-PswaWebApplication
        }
        TestScript = {
            [bool](Get-WebApplication -Name pswa | where {$_.ApplicationPool -eq 'pswa_pool'}) -eq $true
        }
        GetScript = {
            $result = [bool](Get-WebApplication -Name pswa | where {$_.ApplicationPool -eq 'pswa_pool'})
            return @{Installed = $result}
        }
    }
}
PSWA