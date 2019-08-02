/// @description Create textbox

textbox = instance_create_layer(x,y,"Instances_DebugTesting",obj_ATB_normal);
textbox.image_xscale = 256;

textbox2 = instance_create_layer(x,0,"Instances_DebugTesting",obj_ATB_normal);
textbox2.image_xscale = 256;
textbox2.TextboxName = "The top one";