/// @description Handle the keyboard
// You can write your code in this editor

//show message
if !(ShownTextboxInitMessage) {
	show_debug_message(TextboxName + " has finished initialising and is doing it's first step event")
	ShownTextboxInitMessage = true;
}


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
	} else if (keyboard_check_pressed(ord("V")) && keyboard_check(vk_control)) {
		if (clipboard_has_text()) {
			var PastedString = clipboard_get_text();
			var PastedStringLength = string_length(PastedString);
			
			//put it in input
			input = string_insert(PastedString,input,CursorStringPosition + 1);
			
			//put it in output (Taken from user event 10, so will break if it does
			for (var i = 0;i < PastedStringLength;i++) {
				
				if (i != 0) {
					var CurrentChar = string_delete(PastedString,1,i);
				} else {
					var CurrentChar = PastedString;
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
	
		} //else, do nothing
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
	
	var SetPositionBack = false;
	//Do we have to move the origin point
	if (cursor.x > (x + image_xscale)) {
		Difference = ((x + image_xscale) - cursor.x) - 32;
		OriginPoint.x += Difference;
		SetPositionBack = true;
	} else if (cursor.x < x) {
		Difference = (x - cursor.x) + 32; //plus is just there to make it more fun
		OriginPoint.x += Difference;
		if (OriginPoint.x > x) {
			OriginPoint.x = x;
		}
		SetPositionBack = true;
	}
	
	//Move everything to OriginPoint
	var OutputLenght6 = ds_list_size(output);
	for (var i = 0; i < OutputLenght6; i++) {
		var LetterToModify6 = ds_list_find_value(output,i);
		
		if (i != 0) {
			LetterToModify6.x = (ds_list_find_value(output,i - 1).x + ds_list_find_value(output,i - 1).image_xscale);
		} else {
			LetterToModify6.x = OriginPoint.x;
			LetterToModify6.y = OriginPoint.y;
		}
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