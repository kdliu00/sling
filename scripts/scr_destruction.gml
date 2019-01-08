obj_gameCamera.shake = 50;

global.slings = 0;

debris1 = instance_create(x, y, obj_fragment);
debris2 = instance_create(x + 4, y, obj_fragment);
debris3 = instance_create(x - 4, y, obj_fragment);
debris4 = instance_create(x, y + 4, obj_fragment);
debris5 = instance_create(x, y - 4, obj_fragment);
debris6 = instance_create(x + 4, y - 4, obj_fragment);
debris7 = instance_create(x - 4, y - 4, obj_fragment);
debris8 = instance_create(x + 4, y + 4, obj_fragment);
debris9 = instance_create(x - 4, y + 4, obj_fragment);

with (debris1) {
    physics_apply_impulse(x, y, irandom_range(-100, 100), irandom_range(-100, 100));
}
with (debris2) {
    physics_apply_impulse(x, y, irandom_range(-100, 100), irandom_range(-100, 100));
}
with (debris3) {
    physics_apply_impulse(x, y, irandom_range(-100, 100), irandom_range(-100, 100));
}
with (debris4) {
    physics_apply_impulse(x, y, irandom_range(-100, 100), irandom_range(-100, 100));
}
with (debris5) {
    physics_apply_impulse(x, y, irandom_range(-10, 10), irandom_range(-10, 10));
}
with (debris6) {
    physics_apply_impulse(x, y, irandom_range(-10, 10), irandom_range(-10, 10));
}
with (debris7) {
    physics_apply_impulse(x, y, irandom_range(-10, 10), irandom_range(-10, 10));
}
with (debris8) {
    physics_apply_impulse(x, y, irandom_range(-10, 10), irandom_range(-10, 10));
}
with (debris9) {
    physics_apply_impulse(x, y, irandom_range(-10, 10), irandom_range(-10 , 10));
}

phy_linear_velocity_x = 0;
phy_linear_velocity_y = 0;
phy_active = false;
image_alpha = 0;

if !instance_exists(obj_restart) {
    instance_create(375, view_yview[0] + 960, obj_restart);
}

for (i = 1; i <= irandom_range(6, 8); i++) {
    dust = instance_create(phy_collision_x + irandom_range(-2, 2), phy_collision_y + irandom_range(-2, 2), obj_dust);
    dust.sprite_index = spr_dust2;
}

audio_play_sound(snd_chargeDown, 1, false);
audio_play_sound(snd_crash, 1, false);
