/// @description mlToFile(xmlElement,filename)
/// @param xmlElement
/// @param filename
//string = xmlToFile(xmlElement,filename)
//turns an element into a html/xml string
//and saves it the the specified file
//chr(13)+chr(10) are used as line break, the windows standard


var hf; hf = file_text_open_write(argument1);
if(!hf) return -200;

file_text_write_string(hf,xmlToString(argument0))

file_text_close(hf);
