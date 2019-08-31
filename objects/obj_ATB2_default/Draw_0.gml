/// @description Insert description here
// You can write your code in this editor

draw_self(); //draw a cool white cube

//Draw inside surface
if ((TextSurface == undefined) || !(surface_exists(TextSurface))) {
	TextSurface = surface_create(image_xscale,image_yscale);
}
surface_set_target(TextSurface);
draw_set_color(c_black);
draw_set_font(UsedFont);

draw_clear_alpha(c_white,0);

var OriginPointRelativeX = OriginPointX - x;
var OriginPointRelativeY = OriginPointY - y;
draw_text(OriginPointRelativeX,OriginPointRelativeY,input);

surface_reset_target();
//Draw that surface to display text
draw_surface(TextSurface,x,y);