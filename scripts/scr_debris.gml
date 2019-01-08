if global.inGrav = true {
    while instance_exists(obj_debris) {
        with (obj_debris) {
            instance_destroy();
            clone = instance_create(phy_position_x, phy_position_y, obj_debrisK);
            clone.phy_rotation = phy_rotation;
        }
    }
} else {
   while instance_exists(obj_debrisK) {
        with (obj_debrisK) {
            instance_destroy();
            clone = instance_create(phy_position_x, phy_position_y, obj_debris);
            clone.phy_rotation = phy_rotation;
        }
    }
}
