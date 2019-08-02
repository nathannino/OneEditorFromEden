/// @description Draw the character

if (IsShowing) {
	draw_set_color(Color);
	draw_set_font(Font);
	draw_text(x,y + 8,Letter);
}
//debug only
//draw_self();