//main lvl bounceable wall generation

wall1 = instance_create(104, 9028, obj_bounceableWall);
wall1.phy_rotation = (90);

wall2 = instance_create(225, 8768, obj_bounceableWall);
wall2.phy_rotation = (-45);

wall3 = instance_create(496, 8754, obj_bounceableWall);
wall3.phy_rotation = (-45);

wall4 = instance_create(200, 8240, obj_bounceableWall);
wall4.phy_rotation = (45);

wall5 = instance_create(495, 8246, obj_bounceableWall);
wall5.phy_rotation = (45);

wall6 = instance_create(375, 7088, obj_bounceableWall);
wall6.phy_rotation = (-25);

wall7 = instance_create(375, 7088, obj_bounceableWall);
wall7.phy_rotation = (25);

wall8 = instance_create(486, 5260, obj_bounceableWall);
wall8.phy_rotation = (-45);

wall9 = instance_create(268, 4467, obj_bounceableWall);
wall9.phy_rotation = (45);

wall10 = instance_create(632, 3620, obj_bounceableWall);
wall10.phy_rotation = (90);

// dead wall generation

wall11 = instance_create(772, 6371, obj_deadWall);
wall11.phy_rotation = (-60);


wall12 = instance_create(-25, 6371, obj_deadWall);
wall12.phy_rotation = (60);


wall13 = instance_create(175, 5760, obj_deadWall);
wall13.phy_rotation = (-90);

//charge generation 

charge1 = instance_create(575, 8976, obj_charge);

charge2 = instance_create(125, 8496, obj_charge);

charge3 = instance_create(585, 7987, obj_charge);

charge4 = instance_create(550, 7088, obj_charge);

charge5 = instance_create(200, 7088, obj_charge);

charge6 = instance_create(375, 6162, obj_charge);

charge7 = instance_create(640, 5760, obj_charge);

charge8 = instance_create(116, 4891, obj_charge);

charge9 = instance_create(627, 4112, obj_charge);

charge10 = instance_create(121, 3621, obj_charge);

charge11 = instance_create(375, 3088, obj_charge);

charge12 = instance_create(150,2576 , obj_charge);

charge13 = instance_create(600, 2576, obj_charge);

charge14 = instance_create(375, 1936, obj_charge);

//blade slash void generation

void1 = instance_create(150, 3950, obj_blade);

void2 = instance_create(150, 3088, obj_blade);

void3 = instance_create(600, 3088, obj_blade);

void4 = instance_create(375, 2576, obj_blade);

void5 = instance_create(150, 1936, obj_blade);

void6 = instance_create(600, 1936, obj_blade);

//border generation

border1 = instance_create(384, 10688, obj_bounceableWall);
border1.phy_rotation = (-90);

border2 = instance_create(750, 10368, obj_bounceableWall);

border3 = instance_create(750, 9632, obj_bounceableWall);

border4 = instance_create(750, 8896, obj_bounceableWall);

border5 = instance_create(750, 8162, obj_bounceableWall);

border6 = instance_create(750, 7456, obj_bounceableWall);

border7 = instance_create(750, 6720, obj_bounceableWall);

border8 = instance_create(750, 6041, obj_bounceableWall);

border9 = instance_create(750, 5320, obj_bounceableWall);

border10 = instance_create(750, 4608, obj_bounceableWall);

border11 = instance_create(750, 3904, obj_bounceableWall);

border12 = instance_create(750, 3296, obj_bounceableWall);

border13 = instance_create(750, 2818, obj_bounceableWall);

border14 = instance_create(750, 2338, obj_bounceableWall);

border15 = instance_create(750, 1600, obj_bounceableWall);

border16 = instance_create(750, 864, obj_bounceableWall);

border17 = instance_create(750, 131, obj_bounceableWall);

border18 = instance_create(375, 701 - (obj_player.sprite_height / 2), obj_detection);//detection
border18.phy_rotation = (-90);

border19 = instance_create(0, 10368, obj_bounceableWall);

border20 = instance_create(0, 9632, obj_bounceableWall);

border21 = instance_create(0, 8896, obj_bounceableWall);

border22 = instance_create(0, 8162, obj_bounceableWall);

border23 = instance_create(0, 7456, obj_bounceableWall);

border24 = instance_create(0, 6720, obj_bounceableWall);

border25 = instance_create(0, 6041, obj_bounceableWall);

border26 = instance_create(0, 5320, obj_bounceableWall);

border27 = instance_create(0, 4608, obj_bounceableWall);

border28 = instance_create(0, 3904, obj_bounceableWall);

border29 = instance_create(0, 3296, obj_bounceableWall);

border30 = instance_create(0, 2818, obj_bounceableWall);

border31 = instance_create(0, 2338, obj_bounceableWall);

border32 = instance_create(0, 1600, obj_bounceableWall);

border33 = instance_create(0, 864, obj_bounceableWall);

border34 = instance_create(0, 131, obj_bounceableWall);
