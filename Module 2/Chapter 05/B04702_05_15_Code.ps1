#Import the required DLL
Import-Module 'C:\Program Files\Common Files\Microsoft Shared\Web Server Extensions\15\ISAPI\Microsoft.SharePoint.Client.UserProfiles.dll'

#Mysite URL
$site = 'https://Domain-my.sharepoint.com/'

#Admin User Principal Name
$admin = 'Admin@Domain.OnMicrosoft.Com'

#Get Password as secure String
$password = Read-Host 'Enter Password' -AsSecureString

#Get the Client Context and Bind the Site Collection
$context = New-Object Microsoft.SharePoint.Client.ClientContext($site)

#Authenticate
$credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($admin , $password)
$context.Credentials = $credentials

#Fetch the users in Site Collection
$users = $context.Web.SiteUsers
$context.Load($users)
$context.ExecuteQuery()

#Create an Object [People Manager] to retrieve profile information
$people = New-Object Microsoft.SharePoint.Client.UserProfiles.PeopleManager($context)
$collection = @()
Foreach($user in $users)
{
    $userprofile = $people.GetPropertiesFor($user.LoginName)
    $context.Load($userprofile)
    $context.ExecuteQuery()
    if($userprofile.Email -ne $null)
    {
        $upp = $userprofile.UserProfileProperties
        foreach($ups in $upp)
        {
            $profileData = "" | Select "FirstName" , "LastName" , "WorkEmail" , "Title" , "Responsibility"
            $profileData.FirstName = $ups.FirstName
            $profileData.LastName = $ups.LastName
            $profileData.WorkEmail = $ups.WorkEmail
            $profileData.Responsibility = $ups.'SPS-Responsibility'
            $collection += $profileData
        }
    }
}
$collection | Export-Csv C:\Temp\SPO-UserInformation.csv -NoTypeInformation -Encoding UTF8
