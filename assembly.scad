include <dimensions.scad>;
use <dc_motor_housing.scad>;
use <chambers_divider.scad>;
use <impeller_chamber.scad>;
use <impeller.scad>;

module cut(color, offset) {
    difference() {
        children();
        color(color) translate([-200,-100,offset*2-100]) cube(200);    
    }
}

// difference() {
    //union() {
        cut("green", 3) color("azure") dc_chamber();
        cut("red", 2) color ("tomato", 0.25) translate([0,0,-5.5]) chambers_divider();
        

        impeller_height = impellerChamberInnerHeight*0.8;
        impeller_radius = impellerChamberInnerRadius*0.8;
        color("blue") translate([0,0,-6]) rotate([180,0,45]) impeller(impeller_height, impeller_radius);
        cut("blue", 1) color("lightgreen") translate([0,0,-18.5]) impeller_chamber();
    //}
    
    // color("grey") translate([-200,-100,-100]) cube(200);
// }

