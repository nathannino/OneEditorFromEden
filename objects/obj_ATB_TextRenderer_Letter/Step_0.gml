/// @description Modify positions

ds_list = ParentTextbox.output;

var ds_list_position = ds_list_find_index(ds_list,self);

image_xscale = string_width(Letter);

if (ds_list_position != 0) {
	x = (ds_list_find_value(ds_list,ds_list_position - 1).x + ds_list_find_value(ds_list,ds_list_position - 1).image_xscale);
} else {
	x = ParentTextbox.OriginPoint.x;
	y = ParentTextbox.OriginPoint.y;
}

//Do we show it
if (x < ParentTextbox.x) {
	IsShowing = false;
} else if ((x + image_xscale) > (ParentTextbox.x + ParentTextbox.image_xscale)) {
	IsShowing = false;
} else {
	IsShowing = true;
}
