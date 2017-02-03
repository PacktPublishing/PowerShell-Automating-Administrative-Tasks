Import-Module MSOnline
$O365Cred = Get-Credential
$O365Session = New-PSSession –ConfigurationName Microsoft.Exchange `                             -ConnectionUri https://outlook.office365.com/powershell-liveid/?proxymethod=rps `
                             -Credential $O365Cred `
                             -Authentication Basic `
                             -AllowRedirection
Import-PSSession $O365Session
Connect-MsolService –Credential $O365Cred