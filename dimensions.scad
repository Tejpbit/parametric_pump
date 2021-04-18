thread_spacing = 0;
// DC motor housing/chamber
height = 47;
innerRadius = 14.1;
wallThickness = 3;
dcMotorChamberOuterRadius = innerRadius+wallThickness;
wireHoleRadius = 2;
threadLength = 10;

// Chamber divider
// +0.5 are clearances
shaftHoleDiameter = 2.1 + 0.5;
dcMotorShaftHolderPotrutionHeight = 2.5;
dcMotorShaftHolderPotrutionDiameter = 9.7 + 0.5;
dividerHeight = wallThickness+dcMotorShaftHolderPotrutionHeight + threadLength;
chamberDividerOuterRadius = dcMotorChamberOuterRadius+wallThickness;

// Impeller chamber
impellerHeight = 10;
impellerChamberInnerRadius = chamberDividerOuterRadius;
impellerChamberInnerHeight = impellerHeight;
impellerChamberOuterRadius = chamberDividerOuterRadius+wallThickness;
impellerChamberOuterHeight = impellerChamberInnerHeight + wallThickness + threadLength;
inputHoseInnerDiameter = 8;


tubeConnectorWallThickness = 1; // you probaby don't need to change this
tubeConnectorHoleRadius = (inputHoseInnerDiameter - tubeConnectorWallThickness*2)/2;


rotate_extrude_angle=360;