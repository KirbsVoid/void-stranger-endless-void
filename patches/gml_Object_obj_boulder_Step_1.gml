// TARGET: REPLACE
if (b_form == 7)
{
    if (global.pause == true)
        return;
    if instance_exists(obj_player)
    {
        player_x = obj_player.x
        player_y = obj_player.y
    }
    with (obj_player)
    {
        if (state == (23 << 0))
        {
            with (obj_boulder)
            {
                if (b_form == 7)
                    mon_grazeperiod = true
            }
        }
        else
        {
            with (obj_boulder)
            {
                if (b_form == 7)
                    mon_grazeperiod = false
            }
        }
    }
    if instance_exists(obj_ev_tpfloor)
    {
        with (obj_ev_tpfloor)
        {
            if (buffer >= 1)
                other.mon_grazeperiod = true
        }
    }
    if (o_state == (0 << 0))
    {
        if (shaken == false)
            image_speed = 0
    }
    else if (o_state == (9 << 0))
    {
        counter += 1
        if (counter > 3)
            image_speed += 0.5
        if (counter >= 60)
        {
            with (obj_mon_shock)
                instance_destroy()
            with (obj_player)
            {
                counter = 0
                aattack = false
                sattack = false
                didyahite = true
                state = (6 << 0)
                deathtimer = 90
            }
            o_state = (0 << 0)
            counter = 0
        }
    }
    if (mon_glare == false && o_state != (5 << 0))
    {
        if ((!(collision_line(x, y, player_x, y, obj_obstacle_parent, false, true))) && (!(collision_line(x, y, player_x, y, obj_enemy_parent, false, true))) && (!(collision_line(x, y, player_x, y, obj_npc_parent, false, true))) && collision_line(x, y, player_x, y, obj_player, false, true) && mon_grazeperiod == false)
        {
            alarm[11] = 3
            o_state = (9 << 0)
            with (obj_player)
            {
                regain_control = false
                if (state != (25 << 0))
                    state = (25 << 0)
            }
            mon_glare = true
        }
        else if ((!(collision_line(x, y, x, player_y, obj_obstacle_parent, false, true))) && (!(collision_line(x, y, x, player_y, obj_enemy_parent, false, true))) && (!(collision_line(x, y, x, player_y, obj_npc_parent, false, true))) && collision_line(x, y, x, player_y, obj_player, false, true) && mon_grazeperiod == false)
        {
            alarm[11] = 3
            o_state = (9 << 0)
            with (obj_player)
            {
                regain_control = false
                if (state != (25 << 0))
                    state = (25 << 0)
            }
            mon_glare = true
        }
    }
}