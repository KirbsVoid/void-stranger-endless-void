// TARGET: REPLACE
sprite_index = spr_cg_idle
image_speed = 0
cycle = true
rush = false
rush_state = 0
e_state = (0 << 0)
e_spd = global.grid_x
e_direction = 270
set_e_direction = 3
e_move_x = lengthdir_x(e_spd, e_direction)
e_move_y = lengthdir_y(e_spd, e_direction)
counter = 0
e_hp = 2
e_size = sprite_width + sprite_height * 2
counter = 0
player_x = 0
player_y = 0
if instance_exists(obj_player)
{
    player_x = obj_player.x
    player_y = obj_player.y
}
spr_r = spr_cg_right
spr_l = spr_cg_left
spr_u = spr_cg_up
spr_d = spr_cg_down
spr_hurt_r = spr_cg_hurt_right
spr_hurt_l = spr_cg_hurt_left
spr_hurt_u = spr_cg_hurt_left
spr_hurt_d = spr_cg_hurt_right
spr_tired = spr_cg_tired
e_fall_sprite = spr_cg_down
e_falling_sprite = spr_cg_falling
sweat_inst = -4
enemy_score = 4
playerhitme = 0
stun = 0