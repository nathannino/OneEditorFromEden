/// @description xmlElementDeleteProperty(xmlElement, propertyindex)
/// @param xmlElement
/// @param  propertyindex
//error = xmlElementDeleteProperty(xmlElement, propertyindex)
//delete the property from the element
//returns 0
//or -100 if xmlElement is invalid, -200 if the name does not exists
with(argument0) 
{
    var ind; ind = ds_list_find_index(m_PropertiesN,argument1);
    if(argument1<0 or argument1>=m_NumProperties) return -200;
    
    ds_list_delete(m_PropertiesN,argument1);
    ds_list_delete(m_PropertiesV,argument1);
    m_NumProperties = ds_list_size(m_PropertiesN);
    return 0;
}
return -100;
