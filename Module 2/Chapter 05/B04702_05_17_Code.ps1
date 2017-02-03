Import-Module 'C:\Program Files\Common Files\Microsoft Shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.Runtime.dll'
#OR
Add-Type -Path 'C:\Program Files\Common Files\Microsoft Shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.dll'
#Site URL
$site = 'https://Domain.sharepoint.com/'
#Admin User Principal Name
$admin = 'Admin@Chensoffice365.OnMicrosoft.Com'
#Get Password as secure String
$password = Read-Host 'Enter Password' -AsSecureString
#Get the Client Context and Bind the Site Collection
$context = New-Object Microsoft.SharePoint.Client.ClientContext($site)
#Authenticate
$credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($admin , $password)
$context.Credentials = $credentials
#Delete List
$list = $context.Web.Lists.GetByTitle('PowerShell CSOM')
$context.Load($list)
$list.DeleteObject()
$list.Update()
