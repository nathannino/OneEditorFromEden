/// @description xmlGetData(xmlRootElement,"root.first.second.third.forth")
/// @param xmlRootElement
/// @param "root.first.second.third.forth"
//string= xmlGetData(xmlRootElement,"root.first.second.third.forth")
//returns the data of the element from the tree data or "<error ...>" on failure
//data can be blank ""
//all data are string, if you want a real, call use GM's real()
//returns the element data from the tree specified by the string
//-100 or -200 bad tree name
//
with(argument0)
{
    with(xmlGetElement(argument0,argument1))
    {
        return xmlElementGetData(id)
    }
    return "<error xmlGetData: xmlElement not found>";
}
return "<error xmlGetData: xmlElement not found>";
