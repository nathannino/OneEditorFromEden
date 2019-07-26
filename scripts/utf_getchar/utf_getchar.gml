//utf_getchar()
//uses global.utf_in
//uses global.utf_in_at;
global.utf_in_at++;
return ord(string_char_at(global.utf_in,global.utf_in_at));

