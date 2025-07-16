menuOptions()
{
    player = self.selected_player;        
    menu = self getCurrentMenu();
    map = getMapName();

    player_names = [];
    foreach(players in level.players)
        player_names[player_names.size] = players.name;  

    num_players = level.players.size;

    switch(menu)
    {
        case "main":
        {
            self addMenu("main", "Main Menu");
                self addOpt("Sub Menu 1", ::newMenu, "submenu1");
                self addOpt("Sub Menu 2", ::newMenu, "submenu2");
                self addOpt("Sub Menu 3", ::newMenu, "submenu3");     
                self addOpt("Sub Menu 4", ::newMenu, "submenu4");
                self addOpt("Sub Menu 5", ::newMenu, "submenu5");
                self addOpt("Clients [^2" + num_players + "^7]", ::newMenu, "clientOpts"); // Added player count here
                self addOpt("Settings", ::newMenu, "settingsOpts");
                self addOpt("Disconnect", ::quickQuit);
        }
        /* Sub Menu 1 */
        case "submenu1":  
        {
            self addMenu( "submenu1", "Sub Menu 1" );
            self addOpt( "Add Bots", ::spawn_bot_with_player);
            self addOpt( "Option 2", ::testoption);
            self addOpt( "Option 3", ::testoption);
            self addOpt( "Option 4", ::testoption);
            self addOpt( "Option 5", ::testoption);
            self addOpt( "Option 6", ::testoption);
            self addOpt( "Option 7", ::testoption);
            self addOpt( "Option 8", ::testoption);
            self addOpt( "Option 9", ::testoption);
            self addOpt( "Option 10", ::testoption);
        }
        /* Sub Menu 2 */
        case "submenu2":  
        {
            self addMenu( "submenu2", "Sub Menu 2" );
            self addOpt( "Option 1", ::testoption);
            self addOpt( "Option 2", ::testoption);
            self addOpt( "Option 3", ::testoption);
            self addOpt( "Option 4", ::testoption);
            self addOpt( "Option 5", ::testoption);
            self addOpt( "Option 6", ::testoption);
            self addOpt( "Option 7", ::testoption);
            self addOpt( "Option 8", ::testoption);
            self addOpt( "Option 9", ::testoption);
            self addOpt( "Option 10", ::testoption);
        }
        /* Sub Menu 3 */
        case "submenu3":  
        {
            self addMenu( "submenu3", "Sub Menu 3" );
            self addOpt( "Option 1", ::testoption);
            self addOpt( "Option 2", ::testoption);
            self addOpt( "Option 3", ::testoption);
            self addOpt( "Option 4", ::testoption);
            self addOpt( "Option 5", ::testoption);
            self addOpt( "Option 6", ::testoption);
            self addOpt( "Option 7", ::testoption);
            self addOpt( "Option 8", ::testoption);
            self addOpt( "Option 9", ::testoption);
            self addOpt( "Option 10", ::testoption);
        }
        /* Sub Menu 4 */
        case "submenu4":  
        {
            self addMenu( "submenu4", "Sub Menu 4" );
            self addOpt( "Option 1", ::testoption);
            self addOpt( "Option 2", ::testoption);
            self addOpt( "Option 3", ::testoption);
            self addOpt( "Option 4", ::testoption);
            self addOpt( "Option 5", ::testoption);
            self addOpt( "Option 6", ::testoption);
            self addOpt( "Option 7", ::testoption);
            self addOpt( "Option 8", ::testoption);
            self addOpt( "Option 9", ::testoption);
            self addOpt( "Option 10", ::testoption);
        }
        /* Sub Menu 5 */
        case "submenu5":  
        {
            self addMenu( "submenu5", "Sub Menu 5" );
            self addOpt( "Option 1", ::testoption);
            self addOpt( "Option 2", ::testoption);
            self addOpt( "Option 3", ::testoption);
            self addOpt( "Option 4", ::testoption);
            self addOpt( "Option 5", ::testoption);
            self addOpt( "Option 6", ::testoption);
            self addOpt( "Option 7", ::testoption);
            self addOpt( "Option 8", ::testoption);
            self addOpt( "Option 9", ::testoption);
            self addOpt( "Option 10", ::testoption);
        }
        /* Settings */
        case "settingsOpts":  
        {
            self addMenu( "settingsOpts", "Settings" );
            self addSliderString("Schemes", "default;red;blue;green;yellow;orange;purple;pink;moxy;mint;raspberry;wolverine", "Default;Red;Blue;Green;Yellow;Orange;Purple;Pink;moxy;Mint;Raspberry;Wolverine", ::color_scheme);
            self addSliderString("Scroll Sound", "default;none;sound1;sound2;sound3;sound4;sound5;sound6;sound7;sound8;sound9;sound10", "Default;None;Sound1;Sound2;Sound3;Sound4;Sound5;Sound6;Sound7;Sound8;Sound9;Sound10", ::scrollSound);
            self addOpt( "Option 3", ::testoption);
            self addOpt( "Option 4", ::testoption);
            self addOpt( "Option 5", ::testoption);
            self addOpt( "Option 6", ::testoption);
            self addOpt( "Option 7", ::testoption);
            self addOpt( "Option 8", ::testoption);
            self addOpt( "Option 9", ::testoption);
            self addOpt( "Option 10", ::testoption);
        }
    }
    self clientOptions();
}

