///@desc Look for all the folders in the Add-Ons directory and put it in a ds_list
///@args ds_list The ds_list to use

var ds_list_used = argument0;
var AddonsDir = "Add-ons/"; //just to be faster

var CurrentFound = file_find_first(AddonsDir,fa_directory);
if (CurrentFound != "") {
	ds_list_add(ds_list_used,CurrentFound);
	
	while (CurrentFound != "") {
		CurrentFound = file_find_next();
		
		if (CurrentFound != "") {
			ds_list_add(ds_list_used,CurrentFound);
		}
	}
}

file_find_close()
