//xmlStringAfter(s,tok)
var p; p = string_pos(argument1,argument0);
if(p) return string_copy(argument0,p+1,string_length(argument0));
return argument0;
