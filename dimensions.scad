module cut(color, offset) {
    difference() {
        children();
        color(color) translate([-200,-100,offset*2-100]) cube(200);    
    }
}

// To adjust for an imperfect world.
// Only Applied to internal threads.
// Intended to be added to the radius
thread_spacing = 0.5;
// hack since threads are defined by the outer diameter but i'm using them from an inner diameter perspective and i don't
// want to figure out how deep the threads are
// If i redesign this i'd use the threads libs more to create whole shapes that i cut from.
// Or figure out how to give it a flag to say "assume the diameter is the inner one"
thread_depth = 4.4; // I just adjusted this number until the threads were outside of the object but I saw no gap

// DC motor housing/chamber
height = 47;
innerRadius = 14.1;
wallThickness = 3;
dcMotorChamberOuterRadius = innerRadius+wallThickness;
echo("dcMotorChamberOuterRadius", dcMotorChamberOuterRadius);
wireHoleRadius = 2;
threadLength = 10;

// Chamber divider
// +0.5 are clearances
shaftHoleDiameter = 2.1 + 0.5; // shaft + clearance to not lockup shaft
dcMotorShaftHolderPotrutionHeight = 2.5; // Basically all dc motors have a small potrution around the shaft.
dcMotorShaftHolderPotrutionDiameter = 9.7 + 0.5;
dividerHeight = wallThickness+dcMotorShaftHolderPotrutionHeight + threadLength;
chamberDividerInnerRadius = dcMotorChamberOuterRadius + thread_spacing;
chamberDividerOuterRadius = chamberDividerInnerRadius + wallThickness;

// Impeller chamber
impellerHeight = 10;
impellerChamberInnerRadius = chamberDividerOuterRadius + thread_spacing;
echo("impellerChamberInnerRadius", impellerChamberInnerRadius);
impellerChamberInnerHeight = impellerHeight;
impellerChamberOuterRadius = impellerChamberInnerRadius + wallThickness;
impellerChamberOuterHeight = impellerChamberInnerHeight + wallThickness + threadLength;
inputHoseInnerDiameter = 8;


tubeConnectorWallThickness = 1; // you probaby don't need to change this
tubeConnectorHoleRadius = (inputHoseInnerDiameter - tubeConnectorWallThickness*2)/2;


rotate_extrude_angle=360;