// TARGET: LINENUMBER
// 3
if ds_exists(global.floorspikes_list, 2)
    ds_list_destroy(global.floorspikes_list)
if ds_exists(global.switchspikes_list, 2)
    ds_list_destroy(global.switchspikes_list)
if ds_exists(global.tp_list, 2)
    ds_list_destroy(global.tp_list)