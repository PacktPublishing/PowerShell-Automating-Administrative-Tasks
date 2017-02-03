Import-Module -Name 'C:\Program Files (x86)\Microsoft Office\Office15\LyncSDK\Assemblies\Desktop\Microsoft.Lync.Model.dll'
$Client = [Microsoft.Lync.Model.LyncClient]::GetClient()
$self = $Client.Self
$contactInfo = New-object 'System.Collections.Generic.Dictionary[
  Microsoft.Lync.Model.PublishableContactInformationType, object]'
$contactInfo.Add([Microsoft.Lync.Model.PublishableContactInformationType]::Availability,6500)
$ar = $self.BeginPublishContactInformation($contactInfo, $null, $null)
$self.EndPublishContactInformation($ar)