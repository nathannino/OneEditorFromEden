/// @description xmlElementClearContent(xmlElement)
/// @param xmlElement
//error = xmlElementClearContent(xmlElement)
//clears the data of an element. 
//and destroys the elements contained within
//and flags as empty
//returns 0 on success, -100 on bad element, -200 on failure
with(argument0) 
{
    m_Data = "";
    m_Empty = 1;
    var i; i = 0;
    while(ds_list_size(m_Elements))
        xmlElementDelete(ds_list_find_value(m_Elements,0));
    m_NumElements = 0;
    return 0;
}
return -100;
