// ASCopter_openscad Version 1.8

//Frame size parameters
motorType = 20; // [13:Brushed 8.5, 12:Brushed 8, 18:1306, 20:1104, 23:1806, 27.5:2204, 27.85:2206, 27.9:2213, 28.5:2822]
quadWidth = 110; // [40:200] widened from 95 so mainBodyWidth=36 clears the quadWidth/3 cap below (with margin, not razor-edge equal)
quadLength = 70; // [40:200]
bodyDepth = 2; // [2.0:15.0]
mainBodyWidth = 36; // [25:50] widened from 30.5 so the 30.5x30.5mm FC/PDB/VTX stack holes have wall margin either side

//FC/PDB/VTX stack mount (F4V3S Plus bundle uses the 30.5x30.5mm standard hole pattern)
fcMountSpacing = 30.5;
fcMountHoleRadius = 1.6; // M3 clearance -- VERIFY against actual board holes when it arrives

//Battery strap slots (for a velcro strap looped under the battery)
//Placed in the front zone, between the front motor arms and the FC mount pad --
//VERIFY spacing against the actual 850mAh 2S battery footprint when it arrives
batteryStrapSlotWidth = 3;
batteryStrapSlotLength = 12;
batteryZoneCenterY = 13; // center of the front zone available in front of the FC pad
batteryStrapSlotSpacing = 14; // distance between the two slots along the body

fcPadMargin = 3; // keep-out margin around the 30.5x30.5 FC pad, in mm
function inFcMountPad(x,y) =
    let (cx = quadWidth/2, cy = (quadLength+2*mountRadius)/2, half = fcMountSpacing/2+fcPadMargin)
    (x > cx-half && x < cx+half && y > cy-half && y < cy+half);

batterySlotMargin = 4; // keep-out margin around each battery strap slot, in mm
function inBatterySlotZone(x,y) =
    let (cx = quadWidth/2, halfLen = batteryStrapSlotLength/2+batterySlotMargin, halfWid = batteryStrapSlotWidth/2+batterySlotMargin)
    (x > cx-halfLen && x < cx+halfLen &&
     ((y > batteryZoneCenterY-batteryStrapSlotSpacing/2-halfWid && y < batteryZoneCenterY-batteryStrapSlotSpacing/2+halfWid) ||
      (y > batteryZoneCenterY+batteryStrapSlotSpacing/2-halfWid && y < batteryZoneCenterY+batteryStrapSlotSpacing/2+halfWid)));
//Weight Saving parameters
bodyCutOutStyle = 50; //[3:Triangle, 4:Square, 5:Pentagon, 6:Hexagon, 50:circle]
bodyCutOutSize =2.5; // [1.0:10.0] 
armCutOutStyle = 6; //[4:Square, 5:Pentagon, 6:Hexagon, 50:circle]
armCutOutSize =4; // [3.0:10.0] 
//Mounting post hole
mountingPostHoleRadius = 2; //[0.5:2.5] 

// Variables calculated
bodyCutOutPitch = 2.5*bodyCutOutSize; // Pitch of main body weight savingholes
mountRadius=motorType/2;

armCutOutPitch = 2.5*armCutOutSize;

// Check for maximums 
if (mainBodyWidth > (quadWidth/3)) {
    mainBodyWidth=quadWidth/3;
}
if (armCutOutSize>mountRadius-2){
    armCutOutSize=mountRadius-2;
}
//Modules
module brushedMount (spindleRadius, outsideRadius, insideRadius, supportHeight,wireCutOut) {
    linear_extrude(height = supportHeight, center = false, convexity = 10, twist = 0)

    difference() {
         
        circle(outsideRadius , $fn=50);
        circle(insideRadius, $fn=50);        
        square([2*wireCutOut,2],center=true);   
        }
} 
module brushlessMount (spindleRadius, holeRadius, fixingRadius, fixingRadius2) {
    linear_extrude(height = bodyDepth, center = false, convexity = 10, twist = 0)
    
    
    difference() {
        circle(mountRadius+0.1, $fn=50); 
        //centre hole    
        circle(spindleRadius, $fn=50);
        // mounting holes at the fixing radius    
        translate([fixingRadius,0,0])  
        circle(holeRadius, $fn=50);      
        translate([0,fixingRadius2,0])  
        circle(holeRadius, $fn=50);       
        translate([-fixingRadius,0,0])  
        circle(holeRadius, $fn=50);      
        translate([0,-fixingRadius2,0])  
        circle(holeRadius, $fn=50);         
      }
  }

