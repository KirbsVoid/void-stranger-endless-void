// TARGET: REPLACE
if keyboard_check_released(ord("T"))
{
    audio_play_sound(snd_activate, 1, false)
    audio_play_sound(snd_open, 1, false)
    ev_write_tile_data_to_csv(layer_get_id("Tiles_Wall"), "tileset_walls.csv")
    ev_write_tile_data_to_csv(layer_get_id("Tiles_Edge"), "tileset_edges.csv")
    notification_text = "Tiles_Wall, Tiles_Edge exported."
    notification_timer = 100
}
else if keyboard_check_released(ord("Y"))
{
    audio_play_sound(snd_activate, 1, false)
    audio_play_sound(snd_open, 1, false)
    ev_write_tile_data_to_csv(layer_get_id("Tiles_DIS_Wall"), "tileset_dis_walls.csv")
    ev_write_tile_data_to_csv(layer_get_id("Tiles_DIS_Edge"), "tileset_dis_edges.csv")
    notification_text = "Tiles_DIS_Wall, Tiles_DIS_Edge exported."
    notification_timer = 100
}
else if keyboard_check_released(ord("U"))
{
    audio_play_sound(snd_activate, 1, false)
    audio_play_sound(snd_open, 1, false)
    ev_write_tile_data_to_csv(layer_get_id("Tiles_Mon_Wall"), "tileset_mon_walls.csv")
    notification_text = "Tiles_Mon_Wall exported."
    notification_timer = 100
}
else if keyboard_check_released(ord("I"))
{
    audio_play_sound(snd_activate, 1, false)
    audio_play_sound(snd_open, 1, false)
    ev_write_tile_data_to_csv(layer_get_id("Tiles_EX_Wall"), "tileset_ex_walls.csv")
    notification_text = "Tiles_EX_Wall exported."
    notification_timer = 100
}
if (notification_timer > 0)
    notification_timer -= 1
if (global.brane_error == 0)
    return;
if (x < 8)
{
    x = 216
    global.brane_x -= 1
    show_debug_message("Brane x: " + string(global.brane_x))
    with (obj_orb)
        event_perform(ev_other, ev_user2)
    with (obj_enemy_bh)
        x += 224
}
if (x > 216)
{
    x = 8
    global.brane_x += 1
    show_debug_message("Brane x: " + string(global.brane_x))
    with (obj_orb)
        event_perform(ev_other, ev_user2)
    with (obj_enemy_bh)
        x -= 224
}
if (y < 8)
{
    y = 136
    global.brane_y -= 1
    show_debug_message("Brane y: " + string(global.brane_y))
    with (obj_orb)
        event_perform(ev_other, ev_user2)
    with (obj_enemy_bh)
        y += 224
}
if (y > 136)
{
    y = 8
    global.brane_y += 1
    show_debug_message("Brane y: " + string(global.brane_y))
    with (obj_orb)
        event_perform(ev_other, ev_user2)
    with (obj_enemy_bh)
        y -= 224
}
