$param = @{
            URI = 'http://powershell.com/Mastering-PowerShell.pdf'
            Outfile = 'C:\Temp\Mastering-PowerShell.pdf'
          }
Invoke-RestMethod @param