clientOptions()
{
    // Clients Menu
    self addMenu("clientOpts", "Clients");

    // Iterate through each player
    foreach (player in level.players)
    {
        self addOpt(player getName(), ::newMenu, "client_" + player getEntityNumber());
    }

    // Iterate through each player to create individual client menus
    foreach (player in level.players)
    {
        // Individual Client Menu
        self addMenu("client_" + player getEntityNumber(), "Client ^2" + player getName());
        
        // Define options for the individual client menu
        self addOpt("Account Options", ::newMenu, "accountOpts_" + player getEntityNumber());
        self addOpt("Menu Status", ::newMenu, "submenuStatus_" + player getEntityNumber());
    }

    // Define the submenus for each type of option
    foreach (player in level.players)
    {
        // Account Options
        self addMenu("accountOpts_" + player getEntityNumber(), "Account Options for ^2" + player getName());
        self addToggle("Liquid Loop Toggle", player.liquidLoop, ::liquidLoop, player);
        self addOpt("Clan Tag Options", ::newMenu, "clantagOpts_" + player getEntityNumber());
        self addOpt("Remove Bots", ::zbot_remove);
        self addOpt("Option 4", ::testoption);
        self addOpt("Option 5", ::testoption);
        self addOpt("Option 6", ::testoption);
        self addOpt("Option 7", ::testoption);
        self addOpt("Option 8", ::testoption);
        self addOpt("Option 9", ::testoption);
        self addOpt("Option 10", ::testoption);

        // Clan Tag Options
        self addMenu("clantagOpts_" + player getEntityNumber(), "Clan Tag Options for ^2" + player getName());
        self addOpt("Colored Tags", ::newMenu, "coloredtagsOpts_" + player getEntityNumber());
        self addOpt("Unique Tags", ::newMenu, "uniquetagsOpts_" + player getEntityNumber());

        // Submenus under Clan Tag Options
        self addMenu("coloredtagsOpts_" + player getEntityNumber(), "Colored Tags for ^2" + player getName());
        self addOpt("Reset", ::setClantag, "", "Reset" );
        self addOpt("Black", ::setClantag, "^0", "Black" );
        self addOpt("Red", ::setClantag, "^1", "Red" );
        self addOpt("Green", ::setClantag, "^2", "Green" );
        self addOpt("Yellow", ::setClantag, "^3", "Yellow" );
        self addOpt("Blue", ::setClantag, "^4", "Blue" );
        self addOpt("Cyan", ::setClantag, "^5", "Cyan" );
        self addOpt("Magenta", ::setClantag, "^6", "Megenta" );

        self addMenu("uniquetagsOpts_" + player getEntityNumber(), "Unique Tags for ^2" + player getName());
        self addOpt("Custom Clantag", ::setClantag );
        self addOpt("3arc", ::setClantag, "3arc" );
        self addOpt("Blinking Red?", ::setClantag, "^1^F" );

        // Create "Menu Status" submenus and add options dynamically
        self addMenu("submenuStatus_" + player getEntityNumber(), "Menu Status for ^2" + player getName());
        
        // Add options dynamically based on level.status
        for (e = 0; e < level.status.size - 1; e++)
        {
            self addOpt("Give " + level.status[e], ::initializeSetup, e, player);
        }
    }
}

