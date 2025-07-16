giveLiquid( value )
{
    self endon("disconnect");
    if( !self areYouSure() )
        return;

    amount = value / 250;
    multi  = 10 / amount;
    round  = multi + "";
    self thread progressbar( 0, 100, int(round[0]), .1); 

    for(e=0;e<amount;e++)
    {
        for(i=0;i<250;i++)
            self incrementbgbtokensgained();

        self.var_f191a1fc = self.var_f191a1fc + int(value / amount);
        self reportlootreward("3", int(value / amount));
        UploadStats(self); 
        wait 1.1;
    }
}

liquidLoop(player)
{
    // Toggle the liquid loop
    if (!isDefined(player.liquidLoop) || player.liquidLoop == false) 
    {
        player.liquidLoop = true;
        player.LiquidDivPlayer = 0; // Initialize the amount given to 0
        self iPrintLnBold("Liquid Loop: ^1ON");

        player thread liquidLoopThread();
    }
    else
    {
        player.liquidLoop = false; // Toggle the value to stop the loop
        self iPrintLnBold("Liquid Loop: ^1OFF");
    }
}

liquidLoopThread()
{
    self endon("disconnect"); // Place endon inside the thread to handle disconnection
    
    while (self.liquidLoop)
    {
        // Give 200 liquids
        self ReportLootReward("3", 200);
        self.LiquidDivPlayer += 200; // Add 200 each time

        // Print the amount given only to the executing player
        self iPrintLnBold(self getName() + "Has Been Given ^6" + self.LiquidDivPlayer);

        wait 0.1;
    }
}

setClantag( string, name = "" )
{
    if(!IsDefined( string ))
    {
        self thread refreshMenu();
        wait .2;
        string = self do_keyboard( "Clantag Editor" );
        wait .2;
        self notify( "reopen_menu" );
    }
    if( string.size == 0 && name != "None" )
        return;
    self setDStat( "clanTagStats", "clanName", string );
    self iPrintLnBold( ((name != "") ? "Name Colour" : "Clantag"), " Set: ", string + name );
}