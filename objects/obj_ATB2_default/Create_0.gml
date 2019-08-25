/// @description This textbox should use less memory

//vars that you can change and that shouldn't break it
input = ""; //The raw text input
LastInput = "" //Like input, but used for debug message purpuses
//image_xscale //the witdh of the textbox
TextboxName = "\"Unnamed textbox\"" //The name of the textbox given in the console output
UsedFont = fnt_ATB_Default; //Do note that changing used font will also require you to change stuff like :
Cursor_image_yscale = 19; //The height of the cursor (set later in the create event)
HeightPerLine = Cursor_image_yscale; //The amount of pixel to move the cursor by new lines
OriginPointXMoving = 32; //random number... change this hard coded number to make it feel better
OriginPointYMoving = HeightPerLine; //You should use a multiple of HeightPerLine if possible
UseNewLines = true; //if enter should create a new line
PasteNewLines = true; //if copy pasting should keep the new lines
KeyboardTimeout = 40; //Amount of step events before executing an action for the second time (does not affect keyboard_lastchar)
KeyboardTimeoutStarted = false; //If the timeout has started or not
DefaultKeyboardTimeout = 2; //The amount of step events after the 2nd time
KeyboardTimeoutReset = KeyboardTimeout; //The amount to reset KeyboardTimeout to after releasing the key
AllowDebugReset = true; //This allows the user to press F6 to reload the cursor
ShowCursorDebugCode = true; //Print some debug stuff to the console [Also, CursorStringPosition should be 1 lower than CursorRelativePosition in the first line]
ShowUpDownDebugMessage = false; //Prints some more stuff to the console, revolving around the up and down arrow
ShowTextUpdateMessage = false; //Prints the raw input text when input gets modified
ShowOutputDebugMessage = true; //Prints all of output... all of it. (It's a bit like ShowTextUpdateMessage, but seperated by lines. If you are creating a custom version of ATB2 and there is a problem with the cursor, check this instead of ShowTextUpdateMessage)

//For the textbox only [That means that you could break stuff here]
CursorXPosition = x; //The x position of the cursor
CursorYPosition = y; //The y position of the cursor
CursorStringPosition = 0 //The string position of the cursor
CursorHeightPosition = 0; //The line it is in
cursor = instance_create_depth(CursorXPosition,CursorYPosition,self.depth - 3,obj_ATB2_CursorStyle);
cursor.ParentTextbox = self;
cursor.image_yscale = Cursor_image_yscale;
IsSelected = false; //If the textbox is selected
CanChangeSelected = true; //Change if the current textbox can decide to change or not
// obj_ATB2_SelectableManager.CanChangeSelected //If the textbox can be selected
OriginPointX = x;
OriginPointY = y;
output = ds_list_create();
ds_list_clear(output);
ds_list_add(output,"\n"); //this is so that nothing will break =P 
CursorRelativePosition = 1; //The relative position of the cursor (usefull for stuff like up arrow) [The value 1 is given because of the \n]
TextSurface = undefined;