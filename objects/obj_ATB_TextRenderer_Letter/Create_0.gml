/// @description Default text rendering stuff

Letter = " ";
Color = c_black;
Font = fnt_ATB_Default;
ds_list = undefined;
ParentTextbox = undefined;
ObjType = "Letter";
IsShowing = true;

//The size of each letter (do note that it means there is an equal space between and it can look wierd. Also, this is hard coded. Modifying this can make some stuff work and some stuff fail)
image_xscale = 12; //default, but changes just after it has been created
image_yscale = 32;