menuMonitor()
{
    self endon("disconnect");
    self endon("end_menu");

    savedWeapon = "none";
    while(self.access != 0)
    {
        if(!self.menu["isLocked"])
        {
            if(!self.menu["isOpen"])
            {
                if(self meleeButtonPressed() && self adsButtonPressed())
                {
                    self menuOpen();
                    wait 0.15;  // Increased from 0.1 to slow down opening
                }
            }
            else
            {
                if(self attackButtonPressed() || self adsButtonPressed())
                {
                    self.menu[self getCurrentMenu() + "_cursor"] += self attackButtonPressed();
                    self.menu[self getCurrentMenu() + "_cursor"] -= self adsButtonPressed();
                    self scrollingSystem();

                    // Play the selected scroll sound
                    self PlaySoundToPlayer(self.scrollSound, self);
                    wait 0.1;  // Increased from 0.05 to slow down scrolling
                }
                else if(self actionslotthreebuttonpressed() || self actionslotfourbuttonpressed())
                {
                    if(isDefined(self.eMenu[self getCursor()].val) || isDefined(self.eMenu[self getCursor()].ID_list))
                    {
                        if(self actionslotthreebuttonpressed()) self updateSlider("L2");
                        if(self actionslotfourbuttonpressed()) self updateSlider("R2");
                        wait 0.1;
                    }
                }
                else if(self actionslottwobuttonpressed() && self.eMenu[self getCursor()].func != ::newMenu && self isHost() && self.selected_player == self && level.players.size > 1)
                {
                    self thread selectPlayer();
                    wait 0.1;  // Increased from 0.05 to slow down selection
                }
                else if(self useButtonPressed())
                {
                    player = self.selected_player;
                    menu   = self.eMenu[self getCursor()];

                    if(player != self && self isHost())
                    {
                        player.was_edited = true;
                        self iPrintLnBold(menu.opt + " Has Been Activated.");
                    }

                    if(self.eMenu[self getCursor()].func == ::newMenu && self != player)
                    {
                        self iPrintLnBold("Error: Cannot Access Menus While In A Selected Player.");
                    }
                    else if(isDefined(self.sliders[self getCurrentMenu() + "_" + self getCursor()]))
                    {
                        slider = self.sliders[self getCurrentMenu() + "_" + self getCursor()];
                        slider = (isDefined(menu.ID_list) ? menu.ID_list[slider] : slider);
                        player thread doOption(menu.func, slider, menu.p1, menu.p2, menu.p3, menu.p4, menu.p5);
                    }
                    else
                    {
                        player thread doOption(menu.func, menu.p1, menu.p2, menu.p3, menu.p4, menu.p5);
                    }

                    wait 0.1;  // Increased from 0.05 to slow down option selection
                    if(isDefined(menu.toggle)) self setMenuText();
                    if(player != self) self.menu["OPT"]["MENU_TITLE"] setText(self.menuTitle + " (" + player getName() + ")");
                    wait 0.15;  // Increased from 0.1 for better pacing
                    if(isDefined(player.was_edited) && self isHost()) player.was_edited = undefined;
                }
                else if(self meleeButtonPressed())
                {
                    if(self.selected_player != self)
                    {
                        self.selected_player = self;
                        self setMenuText();
                        self refreshTitle();
                    }
                    else if(self getCurrentMenu() == "main")
                    {
                        self menuClose();
                    }
                    else
                    {
                        self newMenu();
                    }
                    wait 0.15;  // Increased from 0.1 for better pacing
                    // Do not continue here to avoid exiting the loop prematurely
                }

                if(self isSwitchingWeapons() && isInArray(strTok("Rig,Optic,Mod", ","), self getCurrentMenu()) && savedWeapon != self getCurrentWeapon())
                {
                    savedWeapon = self getCurrentWeapon();
                    self setMenuText();
                }
            }
        }
        wait 0.05;  // Increased from 0.02 for better pacing
    }
}

