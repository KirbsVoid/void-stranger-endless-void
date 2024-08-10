if global.pause
    return;
if instance_exists(asset_get_index("obj_player"))
{
    player_x = asset_get_index("obj_player").x
    player_y = asset_get_index("obj_player").y
}
if ((set_e_direction > 3))
    set_e_direction = 0
switch set_e_direction
{
    case 0:
        e_direction = 0
        if ((movingphase == 3))
            spr_idle = asset_get_index("spr_ev_un_soldier_r_gun")
        else
            spr_idle = spr_idle_r
        break
    case 1:
        e_direction = 90
        if ((movingphase == 3))
            spr_idle = asset_get_index("spr_un_soldier_u_gun")
        else
            spr_idle = spr_idle_u
        break
    case 2:
        e_direction = 180
        if ((movingphase == 3))
            spr_idle = asset_get_index("spr_ev_un_soldier_l_gun")
        else
            spr_idle = spr_idle_l
        break
    case 3:
        e_direction = 270
        if ((movingphase == 3))
            spr_idle = asset_get_index("spr_ev_un_soldier_d_gun")
        else
            spr_idle = spr_idle_d
        break
}

e_move_x = lengthdir_x(e_spd, e_direction)
e_move_y = lengthdir_y(e_spd, e_direction)
var enemyturning = asset_get_index("scr_can_enemy_act")
if ((e_state != (9 << 0)) && (e_state != (12 << 0)))
    image_speed += 0.080000000000000002
