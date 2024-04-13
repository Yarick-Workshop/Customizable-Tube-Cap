roundingRadius = 2;
wallThickness = 2;

internalWidth = 17.7;
internalDepth = 7.5;
internalHeight = 7.5;

/* [Hidden] */
$fn = 32;
delta = 0.01;//to get rid of artifacts on preview


difference() 
{
    rounded_cube(width = internalWidth + 2 * wallThickness, 
                depth = internalDepth + 2 * wallThickness, 
                height = internalHeight + wallThickness, 
                rounding_radius = roundingRadius);

    translate([0, 0, internalHeight * 0.5 - delta - wallThickness]) 
        cube([internalWidth, internalDepth, internalHeight + delta], center = true);
}

module rounded_cube(width, depth, height, rounding_radius)
{
    half_width = width * 0.5;
    half_depth = depth * 0.5;
    half_height = height * 0.5;

    //TODO it should be centered optionaly with a parameter
    translate([0, 0, half_height]) 
    hull()
    {
        for (x = [-half_width + rounding_radius, half_width - rounding_radius])
        {
            for (y = [-half_depth + rounding_radius, half_depth - rounding_radius])
            {
                translate([x, y, half_height - rounding_radius])
                    sphere(r = rounding_radius);
                
                translate([x, y, -half_height])
                    cylinder(r = rounding_radius);
            }
        }
    }
}