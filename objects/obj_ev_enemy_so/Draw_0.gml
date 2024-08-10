var i_imageframe = image_speed
var enemyturning = asset_get_index("scr_can_enemy_act")
if (e_state == 0 || script_execute(enemyturning) || e_state == 6 || e_state == 15)
{
    if ((global.pause == 0))
    {
        var iframes = sprite_get_number(sprite_index);
        var script_id = asset_get_index("scr_music_strobe_integer");
        i_imageframe = script_execute(script_id, iframes);
        image_speed = i_imageframe;
    }
}
draw_sprite(sprite_index, i_imageframe, x, y)
