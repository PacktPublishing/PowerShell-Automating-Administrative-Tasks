Function Send-SelfIM{
    Param([Parameter(Mandatory = $true)]
        [String[]]$Greet
    )
    $LyncClient = [Microsoft.Lync.Model.LyncClient]::GetClient()
    $ConversationManager = $LyncClient.ConversationManager;
    $Conversation = $ConversationManager.AddConversation();
    [void]$Conversation.AddParticipant($LyncClient.Self.Contact)
    [Void]$Conversation.Modalities['InstantMessage'].BeginSendMessage($Greet,$null,$null);
}
Send-SelfIM -Greet "Hi, I am parameterized!"