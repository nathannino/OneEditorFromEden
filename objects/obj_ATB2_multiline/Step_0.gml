/// @description Main logic n stuff

//This is heavely inspired by ATB
if (IsSelected) {
	if (keyboard_check_pressed(vk_anykey)) { //just to not chain stuff too fast
		scr_ATB2_KeyboardTimeoutReset();
	}
	
	if (keyboard_check(vk_backspace)) {
		if (scr_ATB2_KeyboardTimeoutCheck() && (CursorStringPosition != 0)) {
			//erase output
			var ErasedChar = string_char_at(input,CursorStringPosition); //if we want to remove /r, we could... but I would rather remove them when copy pasting then when doing this
			var TempVarDeleteString = ds_list_find_value(output,CursorHeightPosition);
			if (ErasedChar == "\n") {
				ds_list_delete(output,CursorHeightPosition);
				CursorHeightPosition -= 1;
				ds_list_replace(output,CursorHeightPosition,ds_list_find_value(output,CursorHeightPosition) + string_delete(TempVarDeleteString,CursorRelativePosition + 1,1))
			} else {
				ds_list_replace(output,CursorHeightPosition,string_delete(TempVarDeleteString,CursorRelativePosition,1));
			}
			//erase input
			input = string_delete(input,CursorStringPosition,1);
			CursorStringPosition -= 1;
			scr_ATB2_UpdateCursor();
		}
	} else if (keyboard_check_released(vk_backspace)) {
		scr_ATB2_KeyboardTimeoutReset();	
	} else if (keyboard_check(vk_enter)) { //do a new line
		if (scr_ATB2_KeyboardTimeoutCheck() && UseNewLines) {
			CursorStringPosition += 1;
			input = string_insert("\n",input,CursorStringPosition);
			
			var tempoldline = ds_list_find_value(output,CursorHeightPosition);
			CursorHeightPosition += 1;
			if (CursorRelativePosition == string_length(tempoldline)) {
				ds_list_insert(output,CursorHeightPosition,"\n");
			} else {
				ds_list_replace(output,CursorHeightPosition - 1, string_delete(tempoldline,CursorRelativePosition + 1,string_length(tempoldline)));
				ds_list_insert(output,CursorHeightPosition,"\n" + string_delete(tempoldline,1,CursorRelativePosition));
			}
			scr_ATB2_UpdateCursor();
		}
	} else if (keyboard_check_released(vk_enter)) {
		scr_ATB2_KeyboardTimeoutReset();
	} else if (keyboard_check(vk_left)) {
		if (scr_ATB2_KeyboardTimeoutCheck() && (CursorStringPosition != 0)) {
			CursorStringPosition -= 1;
			scr_ATB2_UpdateCursor();
		}
	} else if (keyboard_check_released(vk_left)) {
		scr_ATB2_KeyboardTimeoutReset();
	} else if (keyboard_check(vk_right)) {
		if (scr_ATB2_KeyboardTimeoutCheck() && (CursorStringPosition != string_length(input))) {
			CursorStringPosition += 1;
			scr_ATB2_UpdateCursor();
		}
	} else if (keyboard_check_released(vk_right)) {
		scr_ATB2_KeyboardTimeoutReset();
	} else if (keyboard_lastchar != "") { //any letters
		var CharToWrite = keyboard_lastchar;
		CursorStringPosition += 1;
		
		input = string_insert(CharToWrite,input,CursorStringPosition);
		ds_list_replace(output,CursorHeightPosition,string_insert(CharToWrite,ds_list_find_value(output,CursorHeightPosition),CursorRelativePosition + 1));

		scr_ATB2_UpdateCursor();
	}
	
	if (keyboard_lastchar != "") {
		show_debug_message(TextboxName + "'s input has been updated to : " + input);
	}
}

cursor.x = CursorXPosition;
cursor.y = CursorYPosition;

//Origin point stuff
{ //X coordonate
	if (cursor.x < x) {
		OriginPointX += OriginPointXMoving;
		scr_ATB2_UpdateCursor();
	} else if (cursor.x > (x + image_xscale)) {
		OriginPointX -= OriginPointXMoving;
		scr_ATB2_UpdateCursor();
	}
}
{ //Y coordonate
	
}