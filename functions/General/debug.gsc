quickQuit()
{
    exitLevel(0);
}

testoption()
{
    self iPrintLnBold("This is a test ^1function.");
}

testtoggle()
{
    if (!isDefined(self.testtoggle))
    {
        self.testtoggle = true;
        self iPrintLnBold("^7Toggle: ^2ON");
    }
    else
    {
        self.testtoggle = undefined;
        self iPrintLnBold("^7Toggle: ^1OFF");
    }
}

FindHudLocation() {
    // Get the current location of HUD elements
    currentTitleBgX = self.menu["UI"]["TITLE_BG"].x;
    currentTitleBgY = self.menu["UI"]["TITLE_BG"].y;
    currentSubtBgX = self.menu["UI"]["SUBT_BG"].x;
    currentSubtBgY = self.menu["UI"]["SUBT_BG"].y;
    currentOptBgX = self.menu["UI"]["OPT_BG"].x;
    currentOptBgY = self.menu["UI"]["OPT_BG"].y;
    currentOutlineX = self.menu["UI"]["OUTLINE"].x;
    currentOutlineY = self.menu["UI"]["OUTLINE"].y;
    currentOutlinewidth = self.menu["UI"]["OUTLINE"].width;
    currentOutlineheight = self.menu["UI"]["OUTLINE"].height;
    currentScrollerX = self.menu["UI"]["SCROLLER"].x;
    currentScrollerY = self.menu["UI"]["SCROLLER"].y;

    // Print the current locations
    self iPrintLnBold("Current TITLE_BG Location: (" + currentTitleBgX + ", " + currentTitleBgY + ")");
    wait 3;
    self iPrintLnBold("Current SUBT_BG Location: (" + currentSubtBgX + ", " + currentSubtBgY + ")");
    wait 3;
    self iPrintLnBold("Current OPT_BG Location: (" + currentOptBgX + ", " + currentOptBgY + ")");
    wait 3;
    self iPrintLnBold("Current OUTLINE Location: (" + currentOutlineX + ", " + currentOutlineY + ")");
    wait 3;
    self iPrintLnBold("Current OUTLINE Dimentions: (" + currentOutlinewidth + ", " + currentOutlineheight + ")");
    wait 3;
    self iPrintLnBold("Current SCROLLER Location: (" + currentScrollerX + ", " + currentScrollerY + ")");
}

//bots

zbot_spawn()
{
    while(self.sessionstate != "spectator")
        wait .1;
    self [[level.spawnPlayer]]();
}

zbot_add()
{
    bot = AddTestClient();
    if(!isdefined(bot))
        return;
    bot.pers["isBot"] = 1;
    bot.equipment_enabled = 0;
    return bot;
}

_bot_spawn( count )
{
    for(e=0;e<count;e++)
    {
        if(level.players.size == 4)
            return;

        bot = zbot_add();
        wait .1;
        bot thread zbot_spawn();
    }
}

zbot_remove( count )
{
    foreach( bot in level.players )
    {
        if(!bot IsTestClient())
            continue;
        Kick( bot getEntityNumber() );
    }
}

zbot_give_weapon()
{
    foreach( bot in level.players )
    {
        if(!bot IsTestClient())
            continue;
        array = randomInt( level.weapons.size );
        index = level.weapons[array].size;
        weapon = level.weapons[ array ][ randomInt(index) ].id;

        bot giveWeap( weapon, true, 1 );
    }
}

spawn_bot_with_player()
{
    if(level.players.size == 4)
        return;

    // Spawn the bot
    bot = zbot_add();
    if (!isDefined(bot))
        return;

    // Set the bot's origin and angles to match the player
    bot.origin = self.origin;
    bot.angles = self.angles;

    wait .1;
    bot thread zbot_spawn();
}