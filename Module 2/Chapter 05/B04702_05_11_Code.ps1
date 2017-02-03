Import-Module 'C:\Program Files (x86)\Microsoft Office\Office15\LyncSDK\Assemblies\Desktop\Microsoft.Lync.Model.dll'
$LyncClient = [Microsoft.Lync.Model.LyncClient]::Getclient()
$Conversation = $LyncClient.ConversationManager.AddConversation()
[Void]$Conversation.AddParticipant($LyncClient.Self.TestCallEndpoint)
[Void]$Conversation.Modalities['AudioVideo'].BeginConnect({},0)