//SCHEMES

themeChange(type)
{
    // Check if the type is OUTLINE
    if (type == "SUBT_BG" || type == "OUTLINE")
    {
        // Get the RGB values from presets
        R = self.presets[type][0];
        G = self.presets[type][1];
        B = self.presets[type][2];

        // Update OUTLINE colors based on the presets
        self.menu["UI"][type].color = (R, G, B);
    }
}

setColorScheme(colorScheme)
{
    switch (colorScheme)
    {
        case "default":
            self.presets["SUBT_BG"] = get_preset("SUBT_BG");
            self.presets["SUBT_LINE"] = get_preset("SUBT_LINE");
            self.presets["OUTLINE"] = get_preset("OUTLINE");
            self.presets["UI_TOG_BG"] = get_preset("UI_TOG_BG");
            self.presets["UI_TOG_INNER"] = get_preset("UI_TOG_INNER");
            self.presets["UI_TOG_INNER_TOGGLED"] = get_preset("UI_TOG_INNER_TOGGLED");
            self.presets["UI_TOG_INNER_UNTOGGLED"] = get_preset("UI_TOG_INNER_UNTOGGLED");
            break;
        case "red":
            self.presets["SUBT_BG"] = get_preset("SUBT_BG");
            self.presets["SUBT_LINE"] = (1, 0, 0);
            self.presets["OUTLINE"] = (1, 0, 0);
            self.presets["UI_TOG_BG"] = (1, 0, 0);
            self.presets["UI_TOG_INNER_TOGGLED"] = get_preset("UI_TOG_INNER_TOGGLED");
            break;
        case "blue":
            self.presets["SUBT_BG"] = get_preset("SUBT_BG");
            self.presets["SUBT_LINE"] = (0, 0, 1);
            self.presets["OUTLINE"] = (0, 0, 1);
            self.presets["UI_TOG_BG"] = (0, 0, 1);
            self.presets["UI_TOG_INNER_TOGGLED"] = get_preset("UI_TOG_INNER_TOGGLED");
            break;
        case "green":
            self.presets["SUBT_BG"] = get_preset("SUBT_BG");
            self.presets["SUBT_LINE"] = (0, 1, 0);
            self.presets["OUTLINE"] = (0, 1, 0);
            self.presets["UI_TOG_BG"] = (0, 1, 0);
            self.presets["UI_TOG_INNER_TOGGLED"] = get_preset("UI_TOG_INNER_TOGGLED");
            break;
        case "yellow":
            self.presets["SUBT_BG"] = get_preset("SUBT_BG");
            self.presets["SUBT_LINE"] = (1, 1, 0);
            self.presets["OUTLINE"] = (1, 1, 0);
            self.presets["UI_TOG_BG"] = (1, 1, 0);
            self.presets["UI_TOG_INNER_TOGGLED"] = get_preset("UI_TOG_INNER_TOGGLED");
            break;
        case "orange":
            self.presets["SUBT_BG"] = get_preset("SUBT_BG");
            self.presets["SUBT_LINE"] = (1, 0.647, 0);
            self.presets["OUTLINE"] = (1, 0.647, 0);
            self.presets["UI_TOG_BG"] = (1, 0.647, 0);
            self.presets["UI_TOG_INNER_TOGGLED"] = get_preset("UI_TOG_INNER_TOGGLED");
            break;
        case "purple":
            self.presets["SUBT_BG"] = get_preset("SUBT_BG");
            self.presets["SUBT_LINE"] = (0.533, 0.118, 0.894);
            self.presets["OUTLINE"] = (0.533, 0.118, 0.894);
            self.presets["UI_TOG_BG"] = (0.533, 0.118, 0.894);
            self.presets["UI_TOG_INNER_TOGGLED"] = get_preset("UI_TOG_INNER_TOGGLED");
            break;
        case "pink":
            self.presets["SUBT_BG"] = get_preset("SUBT_BG");
            self.presets["SUBT_LINE"] = (0.945, 0.557, 0.765);
            self.presets["OUTLINE"] = (0.945, 0.557, 0.765);
            self.presets["UI_TOG_BG"] = (0.945, 0.557, 0.765);
            self.presets["UI_TOG_INNER_TOGGLED"] = get_preset("UI_TOG_INNER_TOGGLED");
            break;
        case "moxy":
            self.presets["SUBT_BG"] = get_preset("SUBT_BG");
            self.presets["SUBT_LINE"] = (0.102, 0.149, 0.341);
            self.presets["OUTLINE"] = (0.102, 0.149, 0.341);
            self.presets["UI_TOG_BG"] = (0.102, 0.149, 0.341);
            self.presets["UI_TOG_INNER_TOGGLED"] = get_preset("UI_TOG_INNER_TOGGLED");
            break;
        case "mint":
            self.presets["SUBT_BG"] = get_preset("SUBT_BG");
            self.presets["SUBT_LINE"] = (0.239, 0.643, 0.514);
            self.presets["OUTLINE"] = (0.239, 0.643, 0.514);
            self.presets["UI_TOG_BG"] = (0.239, 0.643, 0.514);
            self.presets["UI_TOG_INNER_TOGGLED"] = (0.239, 0.643, 0.514);
            break;
        case "raspberry":
            self.presets["SUBT_BG"] = get_preset("SUBT_BG");
            self.presets["SUBT_LINE"] = (0.5294118, 0.1490196, 0.3411765);
            self.presets["OUTLINE"] = (0.5294118, 0.1490196, 0.3411765);
            self.presets["UI_TOG_BG"] = (0.5294118, 0.1490196, 0.3411765);
            self.presets["UI_TOG_INNER_TOGGLED"] = (0.5294118, 0.1490196, 0.3411765);
            break;
        case "wolverine":
            self.presets["SUBT_BG"] = (1, 0.863, 0.310);
            self.presets["SUBT_LINE"] = (0.008, 0.008, 0);
            self.presets["OUTLINE"] = (0.008, 0.008, 0);
            self.presets["UI_TOG_BG"] = (0.008, 0.008, 0);
            self.presets["UI_TOG_INNER_TOGGLED"] = (1, 0.863, 0.310);
            break;
    }
    // Call themeChange function to update the theme elements
    themeChange("SUBT_BG");
    themeChange("OUTLINE");
    self updateCurrentMenu();
}

color_scheme(value)
{
    setColorScheme(value);
}

//SCROLL SOUND

scrollSound(soundOption)
{
    switch(soundOption)
    {
        case "default":
            self.scrollSound = "fly_mcas_smg_button";
            break;
        case "none":
            self.scrollSound = "";
            break;
        case "sound1":
            self.scrollSound = "fly_38_open_cylinder";
            break;
        case "sound2":
            self.scrollSound = "fly_38_hammer";
            break;
        case "sound3":
            self.scrollSound = "fly_870mcs_shell_in";
            break;
        case "sound4":
            self.scrollSound = "fly_dsr50_bolt_down";
            break;
        case "sound5":
            self.scrollSound = "fly_dsr50_bolt_back";
            break;
        case "sound6":
            self.scrollSound = "fly_dsr50_bolt_up";
            break;
        case "sound7":
            self.scrollSound = "fly_melee_swipe_player_sumkey";
            break;
        case "sound8":
            self.scrollSound = "fly_mp7_charge";
            break;
        case "sound9":
            self.scrollSound = "fly_pharaoh_bolt_forward";
            break;
        case "sound10":
            self.scrollSound = "fly_talon_button_in";
            break;
        default:
            self.scrollSound = "fly_mcas_smg_button"; // Optional: handle invalid sound options
            break;
    }
}