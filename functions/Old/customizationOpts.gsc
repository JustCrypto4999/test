RGB_Edit(slider, type, rgb)
{
    vec3 = (0, 0, 0);
    R = self.presets[type][0];
    G = self.presets[type][1];
    B = self.presets[type][2];

    if (rgb == "R")        vec3 = ((slider / 255), G, B);
    if (rgb == "G")        vec3 = (R, (slider / 255), B);
    if (rgb == "B")        vec3 = (R, G, (slider / 255));

    self.presets[type] = vec3;
    self updateCurrentMenu();
}

updateCurrentMenu()
{
    self destroyAll(self.menu["UI"]);

    self drawMenu();
    self setMenuText(); 
    self resizeMenu();  
    self updateScrollbar();
}