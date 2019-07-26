/// @description xmlDelElement(xmlRootElement,"root.first.second.third.forth")
/// @param xmlRootElement
/// @param "root.first.second.third.forth"
//string= xmlDelElement(xmlRootElement,"root.first.second.third.forth")
//find the element specified by the structure and deletes it
//
with(argument0)
{
    with(xmlGetElement(argument0,argument1))
    {
        return xmlElementDelete(id)
    }
    return -100;
}
return -100;
