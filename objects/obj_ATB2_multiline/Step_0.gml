/// @description Main logic n stuff

//This is heavely inspired by ATB
if (true) {
//if (IsSelected) {
	if (keyboard_check(vk_backspace)) {
		if (scr_ATB2_KeyboardTimeoutCheck() && (CursorStringPosition != 0)) {
			//erase output
			var ErasedChar = string_char_at(input,CursorStringPosition); //if we want to remove /r, we could... but I would rather remove them when copy pasting then when doing this
			var TempVarDeleteString = ds_list_find_value(output,CursorHeightPosition);
			ds_list_replace(output,CursorHeightPosition,string_delete(TempVarDeleteString,CursorRelativePosition - 1,1));
			//erase input
			input = string_delete(input,CursorStringPosition,1);
			CursorStringPosition -= 1;
			scr_ATB2_UpdateCursor();
		}
	} else if (keyboard_check_released(vk_backspace)) {
		scr_ATB2_KeyboardTimeoutReset();	
	} else if (keyboard_lastchar != "") { //any letters
		var CharToWrite = keyboard_lastchar;
		CursorStringPosition += 1;
		
		input = string_insert(CharToWrite,input,CursorStringPosition);
		ds_list_replace(output,CursorHeightPosition,string_insert(CharToWrite,ds_list_find_value(output,CursorHeightPosition),CursorRelativePosition));

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