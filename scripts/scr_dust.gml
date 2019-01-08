if !instance_exists(obj_dust) && !place_meeting(x, y, obj_dust) {
    instance_create(phy_collision_x, phy_collision_y, obj_dust);
}
