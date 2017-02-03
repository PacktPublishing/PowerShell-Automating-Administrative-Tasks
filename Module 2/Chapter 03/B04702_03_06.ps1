Configuration InstallBackup {
     param (
     [string[]]$ComputerName = "localhost"
     )
     
     
     Node $ComputerName {
         
         WindowsFeature Backup {
             Ensure = "Present"
             Name   = "Windows-Server-Backup"
         }
     }
}
InstallBackup -ComputerName WMF5Node03.DSCDemolab.com