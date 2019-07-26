/// @description xmlGetProperty(xmlRootElement,"root.first.second.third.forth",propertyname)
/// @param xmlRootElement
/// @param "root.first.second.third.forth"
/// @param propertyname
//string= xmlGetProperty(xmlRootElement,"root.first.second.third.forth",propertyname)
//returns the xmlElement property or "<error ...>" on failure
//data can be blank ""
//all data are string, if you want a real, call use GM's real()
//returns the element data from the tree specified by the string
//<error on fail
//
with(argument0)
{
    with(xmlGetElement(argument0,argument1))
    {
        var ind; ind = xmlElementFindPropertyIndex(id,argument2);
        if(ind>=0)
            return xmlElementGetPropertyValue(id,ind);
        
        return "<error xmlGetProperty: property not found>";
        
    }
    return "<error xmlGetProperty: xmlElement not found>";
}
return "<error xmlGetProperty: xmlElement not found>";
