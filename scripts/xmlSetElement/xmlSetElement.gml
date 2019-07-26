/// @description xmlSetElement(xmlRootElement,"root.first.second.third.forth")
/// @param xmlRootElement
/// @param "root.first.second.third.forth"
//xmlElement = xmlSetElement(xmlRootElement,"root.first.second.third.forth")
//returns the element from the tree specified by the string
//creating missing elements along the way
//returning the found or newly created element
//-100 if failed (aka bad xmlRootElement)
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
    var el; el = xmlElementFindElement(id,nxt);
    if(el == -200) el = xmlElementAddElement(id,nxt);
    return xmlSetElement(el,a);
}
return -100;
