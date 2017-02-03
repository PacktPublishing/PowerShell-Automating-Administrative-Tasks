$site = Get-AzureWebsite -Name MyAzureSiteDemo
$username = $site.PublishingUsername
$password = $site.PublishingPassword
$base64AuthInfo = [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes(("{0}:{1}" -f $username,$password)))
$api = "https://$($site.Name).scm.azurewebsites.net/api"
$kudu = Invoke-RestMethod -Uri "$api/environment" -Headers @{Authorization=("Basic {0}" -f $base64AuthInfo)} -Method GET $kudu