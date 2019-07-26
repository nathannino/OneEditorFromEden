/// @description xmlElementMove(xmlElement, xmlElementTo)
/// @param xmlElement
/// @param  xmlElementTo
//err = xmlElementMove(xmlElement, xmlElementTo)
//move one element into another.
//or -100 if bad xmlElement specified
//or -200 if cant move
with(argument0) 
{
    with(argument1)
    {
        if(argument0 == argument1) return -200;
        //make sure source is not parent of destination;
        var el;
        el = argument1;
        while(el)
        {
            if(el == argument0) return -200;
                el = el.m_Parent;
        }
        with(argument0.m_Parent)
        {
            ds_list_delete(m_Elements, ds_list_find_index(m_Elements,argument0));
            m_NumElements = ds_list_size(m_Elements);
            if(m_NumElements==0) m_Empty = 1;
        }
        with(argument1)
        {
            ds_list_add(m_Elements, argument0);
            m_NumElements = ds_list_size(m_Elements);
        }
        argument0.m_Parent = argument1;
        return 0;
    }
    return -100;
}
return -100;
