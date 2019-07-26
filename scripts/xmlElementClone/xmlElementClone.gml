/// @description xmlElementClone(xmlElement, ElementUnder)
/// @param xmlElement
/// @param  ElementUnder
//newElement = xmlElementClone(xmlElement, ElementUnder)
//clones the structure under another
//the resulting element stand on it's own if ElementUnder is noone
//returns 0 on success, -100 on bad element,
with(argument0) 
{
    var new; new = instance_create(0,0,ElementObj);
    new.m_Name = m_Name;
    new.m_Data = m_Data;
    new.m_Parent = argument1;
    
    ds_list_copy(new.m_PropertiesN,m_PropertiesN);
    ds_list_copy(new.m_PropertiesV,m_PropertiesV);
    new.m_Empty = m_Empty;   
    new.m_NumProperties = m_NumProperties;
    new.m_NumElements = m_NumElements;
    var i; i = 0;
    repeat(ds_list_size(m_Elements))
    {
        xmlElementClone(ds_list_find_value(m_Elements,i),new);
        //ds_list_add(new.m_Elements,xmlElementClone(ds_list_find_value(m_Elements,i),new));
        //new.m_NumElements = ds_list_size(new.m_Elements);
        i+=1;
    }
    with(new.m_Parent)
    {
        ds_list_add(m_Elements,new);
        m_NumElements = ds_list_size(m_Elements);
    }
    return new;
}
return -100;
