$wc = New-Object System.Net.WebClient
$wc.DownloadFile('http://powershell.com/Mastering-PowerShell.pdf' , 'C:\Temp\Mastering-PowerShell.pdf')