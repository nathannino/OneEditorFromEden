/// @description xmlGetElement(xmlRootElement,"root.first.second.third.forth")
/// @param xmlRootElement
/// @param "root.first.second.third.forth"
//xmlElement = xmlGetElement(xmlRootElement,"root.first.second.third.forth")
//returns the element from the tree specified by the string
//-100 if not found, -200 is bad tree structure
//
with(argument0)
{
    var b; b = xmlStringBefore(argument1,".");
    var a; a = xmlStringAfter(argument1,".");
//show_debug_message("argument1="+argument1);
//show_debug_message("a="+a);
//show_debug_message("b="+b);
//show_debug_message("n="+m_Name);
    if(b != m_Name) return -200;
    if(a == b and b == m_Name) return id;
    
    var nxt; nxt = xmlStringBefore(a,".");
    return xmlGetElement(xmlElementFindElement(id,nxt),a);
}
return -100;