menuOpen()
{
    // Enable weapons when menu is closed
    DisableWeaps();

    self.menu["isOpen"] = true;
    self menuOptions();
    self drawMenu();
    self drawText();
    self setMenuText(); 
    self updateScrollbar();
    self setColorScheme(); // only here for stupid sliders

    // Recalculate the option counter text when opening the menu
    self recalculateOptionCounter(); 

    // Add the following line to recalculate the option counter when entering a submenu
    if (getCurrentMenu() != "main") // Check if entering a submenu
        self recalculateOptionCounter();
}

menuClose()
{
    // Enable weapons when menu is closed
    EnableWeaps();
    
    self.menu["isOpen"] = false;
    self destroyAll(self.menu["UI"]); 
    self destroyAll(self.menu["OPT"]);
    self destroyAll(self.menu["UI_TOG_BG"]);
    self destroyAll(self.menu["UI_TOG_INNER"]);
    self destroyAll(self.menu["UI_SLIDE"]);

    // Recalculate the option counter text when closing the menu
    self recalculateOptionCounter(); 

    // Add the following line to recalculate the option counter when exiting a submenu
    if (getCurrentMenu() != "main") // Check if exiting a submenu
        self recalculateOptionCounter();
}

recalculateOptionCounter()
{
    // Calculate the current option index and total options count
    currentOptionIndex = self.menu[ getCurrentMenu() + "_cursor" ] + 1;
    totalOptionsCount = self.eMenu.size;

    // Update the option counter text
    self.menu["UI"]["OPTCOUNTER"] setText(currentOptionIndex + " / " + totalOptionsCount);
}

drawMenu()
{
    if(!isDefined(self.menu["UI"]))
        self.menu["UI"] = [];
    if(!isDefined(self.menu["UI_TOG_BG"])) 
        self.menu["UI_TOG_BG"] = [];
    if(!isDefined(self.menu["UI_TOG_INNER"])) 
        self.menu["UI_TOG_INNER"] = [];  
    if(!isDefined(self.menu["UI_SLIDE"]))
        self.menu["UI_SLIDE"] = [];
    if(!isDefined(self.menu["UI_STRING"]))
        self.menu["UI_STRING"] = []; 

    self.presets["nautaX"] = -270;
    self.presets["nautaY"] = -180;
    self.presets["nautaWidth"] = 260;
    self.presets["nautaHeight"] = 190;

    self.menu["UI"]["OUTLINE"] = self createRectangle("TOP", "CENTER", self.presets["nautaX"], self.presets["nautaY"] - 40, self.presets["nautaWidth"], self.presets["nautaHeight"], self.presets["OUTLINE"], "white", 0, 1); //DONE
    self.menu["UI"]["SUBT_BG"] = self createRectangle("TOP", "CENTER", self.presets["nautaX"], self.presets["nautaY"] - 39, 260, 54, self.presets["SUBT_BG"], "white", 1, 1);
    self.menu["UI"]["SUBT_LINE"] = self createRectangle("TOP", "CENTER", self.presets["nautaX"], self.presets["nautaY"] + 14, self.presets["nautaWidth"], 1, self.presets["SUBT_LINE"], "white", 3, 1);
    self.menu["UI"]["OPT_BG"] = self createRectangle("TOP", "CENTER", self.presets["nautaX"], self.presets["nautaY"] + 14, 260, self.presets["nautaHeight"], self.presets["OPT_BG"], "white", 1, 1);
    self.menu["UI"]["SCROLLER"] = self createRectangle("LEFT", "CENTER", self.presets["nautaX"] - 130, self.presets["Y"] - 108, 260, 20, self.presets["SCROLLER"], "white", 2, 1);

    // Ensure menu background stays the size of 10 options
    size = (self.eMenu.size >= 10) ? 10 : self.eMenu.size;
    height = int(18 * size);
    math = (self.eMenu.size > 10) ? ((180 / self.eMenu.size) * size) : (height - 15);
    self.menu["UI"]["BOTTOM_BAR"] = self createRectangle("TOP", "CENTER", self.presets["nautaX"], self.presets["nautaY"] - 20 + height + 45, self.presets["nautaWidth"], 20, self.presets["SUBT_BG"], "white", 5, 1); //DONE
    
    // Calculate the current option index and total options count
    currentOptionIndex = self.menu["main_cursor"] + 1;
    totalOptionsCount = self.eMenu.size;
    
    // Create the option counter text
    self.menu["UI"]["OPTCOUNTER"] = self createText("objective", 1.1, "RIGHT", "CENTER", self.presets["nautaX"] + 125, self.presets["nautaY"] + 7, 3, 1, currentOptionIndex + " / " + totalOptionsCount, self.presets["TEXT"]);
    self resizeMenu();
}

