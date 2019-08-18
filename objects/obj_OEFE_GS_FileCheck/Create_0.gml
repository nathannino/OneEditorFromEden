/// @description Create all needed files if not found.
// This is the place where you can see what each file is for

//Create the directories
if !(directory_exists("Projects")) {
	directory_create("Projects"); //Used as the working directory of mods
} if !(directory_exists("OSFEsource")) {
	directory_create("OSFEsource"); //Used to not actually give the source xml (We also need a OEFExml dir added to it)
} if !(directory_exists("Backups")) {
	directory_create("Backups"); //The actual save n stuff (since working directory auto-saves)
} if !(directory_exists("Add-ons")) {
	directory_create("Add-ons"); //Adding the smaller libraries n stuff to a directory to take back from
} if !(directory_exists("Editor")) {
	directory_create("Editor"); //Xml files to change the modules of the editor
} if !(directory_exists("OEFExml")) {
	directory_create("OEFExml"); //Xml files to tell the editor what the lua files do in OSFEsource [Takes priority]
}

//load some of the files to globals
scr_OEFE_GS_FileScript();

//End
room_goto_next();
