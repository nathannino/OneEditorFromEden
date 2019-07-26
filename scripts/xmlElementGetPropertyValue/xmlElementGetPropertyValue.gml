/// @description xmlElementGetPropertyValue(xmlElement, propertyindex)
/// @param xmlElement
/// @param  propertyindex
//string = xmlElementGetPropertyValue(xmlElement, propertyindex)
//returns the xmlElement property value at propertyindex 
//  propertyindex = 0 to NumProperties-1
//or "<error ...>" on error
//all values are string, if you want a real, call use GM's real()
with(argument0) 
{
    if(argument1<0 or argument1>=m_NumProperties) return "<error xmlElementGetPropertyValue: index out of reange>";
    return ds_list_find_value(m_PropertiesV,argument1);
}
return "<error xmlElementGetPropertyValue: xmlElement not found>";
