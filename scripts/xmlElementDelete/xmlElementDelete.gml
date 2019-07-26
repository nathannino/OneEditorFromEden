/// @description xmlElementDelete(xmlElement)
/// @param xmlElement
//error = xmlElementDelete(xmlElement)
//deletes the element specified 
//returns 0 on success, -100 on bad element,
with(argument0) 
{
    while(ds_list_size(m_Elements))
        xmlElementDelete(ds_list_find_value(m_Elements,0));
    with(m_Parent)
    {
        ds_list_delete(m_Elements, ds_list_find_index(m_Elements,other.id));
        m_NumElements = ds_list_size(m_Elements);
        if(m_NumElements==0) m_Empty = 1;
    }
    instance_destroy();
    return 0;
}
return -100;
