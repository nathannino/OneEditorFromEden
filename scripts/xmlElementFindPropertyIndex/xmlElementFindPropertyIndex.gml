/// @description xmlElementFindPropertyIndex(xmlElement, propertyname)
/// @param xmlElement
/// @param  propertyname
//error = xmlElementFindPropertyIndex(xmlElement, propertyname)
//finds the property index from the property name for the lement
//returns property index
//or -100 if xmlElement is invalid, -200 if the property name does not exists
with(argument0) 
{
    var ind; ind = ds_list_find_index(m_PropertiesN,argument1);
    if(ind<0) return -200;
    return ind;;
}
return -100;
