/// @description utf8_to_string(string)
/// @param string
var str = argument0;
var len = string_length(str);
global.utf_out = "";
global.utf_in = str;
global.utf_in_at = 0;
var i;
while(global.utf_in_at<len)
{
    global.utf_out = global.utf_out + chr(read_code_point_from_utf8());
}
return global.utf_out;
