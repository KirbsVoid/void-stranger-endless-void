function ev_write_tile_data_to_csv(argument0, argument1) //gml_Script_write_tile_data_to_csv
{
    var layer_index = argument[0]
    var filename = argument[1]
    var file = file_text_open_write(working_directory + "/tiles/" + filename)
    var a = layer_get_all_elements(layer_index)
    if (array_length(a) > 0)
    {
        for (var i = 0; i < 9; i++)
        {
            for (var j = 0; j < 14; j++)
            {
                file_text_write_string(file, string(tilemap_get_at_pixel(a[0], (8 + j * 16), (8 + i * 16))))
                if (j != 13)
                    file_text_write_string(file, ";")
            }
            file_text_write_string(file, "\n")
        }
    }
    file_text_close(file)
}

