Function Create-LyncClientGroup{
  param([Parameter(Mandatory = $true,ValueFromPipeline = $true)]
    [String[]]$GroupName
  )
  $client = [Microsoft.Lync.Model.LyncClient]::GetClient()
  $client.ContactManager.BeginAddGroup($GroupName, $null,$null)
}
"Test1" | Create-LyncClientGroup