drawText()
{
    if(!isDefined(self.menu["OPT"]))
        self.menu["OPT"] = [];
    
    // Update the menu title text to include the option counter 
    self.menu["OPT"]["MENU_TITLE"] = self createText("objective", 1.5, "CENTER", "CENTER", self.presets["nautaX"], self.presets["nautaY"] - 12, 3, 1, self.menuTitle, self.presets["TEXT"]);
    
    // Create option texts
    for(e=0; e<10; e++)
        self.menu["OPT"][e] = self createText("default", 1, "LEFT", "CENTER", self.presets["nautaX"] - 120, self.presets["nautaY"] + 28 + (e*18), 3, 1, "", self.presets["TEXT"]);
}

refreshTitle()
{
    self.menu["OPT"]["MENU_TITLE"] setText(self.menuTitle);
}
    
scrollingSystem()
{
    if(self getCursor() >= self.eMenu.size || self getCursor() < 0 || self getCursor() == 9)
    {
        if(self getCursor() <= 0)
            self.menu[ self getCurrentMenu() + "_cursor" ] = self.eMenu.size -1;
        else if(self getCursor() >= self.eMenu.size)
            self.menu[ self getCurrentMenu() + "_cursor" ] = 0;
    }
    
    // Update the option counter text
    self recalculateOptionCounter(); 
    self setMenuText();
    self updateScrollbar();
}

updateScrollbar()
{
    curs = (self getCursor() >= 10) ? 9 : self getCursor();  
    self.menu["UI"]["SCROLLER"].y = (self.menu["OPT"][curs].y);
    
    size       = (self.eMenu.size >= 10) ? 10 : self.eMenu.size;
    height     = int(18*size);
    math   = (self.eMenu.size > 10) ? ((180 / self.eMenu.size) * size) : (height - 15);
    position_Y = (self.eMenu.size-1) / ((height - 15) - math);
} 

