if file_exists("ls.sav") {
    ini_open("ls.sav");
    
    for (j = 1; j <= 60; j++) {
        global.levels[j,1] = ini_read_real("progress", "level" + string(j), false);
    }
    
    global.level = ini_read_real("progress", "currentLevel", 1);
    global.maxLevel = ini_read_real("progress", "maxLevel", 60);
    
    global.tutorial = ini_read_real("tutorial", "enabled", true);
    
    global.leftRating = ini_read_real("social", "leftRating", false);
    
    global.musicMute = ini_read_real("sound", "music", false);
    global.sfxMute = ini_read_real("sound", "sfx", false);
    
    ini_close();
}
