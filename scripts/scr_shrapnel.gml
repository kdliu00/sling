obj_gameCamera.shake = 8;

shrapnel1 = instance_create(x - 4, y + 4, obj_shrapnelC);
shrapnel2 = instance_create(x + 4, y, obj_shrapnelC);
shrapnel3 = instance_create(x - 4, y, obj_shrapnelC);
shrapnel4 = instance_create(x, y + 4, obj_shrapnelC);
shrapnel5 = instance_create(x, y - 4, obj_shrapnelC);
shrapnel6 = instance_create(x + 4, y - 4, obj_shrapnelC);

shrapnel1.phy_linear_velocity_x = phy_linear_velocity_x;
shrapnel1.phy_linear_velocity_y = phy_linear_velocity_y;
shrapnel2.phy_linear_velocity_x = phy_linear_velocity_x;
shrapnel2.phy_linear_velocity_y = phy_linear_velocity_y;
shrapnel3.phy_linear_velocity_x = phy_linear_velocity_x;
shrapnel3.phy_linear_velocity_y = phy_linear_velocity_y;
shrapnel4.phy_linear_velocity_x = phy_linear_velocity_x;
shrapnel4.phy_linear_velocity_y = phy_linear_velocity_y;
shrapnel5.phy_linear_velocity_x = phy_linear_velocity_x;
shrapnel5.phy_linear_velocity_y = phy_linear_velocity_y;
shrapnel6.phy_linear_velocity_x = phy_linear_velocity_x;
shrapnel6.phy_linear_velocity_y = phy_linear_velocity_y;

with (shrapnel1) {
    physics_apply_impulse(x, y, irandom_range(-25, 25), irandom_range(-25 , 25));
}
with (shrapnel2) {
    physics_apply_impulse(x, y, irandom_range(-25, 25), irandom_range(-25 , 25));
}
with (shrapnel3) {
    physics_apply_impulse(x, y, irandom_range(-25, 25), irandom_range(-25 , 25));
}
with (shrapnel4) {
    physics_apply_impulse(x, y, irandom_range(-25, 25), irandom_range(-25 , 25));
}
with (shrapnel5) {
    physics_apply_impulse(x, y, irandom_range(-25, 25), irandom_range(-25 , 25));
}
with (shrapnel6) {
    physics_apply_impulse(x, y, irandom_range(-25, 25), irandom_range(-25 , 25));
}

instance_destroy();

for (i = 1; i <= irandom_range(6, 8); i++) {
    dust = instance_create(phy_position_x + irandom_range(-2, 2), phy_position_y + irandom_range(-2, 2), obj_dust);
    dust.sprite_index = spr_dust4;
    dust.fadeDecay = 0.003;
    dust.shrink = 0.94;
}

audio_play_sound(snd_crumblingRocks, 1, false);
