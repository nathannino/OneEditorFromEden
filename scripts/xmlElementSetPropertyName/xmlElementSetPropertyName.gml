/// @description xmlElementSetPropertyName(xmlElement, propertyindex, name)
/// @param xmlElement
/// @param  propertyindex
/// @param  name
//error = xmlElementSetPropertyName(xmlElement, propertyindex, name)
//sets the element's property name, by propertyindex, to a new name
//  propertyindex = 0 to NumProperties-1
//returns 0 on success, -100 bad xlmElement, -200 on bad index value

with(argument0) 
{
    if(argument1<0 or argument1>=m_NumProperties) return -200;
    ds_list_replace(m_PropertiesN,argument1,argument2);
    return 0;
}
return -100;
