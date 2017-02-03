#Import the required DLL
Import-Module 'C:\Temp\CSOM\Microsoft.SharePoint.Client.dll'
Import-Module 'C:\Temp\CSOM\Microsoft.SharePoint.Client.Runtime.dll'
$site = 'https://site.domain.com/'
$admin = 'AdminID'
$password = Read-Host 'Enter Password' -AsSecureString
$context = New-Object Microsoft.SharePoint.Client.ClientContext($site)
$credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($admin , $password)
$context.Credentials = $credentials
$site = $context.Web
$context.Load($site)
$context.ExecuteQuery()
#Create List
$listinfo =New-Object Microsoft.SharePoint.Client.
  ListCreationInformation
$listinfo.Title = 'CSOM List'
$listinfo.TemplateType = [Microsoft.SharePoint.Client.ListTemplateType]'GenericList'
$list = $Site.Lists.Add($listinfo)
$context.ExecuteQuery()
Write-Host "Successfully Created List $($listinfo.Title)"