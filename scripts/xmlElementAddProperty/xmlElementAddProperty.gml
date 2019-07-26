/// @description xmlElementAddProperty(xmlElement, propertyname, value)
/// @param xmlElement
/// @param  propertyname
/// @param  value
//error = xmlElementAddProperty(xmlElement, propertyname, value)
//adds a property to xmlElement
//returns the index of the property added
//or -100 if xmlElement is invalid, -200 if the name exists
with(argument0) 
{
    if(ds_list_find_index(m_PropertiesN,argument1)>=0) return -200;
    
    ds_list_add(m_PropertiesN,argument1);
    ds_list_add(m_PropertiesV,string(argument2));
    m_NumProperties = ds_list_size(m_PropertiesN);;
    return m_NumProperties-1;
}
return -100;
