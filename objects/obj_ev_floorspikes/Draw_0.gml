draw_sprite(sprite_index, image_index, x, y)
if ((!(place_meeting(x, (y + grid_size), asset_get_index("obj_floor_tile")))) && (!(place_meeting(x, (y + grid_size), asset_get_index("obj_collision")))))
    draw_sprite(asset_get_index("spr_floor"), 1, x, (y + grid_size))
else if place_meeting(x, (y + grid_size), asset_get_index("obj_glassfloor"))
    draw_sprite(asset_get_index("spr_floor"), 1, x, (y + grid_size))

