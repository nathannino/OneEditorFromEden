/// @description Change selected status

//If mouse is selecting it
if ( ((x <= mouse_x) && (mouse_x <= (x+image_xscale)) ) && (y <= mouse_y) && (mouse_y <= (y+image_yscale))) {
	IsSelected = true;
	cursor.IsSelected = true;
	show_debug_message(TextboxName + " (" + string(self) + ") is the currently selected textbox");
} else if (IsSelected) { //Unselect it
	IsSelected = false;
	cursor.IsSelected = true;
	show_debug_message(TextboxName + " (" + string(self) + ") has been unselected")
}