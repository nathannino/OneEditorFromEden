/// @description Be cool with your stuff

ds_list_destroy(output);
if !((TextSurface == undefined) || (surface_exists(TextSurface))) {
	surface_free(TextSurface);
}
if (instance_exists(cursor)) {
	instance_destroy(cursor);
}

show_debug_message(TextboxName + " has finished it's clean up event");