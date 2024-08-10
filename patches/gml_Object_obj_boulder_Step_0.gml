// TARGET: REPLACE
if (room == rm_0029 && b_form == 8)
{
    if (lorn_check == lorn_limit)
    {
        lorn_counter++
        if (lorn_counter == lorn_timelimit)
        {
            event_perform(ev_other, ev_user1)
            lorn_check = 0
        }
    }
    else
        lorn_counter = 0
    if (!(place_meeting(x, (y + 16), obj_player)))
    {
        lorn_counter = 0
        lorn_check = 0
    }
}
if (room == rm_test2_001 || room == rm_test2_003 || room == rm_test2_030 || room == rm_test2_035 || room == rm_test2_007 || room == rm_test2_043 || room == rm_test2_028 || room == rm_test2_020 || room == rm_test2_019 || room == rm_test2_071)
{
    if (b_form == 8)
    {
        input_action_hold = scr_input_check(4)
        if (input_action_hold && (!instance_exists(obj_textbox)) && global.pause == false)
        {
            test2_001_hold_counter++
            if (test2_001_hold_counter >= test2_001_hold_limit)
            {
                with (obj_boulder)
                {
                    if (special_message == 69)
                    {
                        special_message = 70
                        alarm[0] = 2
                    }
                }
                event_perform(ev_other, ev_user1)
            }
        }
        else
            test2_001_hold_counter = 0
    }
}
if (b_form == 1 && shaken == false && o_state != (5 << 0) && lev_is_pissed == true)
{
    if (watcher_speed != watcher_frames)
    {
        watcher_speed += 0.5
        levglow_speed = 0
        lev_glow = 0
    }
    else
    {
        switch lev_glow
        {
            case 1:
                if (levglow_speed != levglow_frames)
                    levglow_speed += 0.2
                else
                {
                    levglow_speed = 0
                    lev_glow = 0
                }
                break
        }

    }
}
if (b_form == 9)
{
    switch jukebox_mode
    {
        case 0:
            break
        case 1:
            if audio_is_playing(snd_recordscratch)
                audio_stop_sound(snd_recordscratch)
            scr_stop_music(false, 0)
            var isfx = audio_play_sound(snd_recordscratch, 1, false)
            global.jukebox_song++
            if (global.jukebox_song > 13)
                global.jukebox_song = 0
            jukebox_mode = 2
            break
        case 2:
            jukebox_counter++
            if (jukebox_counter == 32)
            {
                event_perform(ev_other, ev_user5)
                jukebox_counter = 0
                jukebox_mode = 0
            }
            break
        default:

    }

}
if ((b_form == 10))
{
    if ((Catchyoufly == 0))
    {
        if ((obj_player.float == 1))
            Catchyoufly = 1
    }
    if ((Catchyoufly == 1))
    {
        global.pause = 1
        audio_play_sound(snd_lockdamage, 1, false)
        byewings = 120
        Catchyoufly = 2
    }
    if ((Catchyoufly == 2))
        image_speed += 0.5
    if ((byewings > 0))
        byewings--
    if ((byewings == 50))
    {
        obj_player.float = 0
        audio_play_sound(snd_wingspawn, 1, false)
        switch obj_player.set_p_direction
        {
            case 0:
                var wings_dis = instance_create_layer(obj_player.x, obj_player.y, "Effects", obj_player_wings_dissipate)
                with (wings_dis)
                    wing_dir = 0
                break
            case 1:
                wings_dis = instance_create_layer(obj_player.x, obj_player.y, "Effects", obj_player_wings_dissipate)
                with (wings_dis)
                    wing_dir = 1
                break
            case 2:
                wings_dis = instance_create_layer(obj_player.x, obj_player.y, "Effects", obj_player_wings_dissipate)
                with (wings_dis)
                    wing_dir = 2
                break
            case 3:
                wings_dis = instance_create_layer(obj_player.x, obj_player.y, "Player", obj_player_wings_dissipate)
                with (wings_dis)
                    wing_dir = 3
                break
        }

        wingsdissi = 18
    }
    if ((wingsdissi > 0))
    {
        with (obj_player_wings_dissipate)
            image_speed += 0.5
        wingsdissi--
    }
    else if ((wingsdissi == 1))
    {
        with (obj_player_wings_dissipate)
            sprite_index = spr_empty
    }
    if ((byewings == 1))
    {
        global.pause = 0
        Catchyoufly = 0
        obj_player.state = (8 << 0)
    }
}
if ((b_form == 11))
{
    if ((Catchyoukillin == 0))
    {
        if ((obj_player.sattack == 1))
            Catchyoukillin = 1
    }
    if ((Catchyoukillin == 1))
    {
        global.pause = 1
        obj_player.sattack = 0
        audio_play_sound(snd_lockdamage, 1, false)
        byesword = 120
        Catchyoukillin = 2
    }
    if ((Catchyoukillin == 2))
        image_speed += 0.5
    if ((byesword > 0))
        byesword--
    if ((byesword == 90))
    {
        var sord1 = instance_create_layer((obj_player.x + 20), (obj_player.y - 100), "Effects", obj_add_sword)
        with (sord1)
        {
            direction = 260
            speed = 8
            var isx = 0
            var isy = 0
        }
    }
    if ((byesword == 85))
    {
        var sord2 = instance_create_layer((obj_player.x + 20), (obj_player.y - 100), "Effects", obj_add_sword)
        with (sord2)
        {
            direction = 255
            speed = 8
            isx = 0
            isy = 0
        }
    }
    if ((byesword == 80))
    {
        var sord3 = instance_create_layer((obj_player.x + 20), (obj_player.y - 100), "Effects", obj_add_sword)
        with (sord3)
        {
            direction = 265
            speed = 8
            isx = 0
            isy = 0
        }
    }
    if ((byesword == 75))
    {
        var sord4 = instance_create_layer((obj_player.x + 20), (obj_player.y - 100), "Effects", obj_add_sword)
        with (sord4)
        {
            direction = 250
            speed = 8
            isx = 0
            isy = 0
        }
    }
    if ((byesword == 70))
    {
        var sord5 = instance_create_layer((obj_player.x + 15), (obj_player.y - 100), "Effects", obj_add_sword)
        with (sord5)
        {
            direction = 260
            speed = 8
            isx = 0
            isy = 0
        }
    }
    if ((byesword == 65))
    {
        var sord6 = instance_create_layer((obj_player.x + 21), (obj_player.y - 100), "Effects", obj_add_sword)
        with (sord6)
        {
            direction = 250
            speed = 8
            isx = 0
            isy = 0
        }
    }
    if ((byesword == 1))
    {
        global.pause = 0
        audio_play_sound(snd_player_damage, 1, false)
        Catchyoukillin = 0
        obj_player.state = (6 << 0)
    }
}
if ((b_form == 12))
{
    if ((Catchyoureadin == 0))
    {
        if ((obj_player.state == (12 << 0)))
            Catchyoureadin = 1
    }
    if ((Catchyoureadin == 1))
    {
        jugadorcoordenadax = (obj_player.x - 15)
        jugadorcoordenaday = (obj_player.y - 15)
        instance_create_layer(0, 0, "Effects", obj_ev_badsoulemit)
        global.pause = 1
        player_talk = 0
        audio_play_sound(snd_lockdamage, 1, false)
        byememory = 480
        Catchyoureadin = 2
    }
    if ((Catchyoureadin == 2))
        image_speed += 0.5
    if ((byememory > 0))
        byememory--
    if ((byememory == 460))
    {
        with (obj_player)
            sprite_index = spr_m_right
    }
    if ((byememory == 450))
    {
        with (obj_player)
            sprite_index = spr_m_left
    }
    if ((byememory == 420))
    {
        with (obj_player)
            sprite_index = spr_m_down
        instance_create_layer(obj_player.x, (obj_player.y - 17), "Effects2", obj_question)
    }
    if ((byememory == 260))
    {
        audio_play_sound(snd_player_damage, 1, false)
        instance_create_layer((jugadorcoordenadax + 10), (jugadorcoordenaday + 10), "Effects2", obj_damage_numbers)
        Catchyoureadin = 3
    }
    if ((byememory == 255))
    {
        global.pause = 0
        audio_play_sound(snd_player_damage, 1, false)
        instance_create_layer((jugadorcoordenadax - 10), (jugadorcoordenaday + 5), "Effects2", obj_damage_numbers)
        obj_player.state = (15 << 0)
    }
    if ((byememory == 245))
    {
        audio_play_sound(snd_player_damage, 1, false)
        instance_create_layer((jugadorcoordenadax + 6), jugadorcoordenaday, "Effects2", obj_damage_numbers)
    }
    if ((byememory == 235))
    {
        audio_play_sound(snd_player_damage, 1, false)
        instance_create_layer((jugadorcoordenadax + 8), (jugadorcoordenaday + 4), "Effects2", obj_damage_numbers)
    }
    if ((byememory == 210))
    {
        audio_play_sound(snd_player_damage, 1, false)
        instance_create_layer((jugadorcoordenadax - 3), jugadorcoordenaday, "Effects2", obj_damage_numbers)
    }
    if ((byememory == 200))
    {
        audio_play_sound(snd_player_damage, 1, false)
        instance_create_layer((jugadorcoordenadax - 10), (jugadorcoordenaday + 5), "Effects2", obj_damage_numbers)
    }
    if ((byememory == 190))
    {
        audio_play_sound(snd_player_damage, 1, false)
        instance_create_layer((jugadorcoordenadax + 6), jugadorcoordenaday, "Effects2", obj_damage_numbers)
    }
    if ((byememory == 185))
    {
        audio_play_sound(snd_player_damage, 1, false)
        instance_create_layer((jugadorcoordenadax + 8), (jugadorcoordenaday + 4), "Effects2", obj_damage_numbers)
    }
    if ((byememory == 165))
    {
        audio_play_sound(snd_player_damage, 1, false)
        instance_create_layer((jugadorcoordenadax + 6), jugadorcoordenaday, "Effects2", obj_damage_numbers)
    }
    if ((byememory == 145))
    {
        audio_play_sound(snd_player_damage, 1, false)
        instance_create_layer((jugadorcoordenadax + 4), (jugadorcoordenaday + 4), "Effects2", obj_damage_numbers)
    }
    if ((byememory == 120))
    {
        audio_play_sound(snd_player_damage, 1, false)
        instance_create_layer((jugadorcoordenadax - 6), jugadorcoordenaday, "Effects2", obj_damage_numbers)
    }
    if ((byememory == 100))
    {
        audio_play_sound(snd_player_damage, 1, false)
        instance_create_layer((jugadorcoordenadax - 10), (jugadorcoordenaday + 10), "Effects2", obj_damage_numbers)
    }
    if ((byememory == 90))
    {
        audio_play_sound(snd_player_damage, 1, false)
        instance_create_layer((jugadorcoordenadax + 3), jugadorcoordenaday, "Effects2", obj_damage_numbers)
    }
    if ((byememory == 85))
    {
        audio_play_sound(snd_player_damage, 1, false)
        instance_create_layer((jugadorcoordenadax + 4), (jugadorcoordenaday + 4), "Effects2", obj_damage_numbers)
    }
}
if (o_state == (0 << 0))
{
    o_move_x = 0
    o_move_y = 0
    if place_meeting(x, y, obj_pit)
        o_state = (5 << 0)
}
else if (o_state == (10 << 0))
{
    watcher_speed = 0
    if (b_form == 9)
    {
        jukebox_mode = 1
        jukebox_counter = 0
        jukebox_song++
        if (jukebox_song > songlist_max)
            jukebox_song = 0
    }
    if place_meeting((x + o_move_x), (y + o_move_y), obj_npc_talk)
    {
        if (b_form != 5)
        {
            if (o_move_x == 16)
            {
                var smokecloud = instance_create_layer(x, y, "Effects", obj_smokecloud)
                with (smokecloud)
                    smoke_dir = 2
            }
            else if (o_move_x == -16)
            {
                smokecloud = instance_create_layer(x, y, "Effects", obj_smokecloud)
                with (smokecloud)
                    smoke_dir = 0
            }
            else if (o_move_y == -16)
            {
                smokecloud = instance_create_layer(x, y, "Effects", obj_smokecloud)
                with (smokecloud)
                    smoke_dir = 1
            }
            else if (o_move_y == 16)
            {
                smokecloud = instance_create_layer(x, y, "Effects", obj_smokecloud)
                with (smokecloud)
                    smoke_dir = 3
            }
            x += o_move_x
            y += o_move_y
            audio_play_sound(push_sfx, 1, false)
            o_move_x = 0
            o_move_y = 0
            o_state = (0 << 0)
        }
        else if (bgor_moved == false)
        {
            if (o_move_x == 16)
            {
                smokecloud = instance_create_layer(x, y, "Effects", obj_smokecloud)
                with (smokecloud)
                    smoke_dir = 2
            }
            else if (o_move_x == -16)
            {
                smokecloud = instance_create_layer(x, y, "Effects", obj_smokecloud)
                with (smokecloud)
                    smoke_dir = 0
            }
            else if (o_move_y == -16)
            {
                smokecloud = instance_create_layer(x, y, "Effects", obj_smokecloud)
                with (smokecloud)
                    smoke_dir = 1
            }
            else if (o_move_y == 16)
            {
                smokecloud = instance_create_layer(x, y, "Effects", obj_smokecloud)
                with (smokecloud)
                    smoke_dir = 3
            }
            bgor_moved = true
            x += o_move_x
            y += o_move_y
            counter = 0
            if (!audio_is_playing(snd_lockdamage))
                audio_play_sound(snd_lockdamage, 1, false)
            audio_play_sound(push_sfx, 1, false)
            o_move_x = 0
            o_move_y = 0
            o_state = (9 << 0)
        }
        else
        {
            audio_play_sound(snd_push_small, 1, false)
            o_state = (0 << 0)
        }
    }
    else if (place_meeting((x + o_move_x), (y + o_move_y), obj_obstacle_parent) || place_meeting((x + o_move_x), (y + o_move_y), obj_npc_parent) || place_meeting((x + o_move_x), (y + o_move_y), obj_text_parent) || place_meeting((x + o_move_x), (y + o_move_y), obj_fakewall) || place_meeting((x + o_move_x), (y + o_move_y), obj_player))
    {
        audio_play_sound(snd_push_small, 1, false)
        if (room == rm_0029)
        {
            if (b_form == 8)
                lorn_check += 1
        }
        if (b_form != 5)
        {
            o_state = (0 << 0)
            shaken = true
            alarm[9] = 9
        }
        else if (bgor_moved == false)
        {
            o_state = (0 << 0)
            shaken = true
            alarm[9] = 9
        }
        else
            o_state = (0 << 0)
    }
    else if place_meeting((x + o_move_x), (y + o_move_y), obj_pit)
    {
        if (b_form != 5)
        {
            audio_play_sound(push_sfx, 1, false)
            if (o_move_x == 16)
            {
                smokecloud = instance_create_layer(x, y, "Effects", obj_smokecloud)
                with (smokecloud)
                    smoke_dir = 2
            }
            else if (o_move_x == -16)
            {
                smokecloud = instance_create_layer(x, y, "Effects", obj_smokecloud)
                with (smokecloud)
                    smoke_dir = 0
            }
            else if (o_move_y == -16)
            {
                smokecloud = instance_create_layer(x, y, "Effects", obj_smokecloud)
                with (smokecloud)
                    smoke_dir = 1
            }
            else if (o_move_y == 16)
            {
                smokecloud = instance_create_layer(x, y, "Effects", obj_smokecloud)
                with (smokecloud)
                    smoke_dir = 3
            }
            x += o_move_x
            y += o_move_y
            o_state = (5 << 0)
        }
        else if (bgor_moved == false)
        {
            audio_play_sound(push_sfx, 1, false)
            if (o_move_x == 16)
            {
                smokecloud = instance_create_layer(x, y, "Effects", obj_smokecloud)
                with (smokecloud)
                    smoke_dir = 2
            }
            else if (o_move_x == -16)
            {
                smokecloud = instance_create_layer(x, y, "Effects", obj_smokecloud)
                with (smokecloud)
                    smoke_dir = 0
            }
            else if (o_move_y == -16)
            {
                smokecloud = instance_create_layer(x, y, "Effects", obj_smokecloud)
                with (smokecloud)
                    smoke_dir = 1
            }
            else if (o_move_y == 16)
            {
                smokecloud = instance_create_layer(x, y, "Effects", obj_smokecloud)
                with (smokecloud)
                    smoke_dir = 3
            }
            x += o_move_x
            y += o_move_y
            o_state = (5 << 0)
        }
        else
        {
            audio_play_sound(snd_push_small, 1, false)
            o_state = (0 << 0)
        }
    }
    else if (b_form != 5)
    {
        if (o_move_x == 16)
        {
            smokecloud = instance_create_layer(x, y, "Effects", obj_smokecloud)
            with (smokecloud)
                smoke_dir = 2
        }
        else if (o_move_x == -16)
        {
            smokecloud = instance_create_layer(x, y, "Effects", obj_smokecloud)
            with (smokecloud)
                smoke_dir = 0
        }
        else if (o_move_y == -16)
        {
            smokecloud = instance_create_layer(x, y, "Effects", obj_smokecloud)
            with (smokecloud)
                smoke_dir = 1
        }
        else if (o_move_y == 16)
        {
            smokecloud = instance_create_layer(x, y, "Effects", obj_smokecloud)
            with (smokecloud)
                smoke_dir = 3
        }
        x += o_move_x
        y += o_move_y
        audio_play_sound(push_sfx, 1, false)
        o_move_x = 0
        o_move_y = 0
        o_state = (0 << 0)
    }
    else if (bgor_moved == false)
    {
        if (o_move_x == 16)
        {
            smokecloud = instance_create_layer(x, y, "Effects", obj_smokecloud)
            with (smokecloud)
                smoke_dir = 2
        }
        else if (o_move_x == -16)
        {
            smokecloud = instance_create_layer(x, y, "Effects", obj_smokecloud)
            with (smokecloud)
                smoke_dir = 0
        }
        else if (o_move_y == -16)
        {
            smokecloud = instance_create_layer(x, y, "Effects", obj_smokecloud)
            with (smokecloud)
                smoke_dir = 1
        }
        else if (o_move_y == 16)
        {
            smokecloud = instance_create_layer(x, y, "Effects", obj_smokecloud)
            with (smokecloud)
                smoke_dir = 3
        }
        bgor_moved = true
        x += o_move_x
        y += o_move_y
        counter = 0
        if (!audio_is_playing(snd_lockdamage))
            audio_play_sound(snd_lockdamage, 1, false)
        audio_play_sound(push_sfx, 1, false)
        o_move_x = 0
        o_move_y = 0
        o_state = (9 << 0)
    }
    else
    {
        audio_play_sound(snd_push_small, 1, false)
        o_state = (0 << 0)
    }
}
if (punish == true && o_state != (5 << 0) && b_form != 0)
{
    with (obj_player)
    {
        if (state != (8 << 0))
        {
            counter = 0
            state = (6 << 0)
        }
        aattack = false
    }
    punish = false
}
if (flicker == true && exit_flicker == 0)
{
    image_speed += 0.5
    counter++
    if (counter == 1 && b_form != 0)
    {
        if (!audio_is_playing(snd_lockdamage))
            audio_play_sound(snd_lockdamage, 1, false)
    }
    if (counter >= 60)
    {
        image_speed = 0
        flicker = false
        counter = 0
    }
}
if (shaken == false)
{
    if (b_form == 0)
        sprite_index = spr_boulder
    else if (b_form == 1)
    {
        if (unfinished == false)
            sprite_index = spr_watcher
        else
            sprite_index = spr_mas_004
    }
    else if (b_form == 2)
    {
        if (unfinished == false)
            sprite_index = spr_smiler
        else
            sprite_index = spr_mas_003
    }
    else if (b_form == 3)
        sprite_index = spr_killer
    else if (b_form == 4)
        sprite_index = cif_sprite
    else if (b_form == 5)
    {
        if (bgor_moved == false)
            sprite_index = spr_slower
        else
            sprite_index = spr_slower_stop
    }
    else if (b_form == 6)
        sprite_index = spr_lover
    else if (b_form == 7)
        sprite_index = spr_greeder
    else if (b_form == 8)
        sprite_index = spr_voider
    else if (b_form == 9)
        sprite_index = spr_jb
    else if ((b_form == 10))
        sprite_index = spr_ev_disabler_wings
    else if ((b_form == 11))
        sprite_index = spr_ev_disabler_sword
    else if ((b_form == 12))
        sprite_index = spr_ev_disabler_memory
}
else if (shaken == true)
{
    if (b_form == 0)
    {
        image_speed += 0.25
        sprite_index = spr_boulder_shake
    }
    else if (b_form == 1)
    {
        image_speed += 0.25
        if (unfinished == false)
            sprite_index = spr_watcher_shaken
        else
            sprite_index = spr_mas_004_shaken
    }
    else if (b_form == 2)
    {
        image_speed += 0.25
        if (unfinished == false)
            sprite_index = spr_smiler_shaken
        else
            sprite_index = spr_mas_003_shaken
    }
    else if (b_form == 3)
    {
        image_speed += 0.25
        sprite_index = spr_killer_shaken
    }
    else if (b_form == 4)
    {
        image_speed += 0.25
        sprite_index = cif_sprite_shaken
    }
    else if (b_form == 5)
    {
        if (bgor_moved == false)
        {
            image_speed += 0.25
            sprite_index = spr_slower_shaken
        }
        else
        {
            image_speed += 0.25
            sprite_index = spr_slower_stop_shaken
        }
    }
    else if (b_form == 6)
    {
        image_speed += 0.25
        sprite_index = spr_lover_shaken
    }
    else if (b_form == 7)
    {
        image_speed += 0.25
        sprite_index = spr_greeder_shaken
    }
    else if (b_form == 8)
    {
        image_speed += 0.25
        sprite_index = spr_voider_shaken
    }
    else if (b_form == 9)
    {
        image_speed += 0.25
        sprite_index = spr_jb_shaken
    }
    else if ((b_form == 10))
    {
        image_speed += 0.25
        sprite_index = spr_ev_disabler_wings_shaken
    }
    else if ((b_form == 11))
    {
        image_speed += 0.25
        sprite_index = spr_ev_disabler_sword_shaken
    }
    else if ((b_form == 12))
    {
        image_speed += 0.25
        sprite_index = spr_ev_disabler_memory_shaken
    }
}
if (b_form == 3)
{
    enemy_count_current = instance_number(obj_enemy_parent) + instance_number(obj_npc_talk) + instance_number(obj_npc_parent)
    if (enemy_count > enemy_count_current && (!(place_meeting(x, y, obj_pit))))
    {
        counter = 0
        o_state = (9 << 0)
        if (!audio_is_playing(snd_lockdamage))
            audio_play_sound(snd_lockdamage, 1, false)
        enemy_count = instance_number(obj_enemy_parent) + instance_number(obj_npc_talk) + instance_number(obj_npc_parent)
    }
    if (o_state == (0 << 0))
    {
        if place_meeting(x, y, obj_pit)
        {
            o_state = (5 << 0)
            image_speed = 0
        }
        if (shaken == false)
            image_speed = 0
        if (enemy_count == 0)
        {
            instance_create_layer(x, y, "Effects", obj_explosion_002)
            if (!audio_is_playing(snd_explosion))
                scr_play_sound(snd_explosion, 1, false)
            instance_destroy()
        }
    }
    else if (o_state == (9 << 0))
    {
        if place_meeting(x, y, obj_pit)
        {
            o_state = (5 << 0)
            image_speed = 0
        }
        image_speed += 0.5
        counter += 1
        if (counter >= 60 && enemy_count != 0)
        {
            o_state = (0 << 0)
            counter = 0
        }
        else if (enemy_count == 0)
        {
            o_state = (0 << 0)
            counter = 0
        }
    }
}
if (b_form == 4)
{
}
if (b_form == 5)
{
    if (o_state == (0 << 0))
    {
        if (shaken == false)
            image_speed = 0
    }
    else if (o_state == (9 << 0))
    {
        if place_meeting(x, y, obj_pit)
        {
            o_state = (5 << 0)
            counter = 0
            image_speed = 0
        }
        image_speed += 0.5
        counter += 1
        if (counter >= 60)
        {
            o_state = (0 << 0)
            counter = 0
        }
    }
}
if (o_state == (5 << 0))
{
    o_move_x = 0
    o_move_y = 0
    counter += 1
    if (room == rm_e_000)
    {
        var istring = string(b_form)
        with (obj_riddle_000)
        {
            var islength = string_length(code_string) + 1
            code_string = string_insert(istring, code_string, islength)
        }
    }
    if (exb_check != 0)
    {
        if place_meeting(x, y, obj_na_secret_exit)
        {
            ds_list_set(obj_inventory.ds_ccr, 6, ((ds_list_find_value(obj_inventory.ds_ccr, 6)) + 1))
            show_debug_message("Down I go...")
        }
        else
            ds_list_set(obj_inventory.ds_ccr, 6, 100)
    }
    if place_meeting(x, y, obj_explofloor_vanish)
    {
        if (b_form != 6)
        {
            var create_fall_effect = instance_create_layer(x, y, "Instances", obj_fall)
            if (b_form == 0)
            {
                with (create_fall_effect)
                    sprite_index = spr_boulder_shake
            }
            else if (b_form == 1)
            {
                with (create_fall_effect)
                    sprite_index = spr_watcher_shaken
            }
            else if (b_form == 2)
            {
                with (create_fall_effect)
                    sprite_index = spr_smiler_shaken
            }
            else if (b_form == 3)
            {
                with (create_fall_effect)
                    sprite_index = spr_killer_shaken
            }
            else if (b_form == 4)
            {
                with (create_fall_effect)
                    sprite_index = other.cif_sprite_shaken
            }
            else if (b_form == 5)
            {
                if (bgor_moved == false)
                {
                    with (create_fall_effect)
                        sprite_index = spr_slower_shaken
                }
                else
                {
                    with (create_fall_effect)
                        sprite_index = spr_slower_stop
                }
            }
            else if (b_form == 6)
            {
                with (create_fall_effect)
                    sprite_index = spr_lover_shaken
            }
            else if (b_form == 7)
            {
                with (create_fall_effect)
                    sprite_index = spr_greeder_shaken
            }
            else if (b_form == 8)
            {
                with (create_fall_effect)
                    sprite_index = spr_voider_shaken
            }
            else if (b_form == 9)
            {
                with (create_fall_effect)
                    sprite_index = spr_jb_shaken
            }
            else if ((b_form == 10))
            {
            image_speed += 0.25
            sprite_index = spr_ev_disabler_wings_shaken
            }
            else if ((b_form == 11))
            {
            image_speed += 0.25
            sprite_index = spr_ev_disabler_sword_shaken
            }
            else if ((b_form == 12))
            {
            image_speed += 0.25
            sprite_index = spr_ev_disabler_memory_shaken
            }
            with (create_fall_effect)
                counter = -2
        }
        else
        {
            var ipit = instance_place(x, y, obj_pit)
            with (ipit)
                instance_destroy()
            var explofloor = instance_place(x, y, obj_explofloor_vanish)
            with (explofloor)
                instance_destroy()
            instance_create_layer(x, (y - 4), "Effects", obj_plonk)
            if (!audio_is_playing(snd_reveal))
                audio_play_sound(snd_reveal, 1, false)
            instance_create_layer(x, y, "Floor", obj_floor)
        }
        instance_destroy()
    }
    else
    {
        if (b_form != 6)
        {
            create_fall_effect = instance_create_layer(x, y, "Instances", obj_fall)
            if (b_form == 0)
            {
                with (create_fall_effect)
                    sprite_index = spr_boulder_shake
            }
            else if (b_form == 1)
            {
                with (create_fall_effect)
                    sprite_index = spr_watcher_shaken
            }
            else if (b_form == 2)
            {
                with (create_fall_effect)
                    sprite_index = spr_smiler_shaken
            }
            else if (b_form == 3)
            {
                with (create_fall_effect)
                    sprite_index = spr_killer_shaken
            }
            else if (b_form == 4)
            {
                with (create_fall_effect)
                    sprite_index = other.cif_sprite_shaken
            }
            else if (b_form == 5)
            {
                if (bgor_moved == false)
                {
                    with (create_fall_effect)
                        sprite_index = spr_slower_shaken
                }
                else
                {
                    with (create_fall_effect)
                        sprite_index = spr_slower_stop
                }
            }
            else if (b_form == 6)
            {
                with (create_fall_effect)
                    sprite_index = spr_lover_shaken
            }
            else if (b_form == 7)
            {
                with (create_fall_effect)
                    sprite_index = spr_greeder_shaken
            }
            else if (b_form == 8)
            {
                with (create_fall_effect)
                    sprite_index = spr_voider_shaken
            }
            else if (b_form == 9)
            {
                with (create_fall_effect)
                    sprite_index = spr_jb_shaken
            }
            else if ((b_form == 10))
            {
            image_speed += 0.25
            sprite_index = spr_ev_disabler_wings_shaken
            }
            else if ((b_form == 11))
            {
            image_speed += 0.25
            sprite_index = spr_ev_disabler_sword_shaken
            }
            else if ((b_form == 12))
            {
            image_speed += 0.25
            sprite_index = spr_ev_disabler_memory_shaken
            }
            with (create_fall_effect)
                counter = 56
        }
        else
        {
            ipit = instance_place(x, y, obj_pit)
            with (ipit)
                instance_destroy()
            var fallobj = instance_place(x, y, obj_fall)
            with (fallobj)
                instance_destroy()
            instance_create_layer(x, (y - 4), "Effects", obj_plonk)
            if (!audio_is_playing(snd_reveal))
                audio_play_sound(snd_reveal, 1, false)
            instance_create_layer(x, y, "Floor", obj_floor)
        }
        instance_destroy()
    }
    show_debug_message("Boulder has been destroyed by falling into pit")
    instance_destroy()
}
