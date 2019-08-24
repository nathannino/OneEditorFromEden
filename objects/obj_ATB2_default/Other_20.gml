/// @description output cleanup and rewrite (Call when manually modifying input)
// You can write your code in this editor

//Basically, the goal is to read all characters from input
ds_list_clear(output);
ds_list_add(output,"\n")
CursorHeightPosition = 0;
CursorRelativePosition = 1;
for (var Tempi = 1; Tempi <= string_length(input);Tempi++) {
	var TempCurrentChar = string_char_at(input,Tempi);
	if (TempCurrentChar = "\n") {
		CursorHeightPosition += 1;
		ds_list_add(output,"\n");
		CursorRelativePosition = 1;
	} else {
		if (CursorRelativePosition == 0) { //this should not happen, but it's still there just in case
			ds_list_add(output,TempCurrentChar);
			CursorRelativePosition = 1;
			show_debug_message("[" + TextboxName + "] [UserEvent10] ERROR")
		} else {
			ds_list_replace(output,CursorHeightPosition,ds_list_find_value(output,CursorHeightPosition) + TempCurrentChar);
			CursorRelativePosition += 1;
		}
	}
}
CursorStringPosition = string_length(input);
scr_ATB2_UpdateCursor();

if (ShowTextUpdateMessage) {
	if (input != LastInput) {
		show_debug_message(TextboxName + "'s input has been updated to : " + input);
		LastInput = input;
	}
}