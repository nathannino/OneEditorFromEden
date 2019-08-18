/// @description Delete everything
// You can write your code in this editor

//Taken straight from the Destroy event
for (var m = 0;m < ds_list_size(output);m++) {
	instance_destroy(ds_list_find_value(output,m));
}

ds_list_destroy(output);
instance_destroy(cursor);
instance_destroy(OriginPoint);
show_debug_message(TextboxName + " has been... DESTROYED. (Finished Destroy event)")
