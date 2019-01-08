obj_gameCamera.shake = 22;

shrapnel2 = instance_create(x + 4, y, obj_guardPieces);
shrapnel3 = instance_create(x - 4, y, obj_guardPieces);
shrapnel4 = instance_create(x, y + 4, obj_guardPieces);
shrapnel5 = instance_create(x, y - 4, obj_guardPieces);
shrapnel6 = instance_create(x + 4, y - 4, obj_guardPieces);
shrapnel7 = instance_create(x - 4, y - 4, obj_guardPieces);
shrapnel8 = instance_create(x + 4, y + 4, obj_guardPieces);
shrapnel9 = instance_create(x - 4, y + 4, obj_guardPieces);

with (shrapnel2) {
    physics_apply_impulse(x, y, 300, irandom_range(-20, 20));
}
with (shrapnel3) {
    physics_apply_impulse(x, y, -300, irandom_range(-20, 20));
}
with (shrapnel4) {
    physics_apply_impulse(x, y, irandom_range(-20, 20), 300);
}
with (shrapnel5) {
    physics_apply_impulse(x, y, irandom_range(-20, 20), -300);
}
with (shrapnel6) {
    physics_apply_impulse(x, y, 300, -300);
}
with (shrapnel7) {
    physics_apply_impulse(x, y, -300, -300);
}
with (shrapnel8) {
    physics_apply_impulse(x, y, 300, 300);
}
with (shrapnel9) {
    physics_apply_impulse(x, y, -300, 300);
}

instance_destroy();

for (i = 1; i <= irandom_range(12, 16); i++) {
    dust = instance_create(phy_position_x + irandom_range(-2, 2), phy_position_y + irandom_range(-2, 2), obj_dust);
    dust.sprite_index = spr_guardDust;
    dust.fadeDecay = 0.002;
    dust.image_xscale *= 1.8;
    dust.image_yscale *= 1.8;
    dust.shrink = 0.98;
}

audio_play_sound(snd_explosion, 1, false);
