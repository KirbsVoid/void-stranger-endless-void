path_end()
if ((e_state != 9))
{
    if ((x > c_xx))
        sprite_index = spr_r
    else if ((x < c_xx))
        sprite_index = spr_l
    else if ((y < c_yy))
        sprite_index = spr_u
    else if ((y > c_yy))
        sprite_index = spr_d
}
if instance_exists(asset_get_index("obj_player"))
{
    if ((movingphase == 1) || (movingphase == 3))
    {
        if ((asset_get_index("obj_player").x > x))
            set_e_direction = 0
        else if ((asset_get_index("obj_player").x < x))
            set_e_direction = 2
        else if ((asset_get_index("obj_player").y < y))
            set_e_direction = 1
        else if ((asset_get_index("obj_player").y > y))
            set_e_direction = 3
    }
}

