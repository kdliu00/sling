if !instance_exists(obj_pauser) {
    if physics_test_overlap(phy_position_x, phy_position_y, phy_rotation, obj_hydraulicParent) {
        if hydraulics = false {
            hydraulic = instance_place(phy_position_x, phy_position_y, obj_hydraulicParent);
            if !instance_exists(hydraulic) {
                hydraulic = instance_nearest(phy_position_x, phy_position_y, obj_hydraulicParent);
            }
            if hydraulic.calculated = true {
                if distance_to_point(hydraulic.phy_position_x, hydraulic.phy_position_y) < distance_to_point(hydraulic.endpointX, hydraulic.endpointY) {
                    phy_position_x = hydraulic.phy_position_x;
                    phy_position_y = hydraulic.phy_position_y;
                    drive = 1;
                } else {
                    phy_position_x = hydraulic.endpointX;
                    phy_position_y = hydraulic.endpointY;
                    drive = -1;
                }
                hydraulics = true;
            }
        }
        if hydraulic.calculated = true {
            h_endX = hydraulic.endpointX;
            h_endY = hydraulic.endpointY;
            h_oriX = hydraulic.phy_position_x;
            h_oriY = hydraulic.phy_position_y;
            xxx = phy_position_x;
            yyy = phy_position_y;
            if h_endX > h_oriX {
                if h_endY > h_oriY {
                    if xxx >= h_endX && yyy >= h_endY {
                        drive = -1;
                        phy_position_x = h_endX;
                        phy_position_y = h_endY;
                    } else if xxx <= h_oriX && yyy <= h_oriY {
                        if hydraulic.connected = false {
                            drive = 1;
                            phy_position_x = h_oriX;
                            phy_position_y = h_oriY;
                        } else {
                            hydraulic = hydraulic.partner
                            phy_position_x = hydraulic.phy_position_x;
                            phy_position_y = hydraulic.phy_position_y;
                            drive = 1;
                        }
                    }
                } else {
                    if xxx >= h_endX && yyy <= h_endY {
                        drive = -1;
                        phy_position_x = h_endX;
                        phy_position_y = h_endY;
                    } else if xxx <= h_oriX && yyy >= h_oriY {
                        if hydraulic.connected = false {
                            drive = 1;
                            phy_position_x = h_oriX;
                            phy_position_y = h_oriY;
                        } else {
                            hydraulic = hydraulic.partner
                            phy_position_x = hydraulic.phy_position_x;
                            phy_position_y = hydraulic.phy_position_y;
                            drive = 1;
                        }
                    }
                }
            } else {
                if h_endY > h_oriY {
                    if xxx <= h_endX && yyy >= h_endY {
                        drive = -1;
                        phy_position_x = h_endX;
                        phy_position_y = h_endY;
                    } else if xxx >= h_oriX && yyy <= h_oriY {
                        if hydraulic.connected = false {
                            drive = 1;
                            phy_position_x = h_oriX;
                            phy_position_y = h_oriY;
                        } else {
                            hydraulic = hydraulic.partner
                            phy_position_x = hydraulic.phy_position_x;
                            phy_position_y = hydraulic.phy_position_y;
                            drive = 1;
                        }
                    }
                } else {
                    if xxx <= h_endX && yyy <= h_endY {
                        drive = -1;
                        phy_position_x = h_endX;
                        phy_position_y = h_endY;
                    } else if xxx >= h_oriX && yyy >= h_oriY {
                        if hydraulic.connected = false {
                            drive = 1;
                            phy_position_x = h_oriX;
                            phy_position_y = h_oriY;
                        } else {
                            hydraulic = hydraulic.partner
                            phy_position_x = hydraulic.phy_position_x;
                            phy_position_y = hydraulic.phy_position_y;
                            drive = 1;
                        }
                    }
                }
            }
            phy_position_x += hydraulic.iHat * drive;
            phy_position_y += hydraulic.jHat * drive;
        }
    } else if physics_test_overlap(phy_position_x, phy_position_y, phy_rotation, obj_rotator) {
        rotator = instance_nearest(phy_position_x, phy_position_y, obj_rotator);
        phy_position_x = rotator.phy_position_x;
        phy_position_y = rotator.phy_position_y;
        phy_rotation += 2;
    }
}
