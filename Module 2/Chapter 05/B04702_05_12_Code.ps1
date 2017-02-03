#region 
Import-Module 'C:\Program Files (x86)\Microsoft Office\Office15\LyncSDK\Assemblies\Desktop\Microsoft.Lync.Model.dll'
$Client = [Microsoft.Lync.Model.LyncClient]::GetClient()
$TestCall = {
                $Conversation = $this.ConversationManager.AddConversation()
                [void]$Conversation.AddParticipant($this.Self.TestCallEndpoint)
                [void]$Conversation.Modalities['AudioVideo'].BeginConnect({}, 0)
                Add-Member -InputObject $Conversation -MemberType ScriptMethod -Name EndCall -Value {
                    [void]$this.Modalities['AudioVideo'].BeginDisconnect([Microsoft.Lync.Model.Conversation.ModalityDisconnectReason]::None, {}, 0)
                    } -PassThru
            }
Add-Member -InputObject $Client -MemberType ScriptMethod -Name TestCall -Value $TestCall -Force
#endregion

#region
$Conversation = $Client.TestCall()
Start-Sleep 15
$Conversation.EndCall()
#endregion
