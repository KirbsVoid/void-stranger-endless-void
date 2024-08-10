if global.pause
    return;
if activated
{
    if (place_meeting(x, y, asset_get_index("obj_player")) && player_hit == false)
    {
        with (585)
            state = (6 << 0)
        player_hit = true
    }
    if place_meeting(x, y, asset_get_index("obj_boulder"))
    {
        var iboulder = instance_place(x, y, asset_get_index("obj_boulder"))
        with (iboulder)
        {
            instance_create_layer(x, y, "Effects", asset_get_index("obj_explosion_002"))
            if (!audio_is_playing(asset_get_index("snd_explosion")))
			{
			    var soundscript = asset_get_index("scr_play_sound")
                script_execute(soundscript, asset_get_index("snd_explosion"), 1, false)
			}
            instance_destroy()
        }
    }
    if place_meeting(x, y, asset_get_index("obj_enemy_parent"))
    {
        var ienemy = instance_place(x, y, asset_get_index("obj_enemy_parent"))
        with (ienemy)
        {
            if (!audio_is_playing(asset_get_index("snd_enemy_explosion")))
                audio_play_sound(asset_get_index("snd_enemy_explosion"), 1, false)
            e_state = (11 << 0)
        }
    }
    if place_meeting(x, y, asset_get_index("obj_npc_talk"))
    {
        var inpc = instance_place(x, y, asset_get_index("obj_npc_talk"))
        with (inpc)
        {
            instance_create_layer(x, y, "Effects", asset_get_index("obj_explosion_002"))
            if (!audio_is_playing(asset_get_index("snd_enemy_explosion")))
                audio_play_sound(asset_get_index("snd_enemy_explosion"), 1, false)
            instance_destroy()
        }
    }
    if ((shadedie == 0))
    {
        if place_meeting(x, y, asset_get_index("obj_enemy_cr"))
        {
            var shade = instance_place(x, y, asset_get_index("obj_enemy_cr"))
            with (shade)
                n_state = (3 << 0)
            shadedie = 1
        }
        if place_meeting(x, y, asset_get_index("obj_enemy_cr_segment"))
        {
            var shadesegment = instance_place(x, y, asset_get_index("obj_enemy_cr_segment"))
            with (shadesegment)
                n_state = (3 << 0)
            shadedie = 1
        }
    }
}
if activated
    image_index = 1
else
    image_index = 0

