for (i = 1; i <= irandom_range(8, 12); i++) {
    dust = instance_create(phy_collision_x + irandom_range(-2, 2), phy_collision_y + irandom_range(-2, 2), obj_dust);
    dust.sprite_index = spr_dust;
}
