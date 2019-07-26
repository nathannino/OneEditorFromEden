/// @description xmlGetPropertyDef(xmlRootElement,"root.first.second.third.forth",propertyname,default)
/// @param xmlRootElement
/// @param "root.first.second.third.forth"
/// @param propertyname
/// @param default
//val= xmlGetPropertyDef(xmlRootElement,"root.first.second.third.forth",propertyname)
//returns the xmlElement property or default on failure
//
with(argument0)
{
    with(xmlGetElement(argument0,argument1))
    {
        var ind; ind = xmlElementFindPropertyIndex(id,argument2);
        if(ind>=0)
            return xmlElementGetPropertyValue(id,ind);
        
        return argument3;
        
    }
    return argument3;
}
return argument3;
