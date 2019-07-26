//xmlDebug(xmlElement,-1)
//Draws the element structure in Gm's debug windows
//xmlElement is the element to debug
//pass -1 as second argement
if(argument1)
{
    with(argument0)
    {
        show_debug_message(global.__dbt + m_Name);
        var i; i = 0;
        if(m_Empty)
            show_debug_message(global.__dbt+m_Name+".empty=true");
        else
            show_debug_message(global.__dbt+m_Name+".empty=false");
        show_debug_message(global.__dbt+m_Name+".numproperties="+string(m_NumProperties));
        repeat(m_NumProperties)
        {
            show_debug_message(global.__dbt+m_Name+".properties." + string(ds_list_find_value(m_PropertiesN,i)) + "=" + string(ds_list_find_value(m_PropertiesV,i)));
            i+=1;
        }
            
        show_debug_message(global.__dbt+m_Name+".data=" + m_Data);
        show_debug_message(global.__dbt+m_Name+".numelements="+string(m_NumElements));

        i = 0;
        repeat(m_NumElements)
        {
            global.__dbt += m_Name +".";
            var en; en = ds_list_find_value(m_Elements,i);
            xmlDebug(en,1);
            i+=1;
            global.__dbt = string_copy(global.__dbt,1,string_length(global.__dbt)-string_length(m_Name)-1);
        }
        
        
    }
}
else
{
   global.__dbt = "";
   xmlDebug(argument0,1);
}
