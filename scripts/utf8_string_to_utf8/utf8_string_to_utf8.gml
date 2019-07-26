/// @description utf8_string_to_utf8(string)
/// @param string
var str = argument0;
var len = string_length(str);
global.utf_out = "";
var i;
for(i = 0; i<len; i++)
{
    write_utf8(ord(string_char_at(str,i+1)))
}
return global.utf_out;
