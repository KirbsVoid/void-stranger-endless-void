// TARGET: LINENUMBER
// 8
if (b_form == 10 && Catchyoufly == 2)
{
    draw_sprite(spr_black_screen, 0, 0, 0)
    draw_sprite_ext(spr_ev_disabler_wings_trigger, image_speed, x, y, 1, 1, 0, c_white, 1)
}
if (b_form == 11 && Catchyoukillin == 2)
{
    draw_sprite(spr_black_screen, 0, 0, 0)
    draw_sprite_ext(spr_ev_disabler_sword_trigger, image_speed, x, y, 1, 1, 0, c_white, 1)
}
if (b_form == 12 && Catchyoureadin == 2)
{
    draw_sprite(spr_black_screen, 0, 0, 0)
    draw_sprite_ext(spr_ev_disabler_memory_trigger, image_speed, x, y, 1, 1, 0, c_white, 1)
}
else if (b_form == 12 && Catchyoureadin == 3)
    draw_sprite(spr_black_screen, 0, 0, 0)
