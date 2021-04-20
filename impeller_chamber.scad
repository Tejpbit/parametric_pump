use <threads.scad>
use <tube_connector.scad>
include <dimensions.scad>



module impeller_chamber_base() {
    rotate_extrude(angle=rotate_extrude_angle) polygon(points=[
      [0,0],
      [impellerChamberOuterRadius, 0],
      [impellerChamberOuterRadius, impellerChamberOuterHeight],
      [impellerChamberInnerRadius, impellerChamberOuterHeight],
      [impellerChamberInnerRadius, wallThickness],
      [0 ,wallThickness],
    ]);
}

/**
* inputHoseInnerDiameter: This will be the diameter of the dips between the skirts on the outside
* tubeConnectorWallThickness: this adjusts the wall thinkess. Increaing this value makes for a smaller hole.
*/
module impeller_chamber_inflow(inputHoseInnerDiameter, tubeConnectorWallThickness, shoulderHeight=0) {
    echo("inputHoseInnerDiameter", inputHoseInnerDiameter)
    echo("tubeConnectorWallThickness", tubeConnectorWallThickness)
    assert(inputHoseInnerDiameter != undef);
    assert(tubeConnectorWallThickness != undef);
    barbCount = 4;
    shoulderWidth = 0;
    rotate([180,0,0]) tube_connector(inputHoseInnerDiameter, tubeConnectorWallThickness , barbCount , shoulderWidth, shoulderHeight );
}

module impeller_chamber_outflow_hole() {
    rotate([90,0,0]) cylinder(impellerChamberOuterRadius, tubeConnectorHoleRadius,tubeConnectorHoleRadius, $fn=100);
}

/**
* holeDiameter is the inner diameter of the hole
* wallThickness is the thinnest part of the wall. Not including the skirt. Increasing this makes for a smaller hole.
*/
module impeller_chamber_outflow_adapter(innerHoseDiameter, wallThickness) {
    echo("innerHoseDiameter", innerHoseDiameter);
    echo("wallThickness", wallThickness);
    inputHoleDiameter = innerHoseDiameter + wallThickness*2;
    // used to calculate size of fastener of output tube connector
     // +1 because of shoulder
    outerDiameter = innerHoseDiameter + wallThickness + 1;
    
    rotate([-90,0,0]) difference() {
        translate([0,0,0]) union() impeller_chamber_inflow(innerHoseDiameter, wallThickness, impellerChamberOuterRadius);
            
        
        translate([-impellerChamberInnerRadius+tubeConnectorHoleRadius,outerDiameter/2,0]) {
            rotate([90, 0, 0]) cylinder(outerDiameter, impellerChamberOuterRadius, impellerChamberOuterRadius);
        }
    }
    
}

module impeller_chamber() {
    
    echo("tubeConnectorHoleRadius", tubeConnectorHoleRadius);
    echo("inputHoseInnerDiameter", inputHoseInnerDiameter);
    difference() {
        impeller_chamber_base();

        translate([0,0,impellerChamberOuterHeight - threadLength]) 
            metric_thread(impellerChamberInnerRadius*2+4.4, 3, threadLength, inner=true);
        
        translate ([0,0,-0.5]) cylinder(wallThickness+1, tubeConnectorHoleRadius, tubeConnectorHoleRadius , $fn = 50);
    
        translate([impellerChamberInnerRadius-tubeConnectorHoleRadius,0,wallThickness+tubeConnectorHoleRadius]) impeller_chamber_outflow_hole();
    }
    
    
    //TODO finish customizable size of inflow
    impeller_chamber_inflow(inputHoseInnerDiameter, tubeConnectorWallThickness);
    
    translate([impellerChamberInnerRadius-tubeConnectorHoleRadius,0,wallThickness+tubeConnectorHoleRadius]) impeller_chamber_outflow_adapter(inputHoseInnerDiameter, tubeConnectorWallThickness);
    
    
}

impeller_chamber();
