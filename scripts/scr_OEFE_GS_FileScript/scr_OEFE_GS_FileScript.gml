///@desc The script that makes sure the files are there and loads some of them

//Options

//Editor files

//Project files
if (!file_exists("Projects/QuickStart.ini")) { //weak 1\1hp ini file for the quick access tab in the StartScreen
	ini_open("Projects/QuickStart.ini");
	
	ini_write_real("Last","HasClosed",1);
	
	ini_write_string("DirName","5","undefined");
	ini_write_string("DirName","4","undefined");
	ini_write_string("DirName","3","undefined");
	ini_write_string("DirName","2","undefined");
	ini_write_string("DirName","1","undefined");
	
	ini_write_string("Date","5","undefined");
	ini_write_string("Date","4","undefined");
	ini_write_string("Date","3","undefined");
	ini_write_string("Date","2","undefined");
	ini_write_string("Date","1","undefined");
	
	ini_write_string("Unused","Description","This file is used to show the 5 most recent mods in the Start Screen")

	ini_close();
}