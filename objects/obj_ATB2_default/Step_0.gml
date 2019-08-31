/// @description Main logic n stuff

//This is heavely inspired by ATB, but also way better than ATB [Also, ATB wasn't even released, so...]
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
				ds_list_replace(output,CursorHeightPosition,ds_list_find_value(output,CursorHeightPosition) + string_delete(TempVarDeleteString,CursorRelativePosition,1))
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
	} else if (keyboard_check(vk_control) && keyboard_check_pressed(ord("V"))) { //Paste what is in the pastebin
		if (clipboard_has_text()) {
			var ClipboardToPaste = clipboard_get_text();
			//Step 1 : Remove the \r, \f, \v and other special character we don't use
			ClipboardToPaste = string_replace_all(ClipboardToPaste,"\r","");
			ClipboardToPaste = string_replace_all(ClipboardToPaste,"\f","");
			ClipboardToPaste = string_replace_all(ClipboardToPaste,"\v","");
			if !(PasteNewLines) {
				ClipboardToPaste = string_replace_all(ClipboardToPaste,"\n","");
			}
			//Step 2 : Input ftw
			input = string_insert(ClipboardToPaste,input,CursorStringPosition + 1);
			CursorStringPosition += string_length(ClipboardToPaste);
			//Step 3 : Don't forget the output
			/*
						What to remember
					- We need to check how many new lines we have					[CheckingText]
					- We need to seperate each new line in a new ds_list entry		[PastingText]
					- We need to copy back the text that was after					[RemainingText]
			*/
			var RemainingTextPaste = string_delete(ds_list_find_value(output,CursorHeightPosition),1,CursorRelativePosition); //Get the remaining text
			ds_list_replace(output,CursorHeightPosition,string_delete(ds_list_find_value(output,CursorHeightPosition),CursorRelativePosition+1,string_length(ds_list_find_value(output,CursorHeightPosition)))); //Remove said remaining text from the output
			while (string_count("\n",ClipboardToPaste)) { //while there are still \n
				var ClipboardCurrentPasting = string_delete(ClipboardToPaste,string_pos("\n",ClipboardToPaste),string_length(ClipboardToPaste));
				ds_list_replace(output,CursorHeightPosition,string_insert(ClipboardCurrentPasting,ds_list_find_value(output,CursorHeightPosition),CursorRelativePosition + 1));
				ClipboardToPaste = string_delete(ClipboardToPaste,1,string_length(ClipboardCurrentPasting) + 1);
				CursorHeightPosition += 1;
				ds_list_insert(output,CursorHeightPosition,"\n");
			} //When there are no n
			ds_list_replace(output,CursorHeightPosition,ds_list_find_value(output,CursorHeightPosition) + ClipboardToPaste + RemainingTextPaste); //Add everything else
			//Step Final
			scr_ATB2_UpdateCursor();
		}
	} else if (keyboard_check(vk_left)) { //move left
		if (scr_ATB2_KeyboardTimeoutCheck() && (CursorStringPosition != 0)) {
			CursorStringPosition -= 1;
			scr_ATB2_UpdateCursor();
		}
	} else if (keyboard_check_released(vk_left)) {
		scr_ATB2_KeyboardTimeoutReset();
	} else if (keyboard_check(vk_right)) { //move right
		if (scr_ATB2_KeyboardTimeoutCheck() && (CursorStringPosition != string_length(input))) {
			CursorStringPosition += 1;
			scr_ATB2_UpdateCursor();
		}
	} else if (keyboard_check_released(vk_right)) {
		scr_ATB2_KeyboardTimeoutReset();
	} else if (keyboard_check(vk_up)) { //move up
		if (scr_ATB2_KeyboardTimeoutCheck() && (CursorHeightPosition != 0)) {
			//Let's rework this!
			/*
			The way the new rework is gonna work is that we will
			A) Check the width of the current line
			B) Check the width of the other line
			C) Get as close to the same width as possible
			This will remove some of the confusion, but will be a tiny bit harder to do.
			*/
			var CurrentLineString = string_delete(ds_list_find_value(output,CursorHeightPosition),CursorRelativePosition + 1,string_length(ds_list_find_value(output,CursorHeightPosition)));;
			var OtherLine = CursorHeightPosition-1;
			var OtherLineString = ds_list_find_value(output,OtherLine);
			var OtherLineLength = string_length(ds_list_find_value(output,OtherLine));
			var NewCursorRelativePosition;
			//The place of the rework
			var CurrentLineWidth = string_width(CurrentLineString);
			var OtherLineWidth = string_width(OtherLineString);
			if (CurrentLineWidth >= OtherLineWidth) {
				NewCursorRelativePosition = OtherLineLength;
				LastWidth = string_width(OtherLineWidth);
				LastString = OtherLineString;
			} else {
				var CursorTempLoop = true;
				var CursorTempLoopPosition = 2; //One happens to be the newline. Let's use 2 instead [UPDATE : IT WORKED =O
				while (CursorTempLoop) {
					var LastWidth = string_width(string_delete(OtherLineString,CursorTempLoopPosition,string_length(OtherLineString)));
					var LastString = string_delete(OtherLineString,CursorTempLoopPosition,string_length(OtherLineString));
					if (LastWidth >= CurrentLineWidth) {
							NewCursorRelativePosition = CursorTempLoopPosition - 1;
							CursorTempLoop = false;
					} else {
						CursorTempLoopPosition += 1;
					}
				}
			}
			//Get the specific string
			var CombinedString = string_delete(ds_list_find_value(output,OtherLine),1,NewCursorRelativePosition) + string_delete(ds_list_find_value(output,CursorHeightPosition),CursorRelativePosition + 1,string_length(ds_list_find_value(output,CursorHeightPosition)));
			if (ShowUpDownDebugMessage) {
				show_debug_message("----------------------------------------------------");
				show_debug_message("[ATB2 Debug] CombinedString = " + CombinedString);
				show_debug_message("[ATB2 Debug] CurrentString = " + CurrentLineString);
				show_debug_message("[ATB2 Debug] CurrentString with cursor = " + LastString);
				show_debug_message("[ATB2 Debug] CursorRelativePosition = " + string(CursorRelativePosition));
				show_debug_message("[ATB2 Debug] Current String Width = " + string(CurrentLineWidth));
				show_debug_message("[ATB2 Debug] NewCursorRelativePosition = " + string(NewCursorRelativePosition));
				show_debug_message("[ATB2 Debug] New String Width = " + string(LastWidth));
				show_debug_message("----------------------------------------------------");
			}
			CursorStringPosition -= string_length(CombinedString);
			scr_ATB2_UpdateCursor();
		}
	} else if (keyboard_check_released(vk_up)) {
		scr_ATB2_KeyboardTimeoutReset();
	} else if (keyboard_check(vk_down)) { //move down
		if (scr_ATB2_KeyboardTimeoutCheck() && (ds_list_size(output) - 1 != CursorHeightPosition)) {
			var CurrentLineString = string_delete(ds_list_find_value(output,CursorHeightPosition),CursorRelativePosition + 1,string_length(ds_list_find_value(output,CursorHeightPosition)));;
			var OtherLine = CursorHeightPosition+1;
			var OtherLineString = ds_list_find_value(output,OtherLine);
			var OtherLineLength = string_length(ds_list_find_value(output,OtherLine));
			var NewCursorRelativePosition;
			//The place of the rework
			var CurrentLineWidth = string_width(CurrentLineString);
			var OtherLineWidth = string_width(OtherLineString);
			if (CurrentLineWidth >= OtherLineWidth) {
				NewCursorRelativePosition = OtherLineLength;
				LastWidth = string_width(OtherLineWidth);
				LastString = OtherLineString;
			} else {
				var CursorTempLoop = true;
				var CursorTempLoopPosition = 2; //One happens to be the newline. Let's use 2 instead [UPDATE : IT WORKED =O
				while (CursorTempLoop) {
					var LastWidth = string_width(string_delete(OtherLineString,CursorTempLoopPosition,string_length(OtherLineString)));
					var LastString = string_delete(OtherLineString,CursorTempLoopPosition,string_length(OtherLineString));
					if (LastWidth >= CurrentLineWidth) {
							NewCursorRelativePosition = CursorTempLoopPosition - 1;
							CursorTempLoop = false;
					} else {
						CursorTempLoopPosition += 1;
					}
				}
			}
			//Get the specific string
			var CombinedString = string_delete(ds_list_find_value(output,CursorHeightPosition),1,CursorRelativePosition) + string_delete(ds_list_find_value(output,OtherLine),NewCursorRelativePosition + 1,string_length(ds_list_find_value(output,OtherLine)));
			if (ShowUpDownDebugMessage) {
				show_debug_message("----------------------------------------------------");
				show_debug_message("[ATB2 Debug] CombinedString = " + CombinedString);
				show_debug_message("[ATB2 Debug] CurrentString = " + CurrentLineString);
				show_debug_message("[ATB2 Debug] CurrentString with cursor = " + LastString);
				show_debug_message("[ATB2 Debug] CursorRelativePosition = " + string(CursorRelativePosition));
				show_debug_message("[ATB2 Debug] Current String Width = " + string(CurrentLineWidth));
				show_debug_message("[ATB2 Debug] NewCursorRelativePosition = " + string(NewCursorRelativePosition));
				show_debug_message("[ATB2 Debug] New String Width = " + string(LastWidth));
				show_debug_message("----------------------------------------------------");
			}
			CursorStringPosition += string_length(CombinedString);
			scr_ATB2_UpdateCursor();
		}
	} else if (keyboard_check_released(vk_down)) {
		scr_ATB2_KeyboardTimeoutReset();
	} else if (keyboard_check(vk_control)) {
		//Do nothing if control is pressed and there is no combinason
		//Also, here is where you can place the debugging keybinds
		if (AllowDebugMessageKeys) {
			if (keyboard_check_pressed(vk_f9)) {
				ShowCursorDebugCode = !ShowCursorDebugCode;
				show_debug_message("[DebugMessageKey] ShowCursorDebugCode has been toggled");
			} else if (keyboard_check_pressed(vk_f10)) {
				ShowOutputDebugMessage = !ShowOutputDebugMessage;
				show_debug_message("[DebugMessageKey] ShowOutputDebugMessage has been toggled");
			} else if (keyboard_check_pressed(vk_f11)) {
				ShowTextUpdateMessage = !ShowTextUpdateMessage;
				show_debug_message("[DebugMessageKey] ShowTextUpdateMessage has been toggled");
			} else if (keyboard_check_pressed(vk_f12)) {
				ShowUpDownDebugMessage = !ShowUpDownDebugMessage;
				show_debug_message("[DebugMessageKey] ShowUpDownDebugMessage has been toggled");
			}
		}
	} else if (keyboard_lastchar != "") { //any letters
		var CharToWrite = keyboard_lastchar;
		CursorStringPosition += 1;
		
		input = string_insert(CharToWrite,input,CursorStringPosition);
		ds_list_replace(output,CursorHeightPosition,string_insert(CharToWrite,ds_list_find_value(output,CursorHeightPosition),CursorRelativePosition + 1));		

		scr_ATB2_UpdateCursor();
	}
	
	if (ShowTextUpdateMessage) {
		if (input != LastInput) {
			show_debug_message("----------------------------------------------------");
			show_debug_message("[ShowTextUpdateMessage]" + TextboxName + "'s input has been updated to : " + input);
			show_debug_message("----------------------------------------------------");
			LastInput = input;
		}
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
	if (cursor.y < y) {
		OriginPointY += OriginPointYMoving;
		scr_ATB2_UpdateCursor();
	} else if ((cursor.y + cursor.image_yscale) > (y + image_yscale)) {
		OriginPointY -= OriginPointYMoving;
		scr_ATB2_UpdateCursor();
	}
}