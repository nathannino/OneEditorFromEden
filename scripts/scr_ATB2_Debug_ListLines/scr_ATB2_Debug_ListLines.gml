///@desc Print all of the different lines, but in the structured output format
if (ShowOutputDebugMessage) {
	var DebugOutputSize = ds_list_size(output);
	for (var iiii = 0; iiii < DebugOutputSize; iiii++) {
		show_debug_message("----------------------------------------------------");
		show_debug_message("[ATB2 Output Debugging] Line " + string(iiii) + " is :" + ds_list_find_value(output,iiii));
		show_debug_message("----------------------------------------------------");
	}
}