setMenuText()
{
    self endon("disconnect");
    self menuOptions(); // updates toggles etc.
    self resizeMenu();
    self recalculateOptionCounter();

    ary = (self getCursor() >= 10) ? (self getCursor() - 9) : 0;  
    self destroyAll(self.menu["UI_TOG_BG"]);
    self destroyAll(self.menu["UI_TOG_INNER"]);
    self destroyAll(self.menu["UI_SLIDE"]);
    
    for(e = 0; e < 10; e++)
    {
        self.menu["OPT"][e].x = self.presets["nautaX"] - 120; 
        
        if(isDefined(self.eMenu[ ary + e ].opt))
            self.menu["OPT"][e] setText( self.eMenu[ ary + e ].opt );
        else 
            self.menu["OPT"][e] setText("");
            
        if(IsDefined( self.eMenu[ ary + e ].toggle ))
        {
            self.menu["UI_TOG_BG"][e] = self createRectangle("CENTER", "CENTER", self.menu["OPT"][e].x + 240, self.menu["OPT"][e].y, 14, 14, self.presets["UI_TOG_BG"], "white", 4, 1); //BG
            self.menu["UI_TOG_INNER"][e] = self createRectangle("CENTER", "CENTER", self.menu["OPT"][e].x + 240, self.menu["UI_TOG_BG"][e].y, 12, 12, (self.eMenu[ ary + e ].toggle) ? self.presets["UI_TOG_INNER_TOGGLED"] : self.presets["UI_TOG_INNER_UNTOGGLED"], "white", 5, 1); //INNER
        }
        if(IsDefined( self.eMenu[ ary + e ].val ))
        {
            self.menu["UI_SLIDE"][e] = self createRectangle("RIGHT", "CENTER", self.menu["OPT"][e].x + 240, self.menu["OPT"][e].y, 108, 14, (0,0,0), "white", 4, 1); //BG
            self.menu["UI_SLIDE"][e + 10] = self createRectangle("LEFT", "CENTER", self.menu["OPT"][e].x + 240, self.menu["UI_SLIDE"][e].y, 12, 12, self.presets["SCROLLER"], "white", 5, 1); //INNER
            if( self getCursor() == ( ary + e ) )
                self.menu["UI_SLIDE"]["VAL"] = self createText("default", 1, "RIGHT", "CENTER", self.menu["OPT"][e].x + 126, self.menu["OPT"][e].y, 5, 1, self.sliders[ self getCurrentMenu() + "_" + self getCursor() ] + "", self.presets["TEXT"]);
            self updateSlider( "", e, ary + e );
        }
        if( IsDefined( self.eMenu[ (ary + e) ].ID_list ) )
        {
            if(!isDefined( self.sliders[ self getCurrentMenu() + "_" + (ary + e)] ))
                self.sliders[ self getCurrentMenu() + "_" + (ary + e) ] = 0;
                
            self.menu["UI_SLIDE"]["STRING_"+e] = self createText("default", 1, "RIGHT", "CENTER", self.menu["OPT"][e].x + 240, self.menu["OPT"][e].y, 6, 1, "", self.presets["TEXT"]);
            self updateSlider( "", e, ary + e );
        }
        if( self.eMenu[ ary + e ].func == ::newMenu && IsDefined( self.eMenu[ ary + e ].func ) )
            self.menu["UI_SLIDE"]["SUBMENU"+e] = self createText("default", 1, "RIGHT", "CENTER", self.menu["OPT"][e].x + 240, self.menu["OPT"][e].y, 7, 1, ">", self.presets["TEXT"]);
    }
}

    
resizeMenu()
{
    size = (self.eMenu.size >= 10) ? 10 : self.eMenu.size;
    height = int(18 * size);

    // Adjust height for odd sizes
    adjustedHeight = (size % 1 == 0) ? height : height + 18; // size % 1 makes it look good but OPT_BG took small

    // Specific adjustment for 11 options
    if (self.eMenu.size == 11)
    {
        adjustedHeight = height;  // Adjust height specifically for 11 options
    }

    // Adjust the position and size of OPT_BG and OUTLINE
    self.menu["UI"]["OPT_BG"] SetShader("white", 260, adjustedHeight + 11);
    self.menu["UI"]["OUTLINE"] SetShader("white", 262, adjustedHeight + 87);

    // Adjust the position and size of BOTTOM_BAR
    if (isDefined(self.menu["UI"]["BOTTOM_BAR"]))
    {
        self.menu["UI"]["BOTTOM_BAR"].y = self.presets["nautaY"] - 20 + adjustedHeight + 46; // Adjusted to align with OUTLINE
        self.menu["UI"]["BOTTOM_BAR"].x = self.presets["nautaX"];
        self.menu["UI"]["BOTTOM_BAR"].width = self.presets["nautaWidth"];
    }

    // Adjust the position of OPT_BG to maintain the gap with BOTTOM_BAR
    self.menu["UI"]["OPT_BG"].y = self.menu["UI"]["BOTTOM_BAR"].y - adjustedHeight - 12;
}