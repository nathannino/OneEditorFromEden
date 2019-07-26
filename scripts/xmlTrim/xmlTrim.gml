//string = xmlTrim(string)
//removes leading and trailing spaces
//used by core
var str;
str=argument0
while(string_char_at(str,0)=" ")
{
str=string_copy(str,2,string_length(str)-1)
}
while(string_char_at(str,string_length(str))=" ")
{
str=string_copy(str,1,string_length(str)-1)
}
return str
