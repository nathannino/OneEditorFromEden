/// @description Getting the written stuff from the keyboard
// You can write your code in this editor
if (IsSelected && (keyboard_lastchar != "")) { //If this is the current textbox and we **pressed** a key
	
	var Length = string_length(input);
	
	//handle special cases
	if (keyboard_lastkey == vk_backspace) {
		show_debug_message("Special character : backspace");
		
		input = string_delete(input, Length, 1);
		
	} else if (keyboard_lastkey == vk_enter) { //As this is the normal one, just do nothing
		show_debug_message("Special character : backspace");
		
		IsSelected = false;
		show_debug_message(TextboxName + " (" + string(self) + ") has been unselected")
	} else { //if no special case, just add it
		input += keyboard_lastchar;
	}
	
	show_debug_message("Updated textbox " + TextboxName + " (" + string(self) + "). Now is : " + input); //debug string
	
	//end the thing
	keyboard_lastchar = "";
}