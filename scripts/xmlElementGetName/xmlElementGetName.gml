/// @description xmlElementGetName(xmlElement)
/// @param xmlElement
//string = xmlElementGetName(xmlElement)
//returns the xmlElement name or "<error ...>" on failure
//if an element name is blank there is bad xml formatting in the file
with(argument0) return m_Name;
return "<error xmlElementGetName: xmlElement not found>";
