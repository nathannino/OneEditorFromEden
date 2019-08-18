/// @description Draw self and text

draw_self();

if !(actualInit) {
	draw_set_alpha(1);
	draw_set_color(c_white);
	//draw_set_font(fnt_OEFE_Arabic_25);
	draw_set_font(fnt_OEFE_Arial_20);
	
	draw_text(x + 4, y + 4,DirName);
	
	draw_set_font(fnt_OEFE_Arial_15);
	draw_text(x + 4,y + 45,"Last updated : " + Date);
}