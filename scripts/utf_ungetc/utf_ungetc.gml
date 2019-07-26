//utf_ungetc(ct)
//uses global.utf_in
//uses global.utf_in_at;
global.utf_in_at--;
var c = chr($DC00 + argument0);
string_set_byte_at(global.utf_in,global.utf_in_at,c);


