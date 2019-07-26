/// @description xmlElementFindElement(xmlElement, elementname)
/// @param xmlElement
/// @param  elementname
//xmlElement = xmlElementFindElement(xmlElement, elementname)
//searches for and 
//returns the xmlElement's sub element that has the specified name, slow
//or -100 if bad xmlElement specified
//or -200 if not found
//returns only the first occurence of an element that matches
with(argument0) 
{
    var i; i = 0;
    repeat(m_NumElements)
    {
        with(ds_list_find_value(m_Elements,i))
        {
            if(m_Name == argument1) return id;
        }
        i+=1;
    }
    
    return -200;
}
return -100;
