/// @description xmlSetData(xmlRootElement,"root.first.second.third.forth",data)
/// @param xmlRootElement
/// @param "root.first.second.third.forth"
/// @param data
//err = xmlSetData(xmlRootElement,"root.first.second.third.forth",data)
//sets the xmlElement data creating elements that dont exist along the way
//data can be blank ""
//all data are converted to string
//returns 0 on success, -100 on failure, -200 if setting data on an element that is an element container
//
with(argument0)
{
    with(xmlSetElement(argument0,argument1))
    {
        return xmlElementSetData(id,argument2)
    }
    return -100;
}    
return -100;
