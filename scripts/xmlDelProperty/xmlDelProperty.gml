/// @description xmlDelProperty(xmlRootElement,"root.first.second.third.forth",propertyname)
/// @param xmlRootElement
/// @param "root.first.second.third.forth"
/// @param propertyname
//string= xmlDelProperty(xmlRootElement,"root.first.second.third.forth",propertyname)
//deletes the property in the lenement in the structure
//return 0 on success, or -100 on bad element or -200 on bad property name
with(argument0)
{
    with(xmlGetElement(argument0,argument1))
    {
        var ind; ind = xmlElementFindPropertyIndex(id,argument2);
        if(ind>=0)
            return xmlElementDeleteProperty(id,ind);
        else
            return -200
    }
    return -100;
}
return -100;
