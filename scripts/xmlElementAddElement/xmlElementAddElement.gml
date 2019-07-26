/// @description xmlElementAddElement(xmlElement,name)
/// @param xmlElement
/// @param name
//xmlElement = xmlElementAddElement(xmlElement,name)
//returns the xmlElement's element added into the xmlElement
//or -100 if xmlElement is invalid, -200 id the element has data and is not a potential conatiner
with(argument0) 
{
    if(m_Data != "") return -200;
    var el; el = xmlCreateEmptyElement(argument1,"",id);
    ds_list_add(m_Elements,el);
    m_NumElements+=1;
    m_Empty = 0;
    return el;
}
return -100;
