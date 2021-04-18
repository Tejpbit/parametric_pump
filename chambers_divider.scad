use <threads.scad>
include <dimensions.scad>


module chambers_divider_cylinder() {
    
    
    rotate_extrude(angle=rotate_extrude_angle) polygon(points=[
      [shaftHoleDiameter/2,0],
      [chamberDividerOuterRadius,0],
      [chamberDividerOuterRadius, dividerHeight],
      [dcMotorChamberOuterRadius + thread_spacing, dividerHeight],
      [dcMotorChamberOuterRadius + thread_spacing, dividerHeight - threadLength],
      [shaftHoleDiameter/2 + dcMotorShaftHolderPotrutionDiameter/2 ,dcMotorShaftHolderPotrutionHeight + wallThickness],
      [shaftHoleDiameter/2 + dcMotorShaftHolderPotrutionDiameter/2 ,wallThickness],
      [shaftHoleDiameter/2,wallThickness]
    ]);
}

module chambers_divider() {
    union() {
        difference() {
            chambers_divider_cylinder();

            translate([0,0,dividerHeight - threadLength+0.1]) metric_thread(dcMotorChamberOuterRadius*2+4.3, 3, threadLength, hollow=true, internal=true);
        };
        metric_thread(dcMotorChamberOuterRadius*2+4.3+2.9+wallThickness, 3, threadLength, hollow=true);
    };
}

chambers_divider();