// Measured dimensions
drawingFile = "TuningWhistles_2026-02-11_03.dxf";
declaredLength = 65;

// Adjustable dimensions
bodyThickness = 10;
shellThickness = 0.75;

// Calculated dimensions
inchesToMillimeters = 1/25.4;
millimetersToInches = 25.4;
hexagonOutToInRatio = 0.866;
hexagonInToOutRatio = 1 / hexagonOutToInRatio;


// Visibility variables
whistleBodyVis = 1;
plugVis = 0;
accessoryBody01Vis = 0;
accessoryBody02Vis = 0;
$fn = 120;
//$vpr = [55, 0, 25];
//$vpd = 100;
//$vpt = [0,0,0];
cutawayView = 0;
alphaValue = 1.0;


if(plugVis){
    color("SteelBlue", alphaValue){
        translate([0,0,-shellThickness]){
            linear_extrude(height = bodyThickness){
                import(drawingFile, layer = "plug", convexity = 20);
            }
        }
    }
}

if(whistleBodyVis){
    color("Orchid", alphaValue){
        difference(){
            linear_extrude(height = bodyThickness){
                import(drawingFile, layer = "body", convexity = 20);
            }
        }
    }
    color("CornflowerBlue", alphaValue){
        if(!cutawayView){
            translate([0,0,(bodyThickness)]){
                linear_extrude(height = shellThickness){
                    import(drawingFile, layer = "outline", convexity = 20);
                }
            }
        }
    }
    color("CornflowerBlue", alphaValue){
        translate([0,0,-shellThickness/1]){
            linear_extrude(height = shellThickness){
                import(drawingFile, layer = "outline", convexity = 20);
            }
        }
    }
}

if(1){
    color("LightCyan", alphaValue){
        translate([0,0,bodyThickness + shellThickness]){
            linear_extrude(height = shellThickness){
                import(drawingFile, layer = "text", convexity = 20);
            }
        }
    }
}



if(accessoryBody02Vis){
    color("LightCyan", alphaValue){
        translate([0,0,-shellThickness]){
            linear_extrude(height = bodyThickness + shellThickness*2){
                import(drawingFile, layer = "AccessoryTab02", convexity = 20);
            }
        }
    }
}