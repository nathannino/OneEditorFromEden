/// @description xmlSetProperty(xmlRootElement,"root.first.second.third.forth",propertyname,value)
/// @param xmlRootElement
/// @param "root.first.second.third.forth"
/// @param propertyname
/// @param value
//err = xmlSetProperty(xmlRootElement,"root.first.second.third.forth",propertyname,value)
//sets the xmlElement data property creating elements that dont exist along the way
//if the property does not exist, it is created
//data can be blank ""
//all data are converted to string
//returns 0 or higher (property index) on success, -100 on failure, -200 if setting data on an element that is an element container
//
with(argument0)
{
    with(xmlSetElement(argument0,argument1))
    {
        var ind; ind = xmlElementFindPropertyIndex(id,argument2);
        if(ind>=0)
            return xmlElementSetPropertyValue(id,ind,argument3);
        else
            return xmlElementAddProperty(id,argument2,argument3);
        
        return -200;
        
    }
    return -100;
}
return -100;
