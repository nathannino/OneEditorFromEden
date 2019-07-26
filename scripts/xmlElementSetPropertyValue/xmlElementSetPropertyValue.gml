/// @description xmlElementSetPropertyValue(xmlElement, propertyindex, value)
/// @param xmlElement
/// @param  propertyindex
/// @param  value
//error = xmlElementSetPropertyValue(xmlElement, propertyindex, value)
//sets the element's property value, by propertyindex, to a new value
//  propertyindex = 0 to NumProperties-1
//returns 0 on success, -100 bad xlmElement, -200 on bad index value
//the value is strign-afied
with(argument0) 
{
    if(argument1<0 or argument1>=m_NumProperties) return -200;
    ds_list_replace(m_PropertiesV,argument1,string(argument2));
    return 0;
}
return -100;
