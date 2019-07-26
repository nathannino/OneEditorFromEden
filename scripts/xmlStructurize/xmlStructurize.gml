//element = xmlStructurize(Name,Data,extra_info,parentElement)
//used by xmlReadFile
//creates a tree of elements from the Data and extra info

with(instance_create(0,0,ElementObj))
{
    m_Name = argument0;
    m_Data = argument1;
    //show_debug_message("NAME:"+m_Name);
    //show_debug_message("DATA:"+m_Data);
    m_Empty = false;
    //m_Extra = argument2;  
    xmlEtrasToProperties(argument2);
    m_Parent = argument3;
    
    
      
    var elementn; elementn = xmlNextTag();
    
    while(elementn!="")
    {
        var empty; empty = string_pos("/>",elementn);
        if(empty)
            elementn = string_replace(elementn,"/>","");
            
        elementn = string_replace(elementn,"<","");
        elementn = string_replace(elementn,">","");
        
        var p; p = string_pos(" ",elementn);
        var extra; extra = "";
        var ve; 
        var value;
        if(p)
        {
            extra = string_copy(elementn,p+1,string_length(elementn))
            
            elementn = string_copy(elementn,1,p-1);
        }
        var data; data = xmlNextTagData("</"+elementn+">")
        
        if(!empty) ds_list_add(m_Elements,xmlStructurize(elementn,data,extra,id));
        else ds_list_add(m_Elements,xmlCreateEmptyElement(elementn,extra,id))
        
                
        elementn = xmlNextTag();
    }
    m_NumElements = ds_list_size(m_Elements);
    if(m_NumElements) m_Data = "";
    var lln; lln = string_length(m_Data);
    if(string_char_at(m_Data,lln) == chr(10)) m_Data = string_copy(m_Data,1,lln-1);
    
    return id;
    
    
}
