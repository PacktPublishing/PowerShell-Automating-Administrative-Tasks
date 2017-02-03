Function Send-SelfIM{
    $LyncClient = [Microsoft.Lync.Model.LyncClient]::GetClient()
    $ConversationManager = $LyncClient.ConversationManager;
    $Conversation = $ConversationManager.AddConversation();
    [void]$Conversation.AddParticipant($LyncClient.Self.Contact)
    $Conversation.Modalities['InstantMessage'].BeginSendMessage("Okay! This Works",$null,$null);
}
Send-SelfIM
