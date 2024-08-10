// TARGET: REPLACE
switch direction
{
    case 265:
        image_speed = 3
        break
    case 260:
        image_speed = 2
        break
    case 255:
        image_speed = 1
        break
    case 250:
        image_speed = 0
        break
}

flash_counter++
if (flash_counter >= flash_rate)
{
    if (sprite_index == spr_add_sword)
        sprite_index = spr_add_sword_b
    else if (sprite_index == spr_add_sword_b)
        sprite_index = spr_add_sword_c
    else if (sprite_index == spr_add_sword_c)
        sprite_index = spr_add_sword
    flash_counter = 0
}
if (instance_exists(obj_player) && instance_exists(obj_boulder))
{
    if (y >= (obj_player.y - 5))
    {
        counter++
        if (speed != 0)
        {
            if audio_is_playing(snd_crash)
                audio_stop_sound(snd_crash)
            var isfx = audio_play_sound(snd_crash, 1, false)
            var ipitch = choose(1.3, 1.35, 1.4)
            audio_sound_pitch(isfx, ipitch)
            event_perform(ev_other, ev_user2)
            alarm[1] = 50
            speed = 0
        }
        if (counter == 8)
        {
            if (flash_rate != 2)
                flash_rate -= 2
            counter = 0
        }
    }
}
else if (y > 104)
{
    counter++
    if (speed != 0)
    {
        if audio_is_playing(snd_crash)
            audio_stop_sound(snd_crash)
        isfx = audio_play_sound(snd_crash, 1, false)
        ipitch = choose(1.3, 1.35, 1.4)
        audio_sound_pitch(isfx, ipitch)
        event_perform(ev_other, ev_user2)
        alarm[1] = 128
        speed = 0
    }
    if (counter == 8)
    {
        if (flash_rate != 2)
            flash_rate -= 2
        counter = 0
    }
}
if (counter >= 256)
    instance_destroy()