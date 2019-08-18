/// @description Reset textbox

//this will delete everything and build it back up using input

show_debug_message(TextboxName + "'s User Event 10 has been called, prepare for a small lag spike");

for (var m = 0;m < ds_list_size(output);m++) {
	instance_destroy(ds_list_find_value(output,m));
}

ds_list_destroy(output);
instance_destroy(cursor);
instance_destroy(OriginPoint);
show_debug_message(TextboxName + " has been... CLEANED!!! (Time to build it back up)");


//Create part 2
output = ds_list_create(); //What is shown
ds_list_clear(output);


//cursor stuff
CursorXPosition = x;
CursorYPosition = y;
cursor = instance_create_depth(CursorXPosition,CursorYPosition,self.depth - 2,obj_ATB_TextRenderer_Cursor);
cursor.ParentTextbox = self;
CursorStringPosition = 0;

//Origin point
OriginPoint = instance_create_depth(x,y,self.depth - 1,obj_ATB_TextRenderer_Origin);
OriginPoint.ParentTextbox = self;

show_debug_message(TextboxName + " has finished the fake create event and will now read from input");


//Create everything
var InputLenght = string_length(input);

for (var i = 0;i < InputLenght;i++) {
	
	if (i != 0) {
		var CurrentChar = string_delete(input,1,i);
	} else {
		CurrentChar = input;
	}
	CurrentChar = string_delete(CurrentChar,2,string_length(CurrentChar) -1);
	
	//taken and adapted from step event
	var newLetter = instance_create_depth(CursorXPosition, CursorYPosition, self.depth - 1, obj_ATB_TextRenderer_Letter);
	newLetter.Letter = CurrentChar;
	newLetter.ParentTextbox = self;
	newLetter.image_xscale = string_width(CurrentChar);
	ds_list_insert(output,CursorStringPosition,newLetter);
	
	//update cursor
	CursorXPosition = newLetter.x + newLetter.image_xscale;
	CursorStringPosition +=1;
}
		
show_debug_message(TextboxName + " has finished User Event 10. (Remember that this code could break when adding new lines)");