/// @description xmlFromFile(filename)
/// @param filename
//xmlRootElement = xmlFromFile(filename)
//Reads a file and returns the xml data root Element named "root"
//all other elements are queried from the root element
//returns xmlRootElement
//returns -100 if file not found
//returns -200 if error opening the file


if(!file_exists(argument0)) return -100;

var hf; hf = file_text_open_read(argument0);
if(!hf) return -200;

var data; data = "";
while (!file_text_eof(hf)) 
{
    data += xmlReadLine(hf);
    data+=chr(10);
}
file_text_close(hf);

return xmlStructurize("root",data,"",noone);
