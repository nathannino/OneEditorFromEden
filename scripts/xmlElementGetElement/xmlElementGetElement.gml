/// @description xmlElementGetElement(xmlElement, elementindex)
/// @param xmlElement
/// @param  elementindex
//xmlElement = xmlElementGetElement(xmlElement, elementindex)
//returns the xmlElement's sub element at index 
//  elementindex = 0 to NumElements-1
//or -100 if bad xmlElement specified
//or -200 if index out of range
with(argument0) 
{
    if(argument1<0 or argument1>=m_NumElements) return -200;
    return ds_list_find_value(m_Elements,argument1);
}
return -100;
