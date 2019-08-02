/// @description Handle the keyboard
// You can write your code in this editor

if (IsSelected) { //If this is the current textbox and we **pressed** a key
	
	var Length = string_length(input);
	
	//handle special cases
	if (keyboard_check(vk_backspace)) { //delete at the back of the cursor
		if (KeyboardTimeout == 0 || KeyboardTimeoutStarted = false) {
			if (CursorStringPosition != 0) { //if we have to delete stuff
				if (ds_list_find_value(output, CursorStringPosition - 1).ObjType == "Letter") { //if it's a letter
					input = string_delete(input, CursorStringPosition, 1);
					//rendering
					instance_destroy(ds_list_find_value(output, CursorStringPosition - 1),true);
					ds_list_delete(output, CursorStringPosition - 1);
					
					CursorStringPosition = CursorStringPosition - 1; //Fortunately, we check if it's not = to 0 before, so it's fine
					if (CursorStringPosition != 0) { //don't crash... please
						CursorXPosition = ds_list_find_value(output, CursorStringPosition - 1).x + ds_list_find_value(output, CursorStringPosition - 1).image_xscale;
					} else {
						CursorXPosition = x;
					}
				}
			}
			if (KeyboardTimeoutStarted == false) {
				KeyboardTimeoutStarted = true;
			} else {
				KeyboardTimeout = DefaultKeyboardTimeout;
			}
		} else {
			KeyboardTimeout -= 1;	
		}
	} else if (keyboard_check_released(vk_backspace)) {
		KeyboardTimeoutStarted = false;
		KeyboardTimeout = KeyboardTimeoutReset;
	} else if (keyboard_lastkey == vk_enter) { //As this is the normal one, just do nothing
		if (DisactivateOnEnter) {
			IsSelected = false;
			show_debug_message(TextboxName + " (" + string(self) + ") has been unselected")
		}
	} else if (keyboard_check(vk_alt)) {
		//do nothing
	} else if (keyboard_check(vk_control)) {
		//Again, do nothing now
	} else if (keyboard_check(vk_left)) { //Start handling left keyboard input
		if (KeyboardTimeoutStarted == false || KeyboardTimeout == 0) {	
			if (CursorStringPosition != 0) {
				CursorStringPosition = CursorStringPosition - 1; //Copied from the delete code
				if (CursorStringPosition != 0) { //don't crash... please
					CursorXPosition = ds_list_find_value(output, CursorStringPosition - 1).x + ds_list_find_value(output, CursorStringPosition - 1).image_xscale;
				} else {
					CursorXPosition = x;
				}
				if (KeyboardTimeoutStarted == false) {
					KeyboardTimeoutStarted = true;
				} else {
					KeyboardTimeout = DefaultKeyboardTimeout;
				}
			}
		} else {
			KeyboardTimeout -= 1;
		}
	} else if (keyboard_check_released(vk_left)) {
		KeyboardTimeoutStarted = false;
		KeyboardTimeout = KeyboardTimeoutReset;
	} else if (keyboard_check(vk_right)) { //right keyboard controls
		if (KeyboardTimeoutStarted == false || KeyboardTimeout == 0) {	
			if (CursorStringPosition != string_length(input)) {
				CursorStringPosition = CursorStringPosition + 1; //Copied from the delete code
				if (CursorStringPosition != 0) { //don't crash... please
					CursorXPosition = ds_list_find_value(output, CursorStringPosition - 1).x + ds_list_find_value(output, CursorStringPosition - 1).image_xscale;
				} else {
					CursorXPosition = x;
				}
				if (KeyboardTimeoutStarted == false) {
					KeyboardTimeoutStarted = true;
				} else {
					KeyboardTimeout = DefaultKeyboardTimeout;
				}
			}
		} else {
			KeyboardTimeout -= 1;
		}
	} else if (keyboard_check_released(vk_right)) {
		KeyboardTimeoutStarted = false;
		KeyboardTimeout = KeyboardTimeoutReset;
	} else if (keyboard_lastchar != "") { //if no special case, just add it
		input = string_insert(keyboard_lastchar,input,CursorStringPosition + 1);
		var newLetter = instance_create_depth(CursorXPosition, CursorYPosition, self.depth - 1, obj_ATB_TextRenderer_Letter);
		newLetter.Letter = keyboard_lastchar
		newLetter.ParentTextbox = self;
		newLetter.image_xscale = string_width(keyboard_lastchar);
		ds_list_insert(output,CursorStringPosition,newLetter);
		
		//update cursor
		CursorXPosition = newLetter.x + newLetter.image_xscale;
		CursorStringPosition +=1;
		
	}
	if (keyboard_lastchar != "") {
		show_debug_message("Updated textbox " + TextboxName + " (" + string(self) + "). Now is : " + input); //debug string
	}
	//update cursor even more
	if (CursorStringPosition != 0) {
		CursorXPosition = ds_list_find_value(output,CursorStringPosition - 1).x + ds_list_find_value(output,CursorStringPosition - 1).image_xscale;
		CursorYPosition = ds_list_find_value(output,CursorStringPosition - 1).y;
	} else {
		CursorXPosition = x;
		CursorYPosition = y;
		OriginPoint.x = x;
		OriginPoint.y = y;
	}
	cursor.x = CursorXPosition;
	cursor.y = CursorYPosition;

}