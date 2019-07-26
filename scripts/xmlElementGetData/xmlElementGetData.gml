/// @description xmlElementGetData(xmlElement)
/// @param xmlElement
//string = xmlElementGetData(xmlElement)
//returns the xmlElement data or "<error ...>" on failure
//data can be blank ""
//all data are string, if you want a real, call use GM's real()
with(argument0) return utf8_to_string(m_Data);
return "<error xmlElementGetData: xmlElement not found>";
