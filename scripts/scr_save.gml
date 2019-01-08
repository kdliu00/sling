if file_exists("ls.sav") {
    file_delete("ls.sav");
}

if global.SAVERESET = false {
    ini_open("ls.sav");
    
    for (j = 1; j <= 60; j++) {
        ini_write_real("progress", "level" + string(j), global.levels[j,1]);
    }

    ini_write_real("progress", "currentLevel", global.level);
    ini_write_real("progress", "maxLevel", global.maxLevel);
    
    ini_write_real("tutorial", "enabled", global.tutorial);
    
    ini_write_real("social", "leftRating", global.leftRating);
    
    ini_write_real("sound", "music", global.musicMute);
    ini_write_real("sound", "sfx", global.sfxMute);
    
    ini_close();
}
