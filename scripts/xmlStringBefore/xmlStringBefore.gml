//xmlStringBefore(s,tok)
var p; p = string_pos(argument1,argument0);
if(p) return string_copy(argument0,1,p-1);
return argument0;
