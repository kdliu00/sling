for (i=1; i<=global.ballNumber; i++) {
    global.balls[i,1] = obj_player;
    global.balls[i,2] = false;
    global.balls[i,3] = spr_player;
    global.balls[i,4] = "NAME";
    global.balls[i,5] = "DESCRIPTION";
    global.balls[i,6] = "MASS";
    global.balls[i,7] = "THRUST";
    global.balls[i,8] = "COST";
}

global.balls[1,2] = true; //makes default ball available
global.balls[1,4] = "L3-V1";
global.balls[1,5] = "Standard droid built by ELPPA#primarily for time-sensitive#search-and-rescue operations";
global.balls[1,6] = 3;
global.balls[1,7] = 3;
global.balls[1,8] = 0;

global.balls[2,1] = obj_bouncy;
global.balls[2,3] = spr_bouncy;
global.balls[2,4] = "Photon";
global.balls[2,5] = "A variant of the L3-V1 modified to#take evasive maneuvers in#dangerous environments";
global.balls[2,6] = 2;
global.balls[2,7] = 4;
global.balls[2,8] = 120;

global.balls[3,1] = obj_heavy;
global.balls[3,3] = spr_heavy;
global.balls[3,4] = "R-4M";
global.balls[3,5] = "A variant of the L3-V1 modified to#punch through debris and reach#inaccessible areas";
global.balls[3,6] = 4;
global.balls[3,7] = 2;
global.balls[3,8] = 140;

global.balls[4,1] = obj_reflective;
global.balls[4,3] = spr_reflective;
global.balls[4,4] = "Ignis";
global.balls[4,5] = "Developed by Overton Technologies#to survive getting hit by#malfunctioning security lasers";
global.balls[4,6] = 3;
global.balls[4,7] = 3;
global.balls[4,8] = 240;

global.balls[5,1] = obj_hard;
global.balls[5,3] = spr_hard;
global.balls[5,4] = "EXO-5";
global.balls[5,5] = "The only droid to have a detachable#exoskeleton that increases its#survivability in hazardous situations";
global.balls[5,6] = 3;
global.balls[5,7] = 3;
global.balls[5,8] = 560;
