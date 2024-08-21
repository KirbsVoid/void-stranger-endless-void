if instance_exists(asset_get_index("obj_player"))
{
    if (asset_get_index("obj_player").state == (13 << 0) && destroyer_id == 1)
    {
        ds_grid_set(asset_get_index("obj_inventory").ds_player_info, 1, 3, "Y")
        ds_list_add(global.tp_list, tpid)
        with (585)
        {
            var new_tile_str = string_insert("Y", tile_str, string_length(tile_str))
            tile_str = new_tile_str
            show_debug_message(tile_str)
        }
    }
}
