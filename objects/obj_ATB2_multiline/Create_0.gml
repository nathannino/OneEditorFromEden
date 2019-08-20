/// @description This textbox should use less memory
// You can write your code in this editor

//vars to use
input = ""; //The raw text input
//image_xscale //the witdh of the textbox
TextboxName = "\"Unnamed textbox\"" //The name of the textbox given in the console output
HeightPerLine = 18; //The amount of pixel to move the cursor by new lines
OriginPointXMoving = 32; //random number... change this hard coded number to make it feel better
OriginPointYMoving = HeightPerLine; //You should use a multiple of HeightPerLine if possible
UseNewLines = true; //if enter should create a new line
PasteNewLines = true; //if copy pasting should keep the new lines
KeyboardTimeout = 40; //Amount of step events before executing an action for the second time (does not affect keyboard_lastchar)
KeyboardTimeoutStarted = false; //If the timeout has started or not
DefaultKeyboardTimeout = 2; //The amount of step events after the 2nd time
KeyboardTimeoutReset = KeyboardTimeout; //The amount to reset KeyboardTimeout to after releasing the key

//For the textbox only
CursorXPosition = x; //The x position of the cursor
CursorYPosition = y; //The y position of the cursor
CursorStringPosition = 0 //The string position of the cursor
CursorHeightPosition = 0; //The line it is in
CursorRelativePosition = 0; //The relative position of the cursor (usefull for stuff like up arrow)
cursor = instance_create_depth(CursorXPosition,CursorYPosition,self.depth - 3,obj_ATB2_CursorStyle);
cursor.ParentTextbox = self;
IsSelected = false; //If the textbox is selected
CanChangeSelected = true; //Change if the current textbox can decide to change or not
// obj_ATB2_SelectableManager.CanChangeSelected //If the textbox can be selected
OriginPointX = x;
OriginPointY = y;
output = ds_list_create();
ds_list_clear(output);
ds_list_add(output,"");
TextSurface = undefined;