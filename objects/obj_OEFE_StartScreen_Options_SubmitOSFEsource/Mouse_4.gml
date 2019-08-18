/// @description Insert description here
// You can write your code in this editor

//Check if it's ok
directory = inst_OSFEsourceTextbox.input;

if(directory_exists(directory)) {
	Splash = instance_create_layer(0,0,"SplashScreen",obj_OEFE_SplashScreen);
	Splash.CalledBy = self;
} else {
	obj_OEFE_StartScreen_ToolTip.CurrentToolTip = "Directory not found"
}
