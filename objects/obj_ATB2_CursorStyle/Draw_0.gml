/// @description Insert description here
if (ParentTextbox == undefined) {
	if !(ParentTextboxErrorShown) {
		show_error("obj_ATB2_CursorStyle (" + string(self) + ") has no ParentTextbox to look up to. =( Did you maybe mess up the create event of a ATB2 textbox by any chance?",false)
		ParentTextboxErrorShown = true;
		draw_self();
	}
} else {
	ParentTextboxErrorShown = false;
	if (ParentTextbox.IsSelected == true) {
		draw_self();
	} //else, do not draw self
}