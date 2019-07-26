/// @description xmlElementSetData(xmlElement,data)
/// @param xmlElement
/// @param data
//error = xmlElementSetData(xmlElement,data)
//sets the data of an element
//returns 0 on success, -100 on bad element, -200 on failure
//all data are converted to strings
with(argument0) 
{
    if(m_NumElements) return -200; //nope it's an element container
    m_Data = utf8_string_to_utf8(string(argument1));
    m_Empty = 0;
    return 0;
}
return -100;
