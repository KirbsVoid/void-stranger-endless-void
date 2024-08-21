/// @description By AbbyV, ported by KirbsVoid

sprite_index = asset_get_index("spr_ev_tpfloor")
grid_size = global.grid_x
image_speed = 0
shine_speed = 0.9
shine_loop = 0
flicker = false
counter = 0
player_hit = false
destroyer_id = 0
buffer = 0
tpid = instance_number(asset_get_index("obj_ev_tpfloor")) - 1
