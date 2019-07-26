/// @description xmlClearElement(xmlRootElement,"root.first.second.third.forth")
/// @param xmlRootElement
/// @param "root.first.second.third.forth"
//string= xmlClearElement(xmlRootElement,"root.first.second.third.forth")
//find the element specified by the structure and clears it's content
//
with(argument0)
{
    with(xmlGetElement(argument0,argument1))
    {
        return xmlElementClearContent(id)
    }
    return -100;
}
return -100;
