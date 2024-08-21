// TARGET: REPLACE
if (set_p_direction == 3 && float == true && player_golden == false)
{
    draw_sprite(spr_wings, wing_speed, (x + xslide + 8), (y + yslide))
    draw_sprite_ext(spr_wings, wing_speed, (x + xslide - 8), (y + yslide), -1, 1, 0, c_white, 1)
}
var i_imageframe = image_speed
if (state == (0 << 0) || state == (11 << 0) || state == (10 << 0))
{
    if (global.pause == false)
    {
        i_imageframe = scr_music_strobe_integer(2)
        image_speed = i_imageframe
    }
}
if (draw_infinity == 1)
{
    for (var i = 0; i < 16; i += 1)
    {
        var idir = inf_dir
        var idir2 = inf_dir + 180
        var idis = inf_dis
        var ipercent = i / 16
        idis = lerp(0, idis, ipercent)
        var ixx = lengthdir_x(idis, idir)
        var iyy = lengthdir_y(idis, idir)
        draw_sprite(sprite_index, i_imageframe, (x + ixx), (y + iyy))
        if (aattack == true)
            draw_sprite_ext(voidrod_index, set_p_direction, (x + p_move_x + s_extend_x + ixx), (y + p_move_y + s_extend_y + iyy), 1, 1, 0, c_white, 1)
    }
}
draw_sprite(sprite_index, i_imageframe, (x + xslide), (y + yslide))
if (draw_infinity == 1)
{
    for (i = 0; i < 16; i += 1)
    {
        idir2 = inf_dir + 180
        idis = inf_dis
        ipercent = i / 16
        idis = lerp(0, idis, ipercent)
        var ixx2 = lengthdir_x(idis, idir2)
        var iyy2 = lengthdir_y(idis, idir2)
        draw_sprite(sprite_index, i_imageframe, (x + ixx2), (y + iyy2))
        if (aattack == true)
            draw_sprite_ext(voidrod_index, set_p_direction, (x + p_move_x + s_extend_x + ixx2), (y + p_move_y + s_extend_y + iyy2), 1, 1, 0, c_white, 1)
    }
}
if (swipe_state == 1)
    draw_sprite_ext(swipe_index, swipe_speed, (x + sw_x), (y + sw_y), swipe_xswap, swipe_yswap, swipe_dir, c_white, 1)
if (aattack == true)
    draw_sprite_ext(voidrod_index, set_p_direction, (x + p_move_x + s_extend_x), (y + p_move_y + s_extend_y), 1, 1, 0, c_white, 1)
if (sattack == true)
    draw_sprite_ext(spr_blade, set_p_direction, (x + p_move_x + s_extend_x), (y + p_move_y + s_extend_y), 1, 1, 0, c_white, 1)
if (state == (18 << 0))
    draw_sprite(sprite_index, image_speed, (x + xslide), (y + yslide))
if (set_p_direction == 1 && float == true && player_golden == false)
{
    draw_sprite(spr_wings, wing_speed, (x + xslide + 8), (y + yslide))
    draw_sprite_ext(spr_wings, wing_speed, (x + xslide - 8), (y + yslide), -1, 1, 0, c_white, 1)
}
if (set_p_direction == 2 && float == true && player_golden == false)
    draw_sprite(spr_wings, wing_speed, (x + xslide + 8), (y + yslide))
if (set_p_direction == 0 && float == true && player_golden == false)
    draw_sprite_ext(spr_wings, wing_speed, (x + xslide - 8), (y + yslide), -1, 1, 0, c_white, 1)
if (voidrod_get == true)
{
    if (ds_grid_get(obj_inventory.ds_player_info, 10, 2) != 999)
        draw_sprite(spr_voidrod_icon, 1, (x - 8), (y - 18))
    else
        draw_sprite(spr_voidrod_icon2, 1, (x - 8), (y - 18))
}
if (global.control == 1)
    draw_sprite(target_index, target_speed, mouse_x, mouse_y)
if (notification_timer > 0)
{
    draw_set_font(notificationfont)
    draw_set_halign(fa_center)
    draw_set_valign(fa_middle)
    var text_width = string_width(notification_text)
    var text_height = string_height(notification_text)
    var box_padding_x = 5
    var box_padding_y = 1
    var box_x = room_width / 2 - text_width / 2 - box_padding_x
    var box_y = room_height / 8 - text_height / 2 - box_padding_y
    var box_width = text_width + box_padding_x * 2
    var box_height = text_height + box_padding_y * 2
    draw_set_color(c_black)
    draw_set_alpha(0.5)
    draw_rectangle(box_x, box_y, (box_x + box_width), (box_y + box_height), false)
    draw_set_alpha(1)
    draw_text_color((room_width / 2 + 1), (room_height / 8 + 1), notification_text, c_black, c_black, c_black, c_black, 1)
    draw_set_color(c_white)
    draw_text((room_width / 2), (room_height / 8), notification_text)
    draw_set_halign(fa_left)
    draw_set_valign(fa_top)
}
