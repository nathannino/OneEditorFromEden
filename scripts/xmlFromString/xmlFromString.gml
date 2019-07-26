/// @description xmlFromString(xmlformatedstring)
/// @param xmlformatedstring
//xmlRootElement = xmlFromString(xmlformatedstring)
//Reads a string and returns the xml data root Element named "root"

/* 
1.2.1 revision, remove use of temp file
*/

var s; s = argument0;
while(string_pos("##",s)) s = string_replace_all(s,"##","@@HASHNUM@@");
while(string_pos(chr(13)+chr(10),s)) s = string_replace_all(s,chr(13)+chr(10),chr(10));
while(string_pos(chr(13),s)) s = string_replace_all(s,chr(13),chr(10));
while(string_pos("#",s)) s = string_replace_all(s,"#",chr(10));
while(string_pos("@@HASHNUM@@",s)) s = string_replace_all(s,"@@HASHNUM@@","##");
return xmlStructurize("root",s,"",noone);

/* 1.2.0 code
///xmlFromString(xmlformatedstring)
//xmlRootElement = xmlFromString(xmlformatedstring)
//Reads a string and returns the xml data root Element named "root"
//uses a temp file "__tmp.xml"

//all other elements are queried from the root element
//returns xmlRootElement
//returns -1 if temp file could not be saved
//returns -2 if temp file could not be opened
var s; s = argument0;
while(string_pos("##",s)) s = string_replace_all(s,"##","@@HASHNUM@@");
while(string_pos(chr(13)+chr(10),s)) s = string_replace_all(s,chr(13)+chr(10),chr(10));
while(string_pos(chr(13),s)) s = string_replace_all(s,chr(13),chr(10));
while(string_pos("#",s)) s = string_replace_all(s,"#",chr(10));
while(string_pos("@@HASHNUM@@",s)) s = string_replace_all(s,"@@HASHNUM@@","##");
var hf; hf = file_text_open_write("__tmp.xml")
file_text_write_string(hf,s);
file_text_close(hf);
if(!hf) return -200;
var r; r = xmlFromFile("__tmp.xml");
file_delete("__tmp.xml");
return r;
var s; s = argument0;
while(string_pos("##",s)) s = string_replace_all(s,"##","@@HASHNUM@@");
while(string_pos(chr(13)+chr(10),s)) s = string_replace_all(s,chr(13)+chr(10),chr(10));
while(string_pos(chr(13),s)) s = string_replace_all(s,chr(13),chr(10));
while(string_pos("#",s)) s = string_replace_all(s,"#",chr(10));
while(string_pos("@@HASHNUM@@",s)) s = string_replace_all(s,"@@HASHNUM@@","##");
var hf; hf = file_text_open_write("__tmp.xml")
file_text_write_string(hf,s);
file_text_close(hf);
if(!hf) return -200;
var r; r = xmlFromFile("__tmp.xml");
file_delete("__tmp.xml");
return r;
*/
