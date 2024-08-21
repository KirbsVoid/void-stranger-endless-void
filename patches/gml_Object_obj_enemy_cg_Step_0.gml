// TARGET: REPLACE
stun = 0
if global.pause
    return;
if instance_exists(obj_player)
{
    player_x = obj_player.x
    player_y = obj_player.y
}
if (set_e_direction >= 4)
    set_e_direction = 0
if (e_state != (9 << 0) && e_state != (12 << 0))
    image_speed += 0.04
if (rush == true)
{
    switch set_e_direction
    {
        case 0:
            e_direction = 0
            sprite_index = spr_r
            break
        case 1:
            e_direction = 90
            sprite_index = spr_u
            break
        case 2:
            e_direction = 180
            sprite_index = spr_l
            break
        case 3:
            e_direction = 270
            sprite_index = spr_d
            break
    }

}
e_move_x = lengthdir_x(e_spd, e_direction)
e_move_y = lengthdir_y(e_spd, e_direction)
if (e_state == (0 << 0))
{
    if (rush == false)
        sprite_index = spr_cg_idle
    if place_meeting(x, y, obj_pit)
    {
        e_state = (12 << 0)
        cycle = false
    }
    if (place_meeting(x, y, obj_enemy_parent) || place_meeting(x, y, obj_npc_talk) || place_meeting(x, y, obj_boulder))
    {
        if audio_is_playing(snd_enemy_explosion)
            audio_stop_sound(snd_enemy_explosion)
        audio_play_sound(snd_enemy_explosion, 1, false)
        scr_cc_scorevalue(enemy_score, false)
        e_state = (11 << 0)
    }
}
else if scr_can_enemy_act()
{
    rush_state = 0
    if place_meeting(x, y, obj_pit)
    {
        e_state = (12 << 0)
        cycle = false
    }
    if (cycle == true)
    {
        if (rush == false)
        {
            if ((!(collision_line(x, y, player_x, y, obj_obstacle_parent, false, true))) && (!(collision_line(x, y, player_x, y, obj_enemy_parent, false, true))) && (!(collision_line(x, y, player_x, y, obj_npc_parent, false, true))) && collision_line(x, y, player_x, y, obj_player, false, true))
            {
                if (x < player_x)
                {
                    if (!(place_meeting((x + 16), y, obj_pit)))
                    {
                        set_e_direction = 0
                        e_state = (6 << 0)
                        rush = true
                    }
                    else if place_meeting((x + 16), y, obj_player)
                    {
                        set_e_direction = 0
                        e_state = (6 << 0)
                        rush = true
                    }
                    else
                        e_state = (0 << 0)
                }
                else if (x > player_x)
                {
                    if (!(place_meeting((x - 16), y, obj_pit)))
                    {
                        set_e_direction = 2
                        e_state = (6 << 0)
                        rush = true
                    }
                    else if place_meeting((x - 16), y, obj_player)
                    {
                        set_e_direction = 2
                        e_state = (6 << 0)
                        rush = true
                    }
                    else
                        e_state = (0 << 0)
                }
            }
            else if ((!(collision_line(x, y, x, player_y, obj_obstacle_parent, false, true))) && (!(collision_line(x, y, x, player_y, obj_enemy_parent, false, true))) && (!(collision_line(x, y, x, player_y, obj_npc_parent, false, true))) && collision_line(x, y, x, player_y, obj_player, false, true))
            {
                if (y < player_y)
                {
                    if (!(place_meeting(x, (y + 16), obj_pit)))
                    {
                        set_e_direction = 3
                        e_state = (6 << 0)
                        rush = true
                    }
                    else if place_meeting(x, (y + 16), obj_player)
                    {
                        set_e_direction = 3
                        e_state = (6 << 0)
                        rush = true
                    }
                    else
                        e_state = (0 << 0)
                }
                else if (y > player_y)
                {
                    if (!(place_meeting(x, (y - 16), obj_pit)))
                    {
                        set_e_direction = 1
                        e_state = (6 << 0)
                        rush = true
                    }
                    else if place_meeting(x, (y - 16), obj_player)
                    {
                        set_e_direction = 1
                        e_state = (6 << 0)
                        rush = true
                    }
                    else
                        e_state = (0 << 0)
                }
            }
            else
                e_state = (0 << 0)
        }
        else if ((!(place_meeting((x + e_move_x), (y + e_move_y), obj_obstacle_parent))) && (!(place_meeting((x + e_move_x), (y + e_move_y), obj_pit))) && (!(place_meeting((x + e_move_x), (y + e_move_y), obj_enemy_parent))))
            e_state = (6 << 0)
        else if place_meeting((x + e_move_x), (y + e_move_y), obj_player)
        {
            with (instance_place((x + e_move_x), (y + e_move_y), obj_player))
                state = (6 << 0)
            e_state = (9 << 0)
        }
        else
        {
            e_state = (0 << 0)
            rush = false
            rush_state = 1
        }
    }
    else
        e_state = (0 << 0)
}
else if (e_state == (6 << 0))
{
    if place_meeting((x + e_move_x), (y + e_move_y), obj_player)
    {
        with (instance_place((x + e_move_x), (y + e_move_y), obj_player))
            state = (6 << 0)
        e_state = (9 << 0)
    }
    else if place_meeting((x + e_move_x), (y + e_move_y), obj_obstacle_parent)
    {
        e_state = (0 << 0)
        rush = false
        rush_state = 1
    }
    else if place_meeting((x + e_move_x), (y + e_move_y), obj_npc_parent)
    {
        with (instance_place((x + e_move_x), (y + e_move_y), obj_npc_parent))
            n_state = (3 << 0)
        e_state = (9 << 0)
    }
    else if place_meeting((x + e_move_x), (y + e_move_y), obj_pit)
    {
        e_state = (0 << 0)
        rush = false
        rush_state = 1
    }
    else
    {
        x += e_move_x
        y += e_move_y
        e_state = (0 << 0)
    }
}
else if (e_state == (9 << 0))
{
    image_speed += 0.2
    if place_meeting((x + 16), y, obj_player)
        set_e_direction = 0
    else if place_meeting((x - 16), y, obj_player)
        set_e_direction = 2
    else if place_meeting(x, (y + 16), obj_player)
        set_e_direction = 3
    else if place_meeting(x, (y - 16), obj_player)
        set_e_direction = 1
    if place_meeting((x + 16), y, obj_npc_talk)
        set_e_direction = 0
    else if place_meeting((x - 16), y, obj_npc_talk)
        set_e_direction = 2
    else if place_meeting(x, (y + 16), obj_npc_talk)
        set_e_direction = 3
    else if place_meeting(x, (y - 16), obj_npc_talk)
        set_e_direction = 1
    switch set_e_direction
    {
        case 0:
            e_direction = 0
            sprite_index = spr_r
            break
        case 1:
            e_direction = 90
            sprite_index = spr_u
            break
        case 2:
            e_direction = 180
            sprite_index = spr_l
            break
        case 3:
            e_direction = 270
            sprite_index = spr_d
            break
    }

    counter++
    if (counter >= 60)
    {
        rush_state = 0
        e_state = (0 << 0)
        counter = 0
    }
}
else if (e_state == (11 << 0))
{
    event_perform(ev_other, ev_user4)
    instance_create_depth(x, y, 10, obj_explosion_001)
    instance_create_depth(x, y, 5, obj_bloodtrail_fx)
    rush_state = 0
    instance_destroy()
}
else
{
    e_state = (0 << 0)
    rush = false
    rush_state = 1
    stun = 1
}
if (e_state == (12 << 0))
{
    var ifalls = e_fall_sprite
    var ifallings = e_falling_sprite
    var create_fall_effect = instance_create_layer(x, y, "Instances", obj_fall)
    with (create_fall_effect)
    {
        sprite_index = ifalls
        fall_sprite = ifallings
    }
    rush_state = 0
    scr_cc_scorevalue(enemy_score, false)
    instance_destroy()
}