//Main Body (two halves)
//union(){

    translate([0, -(quadLength/2+mountRadius), 0])
    linear_extrude(height = bodyDepth, center = false, convexity = 10, twist = 0) 
    
    difference(){
      
        square([quadWidth, quadLength+(2*mountRadius)]); //Whole square
        translate([0,mountRadius*2,0])
        square([quadWidth/2-mainBodyWidth/2, (quadLength-(2*mountRadius))]); //left cutout
        translate([quadWidth/2+mainBodyWidth/2,mountRadius*2,0])
        square([quadWidth/2-mainBodyWidth/2, (quadLength-(2*mountRadius))]); //right cutout
        
        //Main body weight saving cutouts //left Side
        //(skips the FC/PDB/VTX mounting pad and battery strap slots so those keep a flat, solid seat)
        for (x=[quadWidth/2-mainBodyWidth/2+4.5*mountingPostHoleRadius:bodyCutOutPitch:quadWidth/2-bodyCutOutSize]){
            for (y=[mountRadius*1.5:bodyCutOutPitch:quadLength+mountRadius]) {
                if (!inFcMountPad(x,y) && !inBatterySlotZone(x,y)) {
                    translate([x,y,0])
                    circle(bodyCutOutSize, $fn=bodyCutOutStyle);
                }
             }
         }
         //Main body weight saving cutouts //right Side
        for (x=[quadWidth/2+mainBodyWidth/2-4.5*mountingPostHoleRadius:-bodyCutOutPitch:quadWidth/2-bodyCutOutSize]){
            for (y=[mountRadius*1.5:bodyCutOutPitch:quadLength+mountRadius]) {
                if (!inFcMountPad(x,y) && !inBatterySlotZone(x,y)) {
                    translate([x,y,0])
                    circle(bodyCutOutSize, $fn=bodyCutOutStyle);
                }
             }
         }
        //Mounting holes//left side
        for (y=[2*mountingPostHoleRadius:(quadLength+2*mountRadius-4*mountingPostHoleRadius)/9:quadLength+2*mountRadius-2*mountingPostHoleRadius]){
            translate([quadWidth/2-mainBodyWidth/2+mountingPostHoleRadius*1.75,y,0])
            circle(mountingPostHoleRadius, $fn=20);
        }    
       //Mounting holes//right side
        for (y=[2*mountingPostHoleRadius:(quadLength+2*mountRadius-4*mountingPostHoleRadius)/9:quadLength+2*mountRadius-2*mountingPostHoleRadius]){
            translate([quadWidth/2+mainBodyWidth/2-mountingPostHoleRadius*1.75,y,0])
            circle(mountingPostHoleRadius, $fn=20);
        }

        //FC/PDB/VTX stack mount holes (30.5x30.5mm standard pattern, centered on the plate)
        for (dx=[-fcMountSpacing/2, fcMountSpacing/2]) {
            for (dy=[-fcMountSpacing/2, fcMountSpacing/2]) {
                translate([quadWidth/2+dx, (quadLength+2*mountRadius)/2+dy, 0])
                circle(fcMountHoleRadius, $fn=20);
            }
        }

        //Battery strap slots (velcro strap loops through these, near the front of the plate)
        for (dy=[-batteryStrapSlotSpacing/2, batteryStrapSlotSpacing/2]) {
            translate([quadWidth/2, batteryZoneCenterY+dy, 0])
            hull() {
                translate([-batteryStrapSlotLength/2,0]) circle(d=batteryStrapSlotWidth, $fn=20);
                translate([batteryStrapSlotLength/2,0]) circle(d=batteryStrapSlotWidth, $fn=20);
            }
        }

        //Arm Cut Outs /left side
        for (x=[mountRadius+1+armCutOutSize:armCutOutPitch:quadWidth/2-mainBodyWidth/2-0.5*armCutOutSize]){
              translate([x,mountRadius,0])
              circle(armCutOutSize, $fn=armCutOutStyle);
              translate([x,mountRadius+quadLength,0])
              circle(armCutOutSize, $fn=armCutOutStyle);
        }
         //Arm Cut Outs /rightside
        for (x=[quadWidth-mountRadius-1-armCutOutSize:-armCutOutPitch:quadWidth/2+mainBodyWidth/2+0.5*armCutOutSize]){
            translate([x,mountRadius,0])
            circle(armCutOutSize, $fn=armCutOutStyle);
            translate([x,mountRadius+quadLength,0])
            circle(armCutOutSize, $fn=armCutOutStyle);
        }  
   
            //Add motor mount circles join to frame half   
            
            translate([0,mountRadius,0])
            circle(mountRadius-0.1, $fn=50);   
         
            translate([0,quadLength+mountRadius,0])   
            circle(mountRadius-0.1, $fn=50);  
        
            translate([quadWidth,mountRadius,0])
            circle(mountRadius-0.1, $fn=50);   
        
            translate([quadWidth,quadLength+mountRadius,0])   
            circle(mountRadius-0.1, $fn=50);          
    
   } //end of difference


//Motor fixings 

translate([0, -(quadLength/2), 0])

for (x=[0:quadWidth:quadWidth]){

    for (y=[quadLength:-quadLength:-quadLength/2]){
        
        if(motorType==13){    
           linear_extrude(height = bodyDepth, center = false, convexity = 10, twist = 0)    
            translate([x, y, 0])
            difference(){
                circle(mountRadius+0.1, $fn=50);
                circle(mountRadius-3, $fn=50); 
            }   
            translate([x, y, bodyDepth])
            brushedMount(3.5,mountRadius-0.5, 4.5,8,8);
        }    
        if(motorType==12){    
           linear_extrude(height = bodyDepth, center = false, convexity = 10, twist = 0)    
            translate([x, y, 0])
            difference(){
                circle(mountRadius, $fn=50);
                circle(mountRadius-3, $fn=50); 
            }              
            translate([x, y, bodyDepth])
            brushedMount(3.5,mountRadius, 4.15,8,8);
        }   
    //motor holes for brushless motors
        if(motorType==18){                      
            translate([x, y, 0])
            brushlessMount (2.5,1.2,6,6);
        }        
        if(motorType==20){                 
            translate([x, y, 0])
            brushlessMount (1.2,1.2,4.5,4.5);
        }

        if(motorType==23){                      
            translate([x, y, 0])
            brushlessMount (2.5,1.2,6,8);
        }
        if(motorType==27.5){                      
            translate([x, y, 0])
            brushlessMount (3.5,1.75,8,9.5);
        }
        if(motorType==27.85){                      
            translate([x, y, 0])
            brushlessMount (4,1.3,9.5,9.5);
        }        
       if(motorType==27.9){                      
            translate([x, y, 0])
            brushlessMount (3.5,1.75,8,9.5);
        }   
       if(motorType==28.5){                      
            translate([x, y, 0])
            brushlessMount (3.5,1.65,11,11);
        }
    } 
  } 
  
//}//end of union  
