/// @description Show stuff
if !(variable_instance_exists(self,"QuickAccessId")) {
	show_message("Error with quick access. Activating error report");
	show_error("Quick access id was set to undefined",false);
	instance_destroy(self);
} else if (actualInit) {
	show_debug_message("Quick Access " + string(QuickAccessId) + " is reading");
	ini_open("Projects/QuickStart.ini");
	DirName = ini_read_string("DirName",string(QuickAccessId),"undefined");
	Date = ini_read_string("Date",string(QuickAccessId),"undefined");
	ini_close();
	
	if (DirName == "undefined" || Date == "undefined") {
		instance_destroy(self);
			show_debug_message("Quick Access " + string(QuickAccessId) + " is deleting itself");
	} else {
		actualInit = false;
	}
}
