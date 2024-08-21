if (instance_number(asset_get_index("obj_ev_tpfloor")) < 2)
    return;
with (585)
{
    other.stored_tiles = string_length(tile_str) - 2
    if (enemyturn_countdown == 1)
        other.buffer = 4
}
var tplistx = array_create((instance_number(asset_get_index("obj_ev_tpfloor")) + stored_tiles), -8)
var tplisty = array_create((instance_number(asset_get_index("obj_ev_tpfloor")) + stored_tiles), -8)
for (var i = 0; i < instance_number(asset_get_index("obj_ev_tpfloor")); i++)
{
    var itpfloor = instance_find(asset_get_index("obj_ev_tpfloor"), i)
    with (itpfloor)
    {
        tplistx[tpid] = x
        tplisty[tpid] = y
    }
}
can_act = 0
if (buffer > 0)
{
    buffer--
    if (buffer <= 0)
        can_act = 1
}
var found = 0
var itpid = tpid - 1
while (found != 1)
{
    if (itpid == -1)
        itpid = array_length(tplistx) - 1
    search_x = tplistx[itpid]
    search_y = tplisty[itpid]
    if place_meeting(search_x, search_y, asset_get_index("obj_ev_tpfloor"))
    {
        var previous_tp = instance_place(search_x, search_y, asset_get_index("obj_ev_tpfloor"))
        found = 1
    }
    itpid--
}
found = 0
itpid = tpid + 1
while (found != 1)
{
    if (itpid == array_length(tplistx))
        itpid = 0
    search_x = tplistx[itpid]
    search_y = tplisty[itpid]
    if place_meeting(search_x, search_y, asset_get_index("obj_ev_tpfloor"))
    {
        var next_tp = instance_place(search_x, search_y, asset_get_index("obj_ev_tpfloor"))
        found = 1
    }
    itpid++
}
if (buffer == 1)
{
    incoming_boulder = instance_place(previous_tp.x, previous_tp.y, asset_get_index("obj_boulder"))
    incoming_player = instance_place(previous_tp.x, previous_tp.y, asset_get_index("obj_player"))
    incoming_enemy = instance_place(previous_tp.x, previous_tp.y, asset_get_index("obj_enemy_parent"))
}
if (distance_to_object(asset_get_index("obj_player")) < 17)
    shine_loop = 1
else if (previous_tp.shine_loop == 1)
    shine_loop = 2
if (can_act == 0)
    return;
if (place_meeting(x, y, asset_get_index("obj_player")) && asset_get_index("obj_player").state != (6 << 0) && asset_get_index("obj_player").state != (15 << 0))
{
    if (incoming_player == -4)
    {
        if (!audio_is_playing(asset_get_index("snd_ev_tp")))
                audio_play_sound(asset_get_index("snd_ev_tp"), 1, false)
	flicker = true
        counter = 0
        with (585)
        {
            x = next_tp.x
            y = next_tp.y
        }
	for (i = -16; i < 17; i += 32)
        {
            var close_enemy = instance_place((next_tp.x + i), next_tp.y, asset_get_index("obj_enemy_co"))
            if (close_enemy != noone)
            {
                with (close_enemy)
                    e_state = (9 << 0)
                with (585)
                    state = (6 << 0)
            }
            else
            {
                close_enemy = instance_place((next_tp.x + i), next_tp.y, asset_get_index("obj_enemy_cs"))
                if (close_enemy != noone)
                {
                    with (close_enemy)
                        e_state = (9 << 0)
                    with (585)
                        state = (6 << 0)
                }
                else
                {
                    close_enemy = instance_place((next_tp.x + i), next_tp.y, asset_get_index("obj_enemy_cg"))
                    if (close_enemy != noone && close_enemy.stun == 1)
                    {
                        with (close_enemy)
                            e_state = (9 << 0)
                        with (585)
                            state = (6 << 0)
                    }
                }
            }
            close_enemy = instance_place(next_tp.x, (next_tp.y + i), asset_get_index("obj_enemy_co"))
            if (close_enemy != noone)
            {
                with (close_enemy)
                    e_state = (9 << 0)
                with (585)
                    state = (6 << 0)
            }
            else
            {
                close_enemy = instance_place(next_tp.x, (next_tp.y + i), asset_get_index("obj_enemy_cs"))
                if (close_enemy != noone)
                {
                    with (close_enemy)
                        e_state = (9 << 0)
                    with (585)
                        state = (6 << 0)
                }
                else
                {
                    close_enemy = instance_place(next_tp.x, (next_tp.y + i), asset_get_index("obj_enemy_cg"))
                    if (close_enemy != noone && close_enemy.stun == 1)
                    {
                        with (close_enemy)
                            e_state = (9 << 0)
                        with (585)
                            state = (6 << 0)
                    }
                }
            }
        }
    }
}
var list = ds_list_create()
var num = instance_place_list(x, y, asset_get_index("obj_boulder"), list, false)
if (num > 0)
{
    for (i = 0; i < num; i++)
    {
        var iboulder = ds_list_find_value(list, i)
        if (incoming_boulder != iboulder)
        {
            if (!audio_is_playing(asset_get_index("snd_ev_tp")))
                audio_play_sound(asset_get_index("snd_ev_tp"), 1, false)
	    flicker = true
            counter = 0
            with (iboulder)
            {
                x = next_tp.x
                y = next_tp.y
               
            }
        }
    }
}
list = ds_list_create()
num = instance_place_list(x, y, asset_get_index("obj_enemy_parent"), list, false)
if (num > 0)
{
    for (i = 0; i < num; i++)
    {
        var ienemy = ds_list_find_value(list, i)
        if (incoming_enemy != ienemy)
        {
            if (!audio_is_playing(asset_get_index("snd_ev_tp")))
                audio_play_sound(asset_get_index("snd_ev_tp"), 1, false)
	    flicker = true
            counter = 0
            with (ienemy)
            {
                x = next_tp.x
                y = next_tp.y
            }
        }
    }
}
