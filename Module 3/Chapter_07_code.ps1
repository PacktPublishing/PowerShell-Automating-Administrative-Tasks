###################################################################
# Chapter 7 - Code File
###################################################################

###################################################################
# Example On How To Enable Kerberos for the use with WinRM
###################################################################
winrm set winrm/config/service/auth @{Kerberos="true"}


###################################################################
# Example On How To Accept WinRM Traffic over HTTP
###################################################################
winrm create winrm/config/Listener?Address=*+Transport=HTTP 


###################################################################
# Example On How To Accept WinRM Traffic over HTTPS
###################################################################
winrm create winrm/config/Listener?Address=*+Transport=HTTPS @{Hostname="Host Computer";CertificateThumbprint=" 40-digit hex string thumbprint"}


###################################################################
# Example On How To Quick Configure WS-MAN
###################################################################
Set-WsManQuickConfig


###################################################################
# Example On How To Enable and Disable PS Remoting on a system
###################################################################
Enable-PSRemoting –SkipNetworkProfileCheck –Force
Disable-PSRemoting –force


###################################################################
# Example On How To Create a CIM Session
###################################################################
new-cimsession


###################################################################
# Example On How To Create a Multiple Sessions Grouped by a single name.
###################################################################
new-cimsession –computername Localhost,localhost,localhost –name LocalSessions


###################################################################
# Example On How To Create New CimSessionOptions and use them with a session
###################################################################
$sessionoptions = new-cimsessionoption –protocol DCOM
New-cimsession –sessionoption $sessionoptions –computername Localhost,localhost,localhost –name LocalSessions


###################################################################
# Example On How To Retrieve a New Session
###################################################################
New-cimsession
$newsession = get-cimsession
$newsession


###################################################################
# Example On How To Launch a Calculator on a Remote System
###################################################################
New-cimsession –name MyComputer
$newsession = get-cimsession –Name MyComputer
Invoke-cimmethod –cimsession $newsession –class win32_process –MethodName Create –Argument @{CommandLine='calc.exe';CurrentDirectory="c:\windows\system32"}


###################################################################
# Example On How To Remove a CIM Session
###################################################################
new-cimsession –Name MySession
remove-cimsession –Name MySession
get-cimsession
