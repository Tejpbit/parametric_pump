use <threads.scad>
include <dimensions.scad>


module chambers_divider_profile() {
    polygon(points=[
      [shaftHoleDiameter/2,0],
      [chamberDividerOuterRadius,0],
      [chamberDividerOuterRadius, dividerHeight],
      [chamberDividerInnerRadius, dividerHeight],
      [chamberDividerInnerRadius, dividerHeight - threadLength],
      [shaftHoleDiameter/2 + dcMotorShaftHolderPotrutionDiameter/2 ,dcMotorShaftHolderPotrutionHeight + wallThickness],
      [shaftHoleDiameter/2 + dcMotorShaftHolderPotrutionDiameter/2 ,wallThickness],
      [shaftHoleDiameter/2, wallThickness]
    ]);
}

module chambers_divider_cylinder() {
    rotate_extrude(angle=rotate_extrude_angle, $fn=50) chambers_divider_profile();
}

module chambers_divider() {
    union() {
        difference() {
            chambers_divider_cylinder();

            translate([0,0,dividerHeight - threadLength])
                metric_thread(dcMotorChamberOuterRadius*2+4.3 + thread_spacing, 3, threadLength, internal=true);
            
        };
        
        metric_thread(chamberDividerOuterRadius*2+thread_depth, 3, threadLength, hollow=true);
        
    };
}

chambers_divider();
