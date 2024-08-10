if (stopspawn == 0)
{
    counter++
    if (counter >= counter_limit)
    {
        var dp_amount = irandom_range(6, 8)
        for (var i = 0; i < dp_amount; i += 1)
        {
            var dp_x = irandom_range(0, 224)
            var dp_x2 = irandom_range(0, 224)
            var dp_y = irandom_range(50, 144)
            instance_create_depth(dp_x, (dp_y * i), 50, asset_get_index("obj_ev_badsoulparticle"))
            instance_create_depth(dp_x2, (dp_y * i), 50, asset_get_index("obj_ev_badsoulparticle"))
            instance_create_depth(dp_x, (dp_y * i), 50, asset_get_index("obj_ev_badsoulparticle"))
            instance_create_depth(dp_x2, (dp_y * i), 50, asset_get_index("obj_ev_badsoulparticle"))
            instance_create_depth(dp_x, (dp_y * i), 50, asset_get_index("obj_ev_badsoulparticle"))
            instance_create_depth(dp_x2, (dp_y * i), 50, asset_get_index("obj_ev_badsoulparticle"))
            instance_create_depth(dp_x, (dp_y * i), 50, asset_get_index("obj_ev_badsoulparticle"))
            instance_create_depth(dp_x2, (dp_y * i), 50, asset_get_index("obj_ev_badsoulparticle"))
        }
        counter_limit = irandom_range(16, 32)
        counter = 0
    }
}
if (badsoultimer > 0)
    badsoultimer--
if (badsoultimer == 100)
{
    stopspawn = 1
    counter_limit = 9999999
    audio_play_sound(asset_get_index("snd_unknown"), 5, false, 10)
	var particu = asset_get_index("obj_ev_badsoulparticle")
    with (particu)
        souleye = 1
}
else if (badsoultimer == 1)
{
    var particu = asset_get_index("obj_ev_badsoulparticle")
    with (particu)
        soulfollower = 1
    moreeye = 1
}
if (moreeye == 1)
    counterdos++
if (counterdos == 3)
{
    dp_amount = irandom_range(6, 8)
    for (i = 0; i < dp_amount; i += 1)
    {
        dp_x = irandom_range(0, 224)
        dp_x2 = irandom_range(0, 224)
        dp_y = irandom_range(50, 144)
        var ojito = instance_create_depth(dp_x, (dp_y * i), 50, asset_get_index("obj_ev_badsoulparticle"))
    }
}
if (counterdos == 5)
{
    var particu = asset_get_index("obj_ev_badsoulparticle")
    with (particu)
    {
        souleye = 2
        soulfollower = 1
    }
    counterdos = 0
}

