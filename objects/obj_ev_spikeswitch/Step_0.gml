if global.pause
    return;
if (!pressed)
{
    if (place_meeting(x, y, asset_get_index("obj_enemy_parent")) || place_meeting(x, y, asset_get_index("obj_obstacle_parent")) || place_meeting(x, y, asset_get_index("obj_npc_parent")) || place_meeting(x, y, asset_get_index("obj_npc_talk")) || place_meeting(x, y, asset_get_index("obj_player")))
    {
        counter += 2
        if (counter > 1)
        {
            audio_play_sound(asset_get_index("snd_sword_stab"), 1, false)
            audio_play_sound(asset_get_index("snd_activate"), 0.5, false)
            counter = 0
            pressed = true
        }
    }
}
else if ((!(place_meeting(x, y, asset_get_index("obj_enemy_parent")))) && (!(place_meeting(x, y, asset_get_index("obj_obstacle_parent")))) && (!(place_meeting(x, y, asset_get_index("obj_npc_parent")))) && (!(place_meeting(x, y, asset_get_index("obj_npc_talk")))) && (!(place_meeting(x, y, asset_get_index("obj_player")))))
{
    counter++
    if (counter > 1)
    {
        audio_play_sound(asset_get_index("snd_activate"), 0.5, false, 10, 0, 0.8)
        counter = 0
        pressed = false
    }
}
if pressed
{
    image_index = 1
	var spikesid = asset_get_index("obj_ev_floorspikes")
    with (spikesid)
    {
        if (switchid == other.switchid)
            activated = true
    }
}
else if !pressed
{
    image_index = 0
	var spikesid = asset_get_index("obj_ev_floorspikes")
    with (spikesid)
    {
        if (switchid == other.switchid)
            activated = false
    }
}

