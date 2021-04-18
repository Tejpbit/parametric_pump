use <threads.scad>
include <dimensions.scad>

module dc_chamber_profile() {
    
    polygon(points=[
      [innerRadius,0],
      [dcMotorChamberOuterRadius,0],
      [dcMotorChamberOuterRadius, height],
      [wireHoleRadius ,height],
      [wireHoleRadius ,height-wallThickness],
      [innerRadius ,height-wallThickness],
      [innerRadius ,height-wallThickness-10],
      [innerRadius-1.5 ,height-wallThickness-10-1.5],
      [innerRadius ,height-wallThickness-10-1.5],
    ]);
}



module dc_chamber() {
    
    union() {
        rotate_extrude(angle=rotate_extrude_angle) dc_chamber_profile();
        metric_thread(dcMotorChamberOuterRadius*2+4.3, 3, threadLength, hollow=true);
    }
}

dc_chamber();


