/// @description xmlElementClearProperties(xmlElement)
/// @param xmlElement
//error = xmlElementClearProperties(xmlElement)
//clears the properties from the element
//returns 0 on success, -100 on bad element
with(argument0) 
{
    ds_list_clear(m_PropertiesN);
    ds_list_clear(m_PropertiesV);
    return 0;
}
return -100;
