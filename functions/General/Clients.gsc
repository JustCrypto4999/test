Kickclient(player)
{
    if(player IsHost())
    {
        self iPrintlnBold("^1ERROR: ^7Host Removal is not permitted.");
        return;
    }
    
    // Get the player's name
    player_name = player.name;
    
    // Perform the kick action
    Kick(player GetEntityNumber(), "EXE_PLAYERKICKED_NOTSPAWNED");
    
    // Print confirmation
    self iPrintlnBold("^2SUCCESS: ^7" + player_name + " ^7has been Removed.");
}