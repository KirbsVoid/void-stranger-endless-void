if (stopspawn == 0)
{
    var dp_amount = irandom_range(6, 8)
    for (var i = 0; i < dp_amount; i += 1)
    {
        var dp_x = irandom_range(0, 224)
        var dp_x2 = irandom_range(0, 224)
        var dp_y = irandom_range(100, 144)
        instance_create_depth(dp_x, (dp_y * i), 50, asset_get_index("obj_ev_badsoulparticle"))
        instance_create_depth(dp_x2, (dp_y * i), 50, asset_get_index("obj_ev_badsoulparticle"))
        instance_create_depth(dp_x, (dp_y * i), 50, asset_get_index("obj_ev_badsoulparticle"))
        instance_create_depth(dp_x2, (dp_y * i), 50, asset_get_index("obj_ev_badsoulparticle"))
        instance_create_depth(dp_x, (dp_y * i), 50, asset_get_index("obj_ev_badsoulparticle"))
        instance_create_depth(dp_x2, (dp_y * i), 50, asset_get_index("obj_ev_badsoulparticle"))
        instance_create_depth(dp_x, (dp_y * i), 50, asset_get_index("obj_ev_badsoulparticle"))
        instance_create_depth(dp_x2, (dp_y * i), 50, asset_get_index("obj_ev_badsoulparticle"))
    }
    alarm[1] = irandom_range(16, 32)
}
