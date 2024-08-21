if global.pause
    return;
if (flicker == false)
{
    sprite_index = asset_get_index("spr_ev_tpfloor")
    if (shine_loop == 1)
    {
        if (shine_speed != 3.9)
            shine_speed += 0.1
        else if (shine_speed >= 3.9)
        {
            shine_speed = 0.9
            shine_loop = 0
        }
    }
    else if (shine_loop == 2)
    {
        if (shine_speed != 0)
            shine_speed -= 0.1
        else if (shine_speed <= 0)
        {
            shine_speed = 3
            shine_loop = 0
        }
    }
}
else if (flicker == true)
{
    sprite_index = asset_get_index("spr_ev_tpfloor_flicker")
    if (counter == 0)
        shine_speed = 0.75
    if (counter != 20)
    {
        shine_speed += 0.25
        counter++
    }
    else
    {
        shine_speed = 0.9
        shine_loop = 0
        flicker = false
        counter = 0
    }
}
