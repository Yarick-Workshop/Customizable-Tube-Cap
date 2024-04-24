/* [Shell parameters] */
rounding_Radius = 2;
wall_Thickness = 2;

/* [Internal cube size] */
internal_Width = 17.7;
internal_Depth = 7.5;
internal_Height = 7.5;

/* [Hidden] */
$fn = 32;
delta = 0.01;//to get rid of artifacts on preview


difference() 
{
    rounded_cube(width = internal_Width + 2 * wall_Thickness, 
                depth = internal_Depth + 2 * wall_Thickness, 
                height = internal_Height + wall_Thickness, 
            rounding_Radius = rounding_Radius);
            

    translate([0, 0, internal_Height * 0.5 - delta - wall_Thickness]) 
        cube([internal_Width, internal_Depth, internal_Height + delta], center = true);
}

module rounded_cube(width, depth, height, rounding_Radius)
{
    half_width = width * 0.5;
    half_depth = depth * 0.5;
    half_height = height * 0.5;

    //TODO it should be centered optionaly with a parameter
    translate([0, 0, half_height]) 
    hull()
    {
        for (x = [-half_width + rounding_Radius, half_width - rounding_Radius])
        {
            for (y = [-half_depth + rounding_Radius, half_depth - rounding_Radius])
            {
                translate([x, y, half_height - rounding_Radius])
                    sphere(r = rounding_Radius);
                
                translate([x, y, -half_height])
                    cylinder(r = rounding_Radius);
            }
        }
    }
}