if ((e_state == (0 << 0)))
{
    c_xx = x
    c_yy = y
    if ((c_xx == p_xx) && (c_yy == p_yy))
        sprite_index = spr_idle
    if place_meeting(x, y, asset_get_index("obj_pit"))
    {
        e_state = (12 << 0)
        cycle = 0
    }
    if (place_meeting(x, y, asset_get_index("obj_enemy_parent")) || place_meeting(x, y, asset_get_index("obj_boulder")) || place_meeting(x, y, asset_get_index("obj_npc_talk")))
    {
        if audio_is_playing(asset_get_index("snd_enemy_explosion"))
            audio_stop_sound(asset_get_index("snd_enemy_explosion"))
        audio_play_sound(asset_get_index("snd_enemy_explosion"), 1, false)
        e_state = (11 << 0)
    }
}
else if script_execute(enemyturning)
{
    if ((movingcounter > 0))
        movingcounter--
    if ((movingcounter == 1))
    {
        instance_create_layer(x, (y - 15), "Effects", asset_get_index("obj_question"))
        sprite_index = spr_idle
        movingphase = 0
        movingcounter = 0
    }
    if ((movingphase == 1))
    {
        if ((sprite_index != spr_idle))
            movingcounter = 10
    }
    if place_meeting(x, y, asset_get_index("obj_pit"))
    {
        e_state = (12 << 0)
        cycle = 0
    }
    if ((cycle == 1) || (cycle == 0))
    {
        if ((movingphase == 0) || (movingphase == 1))
        {
            if ((!(collision_line(x, y, player_x, y, asset_get_index("obj_obstacle_parent"), false, true))) && (!(collision_line(x, y, player_x, y, asset_get_index("obj_enemy_parent"), false, true))) && (!(collision_line(x, y, player_x, y, asset_get_index("obj_npc_parent"), false, true))) && collision_line(x, y, player_x, y, asset_get_index("obj_player"), false, true))
            {
                if ((x < player_x))
                {
                    movingcounter = 10
                    if ((movingphase == 0))
                        movingnotif = 1
                    if ((movingphase == 1))
                    {
                        movingphase = 3
                        audio_play_sound(asset_get_index("snd_un_gunholster"), 1, false)
                        sprite_index = asset_get_index("spr_ev_un_soldier_r_gun")
                    }
                }
                else if ((x > player_x))
                {
                    movingcounter = 10
                    if ((movingphase == 0))
                        movingnotif = 1
                    if ((movingphase == 1))
                    {
                        movingphase = 3
                        audio_play_sound(asset_get_index("snd_un_gunholster"), 1, false)
                        sprite_index = asset_get_index("spr_ev_un_soldier_l_gun")
                    }
                }
            }
            else if ((!(collision_line(x, y, x, player_y, asset_get_index("obj_obstacle_parent"), false, true))) && (!(collision_line(x, y, x, player_y, asset_get_index("obj_enemy_parent"), false, true))) && (!(collision_line(x, y, x, player_y, asset_get_index("obj_npc_parent"), false, true))) && collision_line(x, y, x, player_y, asset_get_index("obj_player"), false, true))
            {
                if ((y < player_y))
                {
                    movingcounter = 10
                    if ((movingphase == 0))
                        movingnotif = 1
                    if ((movingphase == 1))
                    {
                        movingphase = 3
                        audio_play_sound(asset_get_index("snd_un_gunholster"), 1, false)
                        sprite_index = asset_get_index("spr_ev_un_soldier_d_gun")
                    }
                }
                else if ((y > player_y))
                {
                    movingcounter = 10
                    if ((movingphase == 0))
                        movingnotif = 1
                    if ((movingphase == 1))
                    {
                        movingphase = 3
                        audio_play_sound(asset_get_index("snd_un_gunholster"), 1, false)
                        sprite_index = asset_get_index("spr_un_soldier_u_gun")
                    }
                }
            }
        }
        if ((movingphase == 3) && (shootingphase == 1))
        {
            if ((sprite_index == asset_get_index("spr_ev_un_soldier_r_gun")))
            {
                if ((!(collision_line(x, y, player_x, y, asset_get_index("obj_obstacle_parent"), false, true))) && (!(collision_line(x, y, player_x, y, asset_get_index("obj_enemy_parent"), false, true))) && (!(collision_line(x, y, player_x, y, asset_get_index("obj_npc_parent"), false, true))) && collision_line(x, y, player_x, y, asset_get_index("obj_player"), false, true) && (x < player_x))
                {
                    instance_create_layer(x, (y - 15), "Effects", asset_get_index("obj_shutter_flash"))
                    audio_play_sound(asset_get_index("snd_ex_enemyexplosion_007"), 3, false)
                    audio_play_sound(asset_get_index("snd_ex_enemyexplosion_007"), 3, false)
                    with (585)
                        state = (6 << 0)
                }
                else
                    movingphase = 1
            }
            else if ((sprite_index == asset_get_index("spr_ev_un_soldier_l_gun")))
            {
                if ((!(collision_line(x, y, player_x, y, asset_get_index("obj_obstacle_parent"), false, true))) && (!(collision_line(x, y, player_x, y, asset_get_index("obj_enemy_parent"), false, true))) && (!(collision_line(x, y, player_x, y, asset_get_index("obj_npc_parent"), false, true))) && collision_line(x, y, player_x, y, asset_get_index("obj_player"), false, true) && (x > player_x))
                {
                    instance_create_layer(x, (y - 15), "Effects", asset_get_index("obj_shutter_flash"))
                    audio_play_sound(asset_get_index("snd_ex_enemyexplosion_007"), 3, false)
                    audio_play_sound(asset_get_index("snd_ex_enemyexplosion_007"), 3, false)
                    with (585)
                        state = (6 << 0)
                }
                else
                    movingphase = 1
            }
            else if ((sprite_index == asset_get_index("spr_ev_un_soldier_d_gun")))
            {
                if ((!(collision_line(x, y, x, player_y, asset_get_index("obj_obstacle_parent"), false, true))) && (!(collision_line(x, y, x, player_y, asset_get_index("obj_enemy_parent"), false, true))) && (!(collision_line(x, y, x, player_y, asset_get_index("obj_npc_parent"), false, true))) && collision_line(x, y, x, player_y, asset_get_index("obj_player"), false, true) && (y < player_y))
                {
                    instance_create_layer(x, (y - 15), "Effects", asset_get_index("obj_shutter_flash"))
                    audio_play_sound(asset_get_index("snd_ex_enemyexplosion_007"), 3, false)
                    audio_play_sound(asset_get_index("snd_ex_enemyexplosion_007"), 3, false)
                    with (585)
                        state = (6 << 0)
                }
                else
                    movingphase = 1
            }
            else if ((sprite_index == asset_get_index("spr_un_soldier_u_gun")))
            {
                if ((!(collision_line(x, y, x, player_y, asset_get_index("obj_obstacle_parent"), false, true))) && (!(collision_line(x, y, x, player_y, asset_get_index("obj_enemy_parent"), false, true))) && (!(collision_line(x, y, x, player_y, asset_get_index("obj_npc_parent"), false, true))) && collision_line(x, y, x, player_y, asset_get_index("obj_player"), false, true) && (y > player_y))
                {
                    instance_create_layer(x, (y - 15), "Effects", asset_get_index("obj_shutter_flash"))
                    audio_play_sound(asset_get_index("snd_ex_enemyexplosion_007"), 3, false)
                    audio_play_sound(asset_get_index("snd_ex_enemyexplosion_007"), 3, false)
                    with (585)
                        state = (6 << 0)
                }
                else
                    movingphase = 1
            }
        }
    }
    if ((cycle == 1) && (movingphase == 1))
    {
        if place_meeting((x + 16), y, asset_get_index("obj_player"))
        {
            with (instance_place((x + 16), y, 585))
                state = (6 << 0)
            e_state = (9 << 0)
        }
        else if place_meeting((x - 16), y, asset_get_index("obj_player"))
        {
            with (instance_place((x - 16), y, 585))
                state = (6 << 0)
            e_state = (9 << 0)
        }
        else if place_meeting(x, (y + 16), asset_get_index("obj_player"))
        {
            with (instance_place(x, (y + 16), 585))
                state = (6 << 0)
            e_state = (9 << 0)
        }
        else if place_meeting(x, (y - 16), asset_get_index("obj_player"))
        {
            with (instance_place(x, (y - 16), 585))
                state = (6 << 0)
            e_state = (9 << 0)
        }
        else if (place_meeting((x + 16), y, asset_get_index("obj_obsene")) && place_meeting((x - 16), y, asset_get_index("obj_obsene")) && place_meeting(x, (y + 16), asset_get_index("obj_obsene")) && place_meeting(x, (y - 16), asset_get_index("obj_obsene")))
            e_state = (0 << 0)
        else
        {
            mp_grid_clear_cell(asset_get_index("obj_game").grid_path, (x div 16), (y div 16))
            e_state = (6 << 0)
        }
    }
    else
        e_state = (0 << 0)
}
else if ((e_state == (6 << 0)))
{
    p_xx = x
    p_yy = y
    var enemypathing = asset_get_index("scr_path_to_player")
    script_execute(enemypathing)
    e_state = (0 << 0)
}
else if ((e_state == (9 << 0)))
{
    image_speed += 0.40000000000000002
    counter++
    if place_meeting((x + 16), y, asset_get_index("obj_player"))
    {
        if ((movingphase == 3))
            sprite_index = asset_get_index("spr_ev_un_soldier_r_gun")
        else
            sprite_index = spr_r
    }
    else if place_meeting((x - 16), y, asset_get_index("obj_player"))
    {
        if ((movingphase == 3))
            sprite_index = asset_get_index("spr_ev_un_soldier_l_gun")
        else
            sprite_index = spr_l
    }
    else if place_meeting(x, (y + 16), asset_get_index("obj_player"))
    {
        if ((movingphase == 3))
            sprite_index = asset_get_index("spr_ev_un_soldier_d_gun")
        else
            sprite_index = spr_d
    }
    else if place_meeting(x, (y - 16), asset_get_index("obj_player"))
    {
        if ((movingphase == 3))
            sprite_index = asset_get_index("spr_un_soldier_u_gun")
        else
            sprite_index = spr_u
    }
    else if place_meeting((x + 16), y, asset_get_index("obj_npc_parent"))
    {
        if ((movingphase == 3))
            sprite_index = asset_get_index("spr_ev_un_soldier_r_gun")
        else
            sprite_index = spr_r
    }
    else if place_meeting((x - 16), y, asset_get_index("obj_npc_parent"))
    {
        if ((movingphase == 3))
            sprite_index = asset_get_index("spr_ev_un_soldier_l_gun")
        else
            sprite_index = spr_l
    }
    else if place_meeting(x, (y + 16), asset_get_index("obj_npc_parent"))
    {
        if ((movingphase == 3))
            sprite_index = asset_get_index("spr_ev_un_soldier_d_gun")
        else
            sprite_index = spr_d
    }
    else if place_meeting(x, (y - 16), asset_get_index("obj_npc_parent"))
    {
        if ((movingphase == 3))
            sprite_index = asset_get_index("spr_un_soldier_u_gun")
        else
            sprite_index = spr_u
    }
    if ((counter >= 60))
    {
        e_state = (0 << 0)
        counter = 0
    }
}
else if ((e_state == (11 << 0)))
{
    event_perform(ev_other, ev_user4)
    instance_create_depth(x, y, 10, asset_get_index("obj_explosion_001"))
    instance_create_depth(x, y, 5, asset_get_index("obj_bloodtrail_fx"))
    instance_destroy()
}
else if ((e_state == (15 << 0)))
{
    if (place_meeting((x + e_move_x), (y + e_move_y), asset_get_index("obj_obstacle_parent")) || place_meeting((x + e_move_x), (y + e_move_y), asset_get_index("obj_pit")) || place_meeting((x + e_move_x), (y + e_move_y), asset_get_index("obj_enemy_parent")))
        set_e_direction += 1
    e_state = (0 << 0)
}
if ((e_state == (12 << 0)))
{
    var ifalls = e_fall_sprite
    var ifallings = e_falling_sprite
    var create_fall_effect = instance_create_layer(x, y, "Instances", asset_get_index("obj_fall"))
    with (create_fall_effect)
    {
        sprite_index = ifalls
        fall_sprite = ifallings
    }
    instance_destroy()
}
if ((movingnotif == 1))
{
    instance_create_layer(x, (y - 15), "Effects", asset_get_index("obj_exclamation"))
    movingphase = 1
    movingnotif = 0
}
if ((movingphase == 3))
    shootingphase = 1
else
    shootingphase = 0

