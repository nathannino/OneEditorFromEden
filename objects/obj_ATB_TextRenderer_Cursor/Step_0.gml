/// @description Nah.

if (ParentTextbox != undefined) {
	if (x > (ParentTextbox.x + ParentTextbox.image_xscale)) {
		Difference = (ParentTextbox.x + ParentTextbox.image_xscale) - x;
		ParentTextbox.OriginPoint.x += Difference;
	} else if (x < ParentTextbox.x) {
		Difference = ParentTextbox.x - x
		ParentTextbox.OriginPoint.x += Difference
	}
}