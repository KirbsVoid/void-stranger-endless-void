event_inherited();

spikeswitch_textbox = instance_create_layer(70, 72 - 30 + 0 * 18, "WindowElements", asset_get_index("obj_ev_textbox"), 
{
    txt: string(clamp(switch_properties.switchid, 0, 99)),
    char_limit: 1,
    opened_x: room_width / 2,
    opened_y: room_height / 2,
})
add_child(spikeswitch_textbox)

elements_depth = layer_get_depth("WindowElements");
