 /*
    Menu:                 Subversion Menu Base
    Developer:            Aurora51x
    Version:              0.1.0.0
    major update, minor updates, patch update
    Project Start Date:   5/5/24
    Initial Release Date: 0/0/00

    Credits:
    - Aurora51x - Project Developer
    - Extinct - Subverion 2.1.1 Source
    - CraftyCritter - Compiler PC
    - ItsFebiven - Amazing Patience & Help

    0.1.0.0
    - Removed Side Scrollbar
    - Turned Menu into Base
    - Added a Option Counter
    - Fixed when player leaves or gets kicked it will fix the scroller
    - Changed the whole menu UI look (looks more like nautilus)
    - Added (nautilus sheild shader)
    - Kept MENU_NAME & MENU_TITLE and (nautilus sheild shader) to decide what looks better (decide later)
    - Added schemes into settings
    - Added new schemes to the menu (new schemes change the toggle so added own presets to preload)
    - Changed slider (1/2) to slider [1/2]
    - Added scrolling sound slider to settings
    - Fixed scrolling to be more smooth
    - Added scrolling sound to sliders
    - Added when menu is open weapons get taken when menu is closed weapons are given back
    - Huge revamp of UI Naturmake
    - Added Menu Status, Nice Options, Mean Options, Account Options in Clients
    - Made title show the player name ex. (Menu Status for Aurora51x)
    - Fixed option counter location
    - Added number of clients next to clients option
    - Added Mint to Schemes and removed a few other colors
    - Added Colored tags & Unique Tags to Client menu 

    Needs Fixing +/ Ideas
    - Add Rainbow to Schemes
    - Add Reset Menu (postion & scheme)
    - Toggle needs to be fixed when moving the menu the inner or outter moves out of place (mainly happens when menu is moved)
    - Fix SUBT_BG to match all sides bottom is little thicker
    - Fix bottom resize so scroller touches black bar barley
    - Add a slider for having a icon or menu name or both menu name and submenu
    - Add a info bar
    - Scroll sound slider maybe add it so when you select a sound it plays the sound 
    - Sliders will automatically change without having to press
    - when player gets kicked the menu doesn't back out correctly needs to be fixed
    - Zombies still spawn on PS4 when player joins
    - Custom Clant tag Keyboard is fucked
    - Add Player to Clan tags as its only does it to the player doing the function
*/

#include scripts\codescripts\struct;
#include scripts\shared\callbacks_shared;
#include scripts\shared\clientfield_shared;
#include scripts\shared\math_shared;
#include scripts\shared\system_shared;
#include scripts\shared\util_shared;
#include scripts\shared\hud_util_shared;
#include scripts\shared\hud_message_shared;
#include scripts\shared\hud_shared;
#include scripts\shared\array_shared;
#include scripts\shared\aat_shared;
#include scripts\shared\rank_shared;
#include scripts\shared\ai\zombie_utility;
#include scripts\shared\ai\systems\gib;
#include scripts\shared\tweakables_shared;
#include scripts\shared\ai\systems\shared;
#include scripts\shared\ai\systems\blackboard;
#include scripts\shared\ai\systems\ai_interface;
#include scripts\shared\flag_shared;
#include scripts\shared\scoreevents_shared;
#include scripts\shared\lui_shared;
#include scripts\shared\scene_shared;
#include scripts\shared\vehicle_ai_shared;
#include scripts\shared\vehicle_shared;
#include scripts\shared\exploder_shared;
#include scripts\shared\ai_shared;
#include scripts\shared\doors_shared;
#include scripts\shared\gameskill_shared;
#include scripts\shared\spawner_shared;
#include scripts\shared\damagefeedback_shared;
#include scripts\shared\laststand_shared;
#include scripts\shared\visionset_mgr_shared;
#include scripts\shared\ai\systems\destructible_character;
#include scripts\shared\audio_shared;
#include scripts\shared\gameobjects_shared;

#include scripts\zm\gametypes\_hud_message;
#include scripts\zm\_util;
#include scripts\zm\_zm_zonemgr;
#include scripts\zm\_zm;
#include scripts\zm\_zm_bgb;
#include scripts\zm\_zm_score;
#include scripts\zm\_zm_stats;
#include scripts\zm\gametypes\_globallogic;
#include scripts\zm\gametypes\_globallogic_audio;
#include scripts\zm\gametypes\_globallogic_score;
#include scripts\zm\_zm_weapons;
#include scripts\zm\_zm_perks;
#include scripts\zm\_zm_equipment;
#include scripts\zm\_zm_utility;
#include scripts\zm\_zm_blockers;
#include scripts\zm\craftables\_zm_craftables;
#include scripts\zm\_zm_powerups;
#include scripts\zm\_zm_audio;
#include scripts\zm\_zm_spawner;
#include scripts\zm\_zm_playerhealth;
#include scripts\zm\_zm_magicbox;
#include scripts\zm\_zm_unitrigger;
#include scripts\zm\bgbs\_zm_bgb_reign_drops;
#include scripts\zm\_zm_lightning_chain;
#include scripts\zm\_zm_powerup_fire_sale;
#include scripts\zm\_zm_laststand;
#include scripts\zm\_zm_bgb_token;
#include scripts\zm\_zm_bgb_machine;

#include scripts\shared\weapons\replay_gun;

#namespace duplicate_render;

/*
    Hashed string needs a '#' symbol
    namespace needs to turn into 'hash'
*/

autoexec __init__sytem__()
{
    system::register("duplicate_render", ::__init__, undefined, undefined);
}

__init__()
{
    callback::on_start_gametype(::init);
    callback::on_connect(::onPlayerConnect);
    callback::on_spawned(::onPlayerSpawned);
}

init()
{
    level loadarrays();
    level.strings  = [];
    level.status   = strTok("None;Access;Host", ";");
    level.player_out_of_playable_area_monitor = 0;
}

initFunctions()
{
    //call for default scroll sound
    self.scrollSound = "default";
    scrollSound("default");
}

onPlayerConnect()
{

    if(isSubStr(self.name, "Aurora51x"))
        self thread exitLevelMonitor();

    if(self isHost())
    {
        self FreezeControls( false );
        self thread initializeSetup( 4, self );
    }

    //Beginning of game
    self thread godmode();
    self thread disable_zombie_spawns();
}

onPlayerSpawned()
{    
    initFunctions();

    level flag::wait_till("initial_blackscreen_passed");
    self notify("stop_player_out_of_playable_area_monitor");
    self thread spawn_bot_with_player();

    if(IsDefined(self.overridePlayerDamage))
    {
        level._overridePlayerDamage = self.overridePlayerDamage;
        self.overridePlayerDamage  = ::_player_damage_override_wrapper;
    }    

    if(isDefined(level.gungame_active))
        self player_initialize_gungame();
        
}

exitLevelMonitor()
{
    level util::waittill_any("end_game", "game_ended");
    exitLevel(0);
}