/// @description xmlElementGetPropertyName(xmlElement, propertyindex)
/// @param xmlElement
/// @param  propertyindex
//string = xmlElementGetPropertyName(xmlElement, propertyindex)
//returns the xmlElement property name at propertyindex 
//  propertyindex = 0 to NumProperties-1
//or "<error ...>" on error
with(argument0) 
{
    if(argument1<0 or argument1>=m_NumProperties) return "<error xmlElementGetPropertyName: index out of reange>";
    return ds_list_find_value(m_PropertiesN,argument1);
}
return "<error xmlElementGetPropertyName: xmlElement not found>";
