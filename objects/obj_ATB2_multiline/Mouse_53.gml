/// @description Modify the selected variable

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