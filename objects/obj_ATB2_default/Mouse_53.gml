/// @description Modify the selected variable

var WasSelected = IsSelected;
if (CanChangeSelected) {
	if (mouse_x >= x) {
		if (mouse_x <= (x + image_xscale)) {
			if (mouse_y >= y) {
				if (mouse_y <= (y + image_yscale)) {
					IsSelected = true;
				} else {
					IsSelected = false;
				}
			} else {
				IsSelected = false;
			}
		} else {
			IsSelected = false;
		}
	} else {
		IsSelected = false;
	}
}

if (IsSelected) {
	show_debug_message(TextboxName + " has been selected");	
} else if (WasSelected) {
	show_debug_message(TextboxName + " has been unselected");
}