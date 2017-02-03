#Target MailboxID's
$MailboxNames =  "TargetMailID"

#Any Exchange Admin ID with appropriate permissions
$AdminID = "AdminID"

#Fetch password as secure string
$AdminPwd = Read-Host "Enter Password" -AsSecureString

#Load the Exchange Web Service DLL
$dllpath = "C:\Temp\Microsoft.Exchange.WebServices.dll"
[Reflection.Assembly]::LoadFile($dllpath)

#Create a Exchange Web Service
$Service = New-Object Microsoft.Exchange.WebServices.Data.ExchangeService([Microsoft.Exchange.WebServices.Data.ExchangeVersion]::Exchange2013_SP1)

#Credentials to impersonate the mail box
$Service.Credentials = New-Object System.Net.NetworkCredential($AdminID , $AdminPwd)
foreach($MailboxName in $MailboxNames)
{

#Impersonate using Exchange WebService Class
$Service.ImpersonatedUserId = New-Object Microsoft.Exchange.WebServices.Data.ImpersonatedUserId([Microsoft.Exchange.WebServices.Data.ConnectingIdType]::SmtpAddress, $MailboxName)
$Service.AutodiscoverUrl($MailboxName,{$true})

#Assing EWS URL
$service.Url = 'https://outlook.office365.com/EWS/Exchange.asmx'
Write-Host "Processing Mailbox: $MailboxName" -ForegroundColor Green

#Fetch Root Folder ID
$RootFolderID = New-object Microsoft.Exchange.WebServices.Data.FolderId([Microsoft.Exchange.WebServices.Data.WellKnownFolderName]::Root, $MailboxName)
$RootFolder = [Microsoft.Exchange.WebServices.Data.Folder]::Bind($Service,$RootFolderID)

#Create a Folder View
$FolderView = New-Object Microsoft.Exchange.WebServices.Data.FolderView(1000)
$FolderView.Traversal = [Microsoft.Exchange.WebServices.Data.FolderTraversal]::Deep

#Retrive the Information
$response = $RootFolder.FindFolders($FolderView)
$response | Select DisplayName , TotalCount , FolderClass
}
