if ((global.test_stuff != 0))
    return;
var ienemydeath_fx = instance_create_depth(x, y, depth, asset_get_index("obj_enemydeath_fx"))
var ideathsprite = asset_get_index("spr_ev_un_soldier_falling")
with (ienemydeath_fx)
    enemy_sprite = ideathsprite
