//string = xmlReadLine(hfile)
//used by xmlRealFile
//reads a xml string from xml file, and trims out initilial fat
var r; r = xmlTrim(file_text_read_string(argument0))
file_text_readln(argument0);
if(string_copy(r,1,2) == "<!") return "";
while(string_pos("< ",r)) r = string_replace(r,"< ","<");
while(string_pos(" >",r)) r = string_replace(r," >",">");
while(string_pos("</ ",r)) r = string_replace(r,"</ ","</");
while(string_pos(" />",r)) r = string_replace(r," />","/>");
return r;
