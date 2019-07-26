/// @description xmlToString(xmlElement)
/// @param xmlElement
//string = xmlToString(xmlElement)
//turns an element into a html/xml string
//chr(13)+chr(10) are used as line break, the windows standard

global.__xmls = "";
global.__xmlsind = "";
xmlElementToString(argument0);
return global.__xmls;
