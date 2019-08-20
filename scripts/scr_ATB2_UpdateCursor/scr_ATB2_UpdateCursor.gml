///@desc copied straight from the code (To use only with ATB2 Textboxes)
//Variable land
	var CursorLoop = true;
	var CursorLoopNumber = 0;
	var RemainingChar = CursorStringPosition;

	//Actual Code
	while (CursorLoop) {
		var CursorLoopLineLenght = string_length(ds_list_find_value(output,CursorLoopNumber));
		//show_debug_message(ds_list_find_value(output,CursorLoopNumber)); //debug code
		if (CursorLoopLineLenght < RemainingChar) { //Wrong line
			RemainingChar -= CursorLoopLineLenght;
			CursorLoopNumber += 1;
		} else { //Right line
			var CursorLoopLine = ds_list_find_value(output,CursorLoopNumber);
			CursorRelativePosition = RemainingChar;
			
			var CursorLoopString = string_delete(CursorLoopLine,RemainingChar + 1,string_length(CursorLoopLine));
			CursorHeightPosition = CursorLoopNumber;
			
			CursorXPosition = string_width(CursorLoopString) + OriginPointX;
			CursorYPosition = OriginPointY + (CursorHeightPosition * HeightPerLine);
			CursorLoop = false;
		}
	}