/// @description Initialize stuff

TextboxName = "\"Unnamed normal textbox\"" //Used for debuging what is selected (no need to change it, but you can to help yourself)

input = ""; //The text/input written in the textbox
IsSelected = false; //if it is currently listening to stuff
CharacterLimit = -1; //Set to -1 if no character limit
DisactivateOnEnter = true; //Does it deselect itself when we press enter

//Stuff that shouldn't be changed
image_yscale = 32; //We built on that, changing it would need to change how we handle the characters n stuff
output = ds_list_create(); //What is shown
ds_list_clear(output);

//cursor stuff
CursorXPosition = x;
CursorYPosition = y;
cursor = instance_create_depth(CursorXPosition,CursorYPosition,self.depth - 2,obj_ATB_TextRenderer_Cursor);
cursor.ParentTextbox = self;
CursorStringPosition = 0;

//keyboard stuff
KeyboardTimeout = 40;
DefaultKeyboardTimeout = 2;
KeyboardTimeoutReset = KeyboardTimeout;
KeyboardTimeoutStarted = false;

//Origin point
OriginPoint = instance_create_depth(x,y,self.depth - 1,obj_ATB_TextRenderer_Origin);
OriginPoint.ParentTextbox = self;

