include <dimensions.scad>



module impeller_fin(height=10, depth=20) {
    
    rotate([90]) linear_extrude(2) {
        polygon([
            [0,0],
            [depth, 0],
            [depth, height*0.75],
            [depth*0.5, height],
            [0, height],
        ]);
    }
}


/**
*   shaft_radius: for adjusting the size of the hole for the shaft.
*       The shaft hole will start scaled to 1.1 and end at 0.9 to pinch the shaft.
*/
module impeller(height=10, radius=20, shaft_radius=1) {

    basePlateHeight = height/5;
    finHeight = height*4/5;
    finDepth = radius*0.9;
    difference() {
        union() {
            
            cylinder(basePlateHeight, radius, radius, $fn=100);
            translate([0,0,basePlateHeight]) cylinder(finHeight, radius*0.2, radius*0.2);
            

            
            rotate([0,0,0])  translate([0, 1 ,basePlateHeight]) impeller_fin(finHeight, finDepth);
            rotate([0,0,90]) translate([0, 1 ,basePlateHeight]) impeller_fin(finHeight, finDepth);
            rotate([0,0,180]) translate([0, 1 ,basePlateHeight]) impeller_fin(finHeight, finDepth);
            rotate([0,0,270]) translate([0, 1 ,basePlateHeight]) impeller_fin(finHeight, finDepth);
        }
        
        
        cylinder(height*0.8, shaft_radius*1.1, shaft_radius*0.9, $fn=100);
        translate([0,0,height*0.8]) cylinder(height*0.1, shaft_radius*0.9, 0, $fn=100);
    }
    
}

impeller_height = impellerChamberInnerHeight*0.8;
impeller_radius = impellerChamberInnerRadius*0.8;

echo("impeller height", impeller_height )
impeller(impeller_height, impeller_radius);