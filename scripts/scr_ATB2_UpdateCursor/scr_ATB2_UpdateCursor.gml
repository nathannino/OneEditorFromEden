///@desc copied straight from the code (To use only with ATB2 Textboxes)
//Variable land
	var CursorLoop = true;
	var CursorLoopNumber = 0;
	var RemainingChar = CursorStringPosition + 1;

	//Actual Code
	while (CursorLoop) {
		var CursorLoopLineLenght = string_length(ds_list_find_value(output,CursorLoopNumber));
		
		if (ShowCursorDebugCode) {
			show_debug_message("----------------------------------------------------");
			show_debug_message("[ATB2_UpdateCursor] Current line is : " + ds_list_find_value(output,CursorLoopNumber)); //debug code
			show_debug_message("[ATB2_UpdateCursor] Current line length is = " + string(CursorLoopLineLenght));
			show_debug_message("----------------------------------------------------");
		}
		if (CursorLoopLineLenght < RemainingChar) { //Wrong line
			RemainingChar -= CursorLoopLineLenght;
			CursorLoopNumber += 1;
		} else { //Right line
			if (ShowCursorDebugCode) {
				var DebugOutputCharAt = string_char_at(ds_list_find_value(output,CursorLoopNumber),RemainingChar);
				var DebugOutputStringWidth = string_width(string_delete(ds_list_find_value(output,CursorLoopNumber),RemainingChar,string_length(ds_list_find_value(output,CursorLoopNumber))));
			}
			var CursorLoopLine = ds_list_find_value(output,CursorLoopNumber);
			CursorRelativePosition = RemainingChar;
			
			var CursorLoopString = string_delete(CursorLoopLine,RemainingChar + 1,string_length(CursorLoopLine));
			CursorHeightPosition = CursorLoopNumber;
			
			draw_set_font(UsedFont);
			CursorXPosition = string_width(CursorLoopString) + OriginPointX;
			CursorYPosition = OriginPointY + (CursorHeightPosition * HeightPerLine);
			CursorLoop = false;
		}
	}
	//final debug code
	if (ShowCursorDebugCode) {
		show_debug_message("----------------------------------------------------");
		show_debug_message("[ATB2_UpdateCursor] CursorRelativePosition = " + string(CursorRelativePosition));
		show_debug_message("[ATB2_UpdateCursor] CursorStringPosition = " + string(CursorStringPosition));
		show_debug_message("[ATB2_UpdateCursor] Current Character is : " + DebugOutputCharAt);
		show_debug_message("[ATB2_UpdateCursor] Current CursorHeightPosition = " + string(CursorHeightPosition));
		show_debug_message("{ATB2_UpdateCursor] Current Cursor String Width = " + string(DebugOutputStringWidth));
		show_debug_message("----------------------------------------------------");
	}
	scr_ATB2_Debug_ListLines();