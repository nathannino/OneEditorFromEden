/// @description output cleanup and rewrite (Call when manually modifying input)
// You can write your code in this editor

//Basically, the goal is to read all characters from input
ds_list_clear(output);
CursorHeightPosition = 0;
for (var Tempi = 1; Tempi <= string_length(input);Tempi++) {
	var TempCurrentChar = string_char_at(input,Tempi);
	if (TempCurrentChar = "\n") {
		CursorHeightPosition += 1;
		ds_list_add(output,"\n");
		CursorRelativePosition = 1;
	} else {
		if (CursorRelativePosition == 0) {
			ds_list_add(output,TempCurrentChar);
			CursorRelativePosition = 1;
		} else {
			ds_list_replace(output,CursorHeightPosition,ds_list_find_value(output,CursorHeightPosition) + TempCurrentChar);
			CursorRelativePosition += 1;
		}
	}
}
CursorStringPosition = string_length(input);
scr_ATB2_UpdateCursor();