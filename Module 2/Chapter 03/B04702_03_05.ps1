Configuration SetPullMode
{
     # param([string]$guid)
 
     Node WMF5Node03.DSCDemoLab.Com
     {
         LocalConfigurationManager
         {
             ConfigurationMode = "ApplyAndAutoCorrect"
             ConfigurationModeFrequencyMins = 15
             ConfigurationID = "479316c3-712a-4e5a-9b87-4fde1bf0433e"
             RefreshMode = 'Pull'
             DownloadManagerName = 'WebDownloadManager'
             DownloadManagerCustomData = @{
             ServerUrl = 'http://WMF5Node01.DSCDemoLab.Com:8080/PSDSCPullServer.svc';
             AllowUnsecureConnection = 'true' }
         }
     }
}
 
SetPullMode 
Set-DSCLocalConfigurationManager -Computer WMF5Node03.DSCDemoLab.Com -Path "C:\SetPullMode" -Verbose 