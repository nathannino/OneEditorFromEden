/// @description Do the you know what when called by SplashScreen
// You can write your code in this editor

//Delete everything in OSFEsource
directory_destroy("OSFEsource");
directory_create("OSFEsource");

directory = inst_OSFEsourceTextbox.input;
file_copy(directory + "/Spells.xml","OSFEsource/Spells.xml");
file_copy(directory + "/Artifacts.xml","OSFEsource/Artifacts.xml");
file_copy(directory + "/Heroes.xml","OSFEsource/Heroes.xml");
file_copy(directory + "/Zones.xml","OSFEsource/Zones.xml");
file_copy(directory + "/TileCorners.xml","OSFEsource/TileCorners.xml");
file_copy(directory + "/TileBlocks.xml","OSFEsource/TileBlocks.xml");
file_copy(directory + "/Structures.xml","OSFEsource/Structures.xml");
file_copy(directory + "/Enemies.xml","OSFEsource/Enemies.xml");


instance_destroy(Splash);
obj_OEFE_StartScreen_ToolTip.CurrentToolTip = "Success! Every (found) files has been copied to OEFEsource (Current time is " + string(current_hour) + "h" + string(current_minute) + "min and " + string(current_second) + " seconds.)";