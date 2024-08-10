dust_counter++
if (dust_counter == dust_limit)
    event_perform(ev_other, ev_user1)
else if (control_counter != 0)
    control_counter -= 0.5
if (souleye == 0)
{
    if (draw_dust == true)
    {
        if (image_index < 22)
            image_speed += (is_add * 0.1)
        else
        {
            image_index = 22
            counter++
            if (counter == counter_limit)
                instance_destroy()
        }
    }
    if (souleye == 0)
    {
        if (y_dir == 0)
            y -= (0.2 * y_speedup)
        else if (y_dir == 1)
            y += (0.2 * y_speedup)
    }
    if (control_dust == false)
    {
        t = (t + increment) % 360
        shift = amplitude * global.sintable[t]
        xx += vspeed
        x = xx + shift
        floor(amplitude)
    }
}
if (souleye == 1 || souleye == 2)
{
    if (image_index != 8)
    {
        if (image_index > 8)
            image_index--
        else
            image_index++
        if (souleye == 1)
            image_speed += 0.1
    }
    else
    {
        sprite_index = asset_get_index("spr_ev_soulbadglow_eye")
        if (souleye == 1)
            image_index = 3
    }
}
if (soulfollower == 1)
{
    souleye = 2
    image_speed += 1
    var move_speed = 2
    move_towards_point(asset_get_index("obj_player").x, asset_get_index("obj_player").y, move_speed)
}
