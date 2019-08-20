/// @description This textbox should use less memory
// You can write your code in this editor

//vars to use
input = ""; //The raw text input
//image_xscale //the witdh of the textbox
LineNumber = 1// The height of the textbox (Line number * 32)
TextboxName = "\"Unnamed textbox\""
HeightPerLine = 18;
// How many should it move by
OriginPointXMoving = 32; //random number... change this hard coded number to make it feel better
OriginPointYMoving = HeightPerLine; //Same thing as above, except for vertical movement;
UseNewLines = true;


//For the textbox only
CursorXPosition = x; //The x position of the cursor
CursorYPosition = y; //The y position of the cursor
CursorStringPosition = 0 //The string position of the cursor
CursorHeightPosition = 0; //The line it is in
CursorRelativePosition = 0; //The relative position of the cursor (usefull for stuff like up arrow)
cursor = instance_create_depth(CursorXPosition,CursorYPosition,self.depth - 3,obj_ATB2_CursorStyle);
cursor.ParentTextbox = self;
IsSelected = false; //If the textbox is selected
// obj_ATB2_SelectableManager.CanChangeSelected //If the textbox can be selected
KeyboardTimeout = 40;
KeyboardTimeoutStarted = false;
DefaultKeyboardTimeout = 2;
KeyboardTimeoutReset = KeyboardTimeout;
OriginPointX = x;
OriginPointY = y;
output = ds_list_create();
ds_list_clear(output);
ds_list_add(output,"");
TextSurface = undefined;