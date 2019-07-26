//xmlDebug(xmlElement,-1)
//Draws the element structure in Gm's debug windows
//xmlElement is the element to debug
//pass -1 as second argement
if(argument1)
{
    with(argument0)
    {
        if(global.__dbt == "") global.__dbt += m_Name
        else global.__dbt += "."+m_Name
        show_debug_message(global.__dbt);
        TestVals("xmlElementGetName",m_Name,xmlElementGetName(id));
        TestVals("xmlElementGetNumElements",m_NumElements,xmlElementGetNumElements(id));
        
        TestVals("xmlElementGetData",m_Data,xmlElementGetData(id));
        TestVals("xmlGetElement",id,xmlGetElement( global.__root,global.__dbt));
        TestVals("xmlGetData",m_Data,xmlGetData( global.__root,global.__dbt));
        
        var t; t = m_Name;
        TestVals("xmlElementSetName",0,xmlElementSetName(id,"test"));
        TestVals("xmlElementSetName",m_Name,"test");
        m_Name = t;
        
        if(!m_NumElements)
        {
            t = m_Data;
            TestVals("xmlElementSetData",0,xmlElementSetData(id,"test2"));
            TestVals("xmlElementSetData",m_Data,"test2");
            m_Data = t;
        }
        var i; i = 0;
        if(m_Empty)
            show_debug_message(global.__dbt+".empty=true");
        else
            show_debug_message(global.__dbt+".empty=false");
        show_debug_message(global.__dbt+".numproperties="+string(m_NumProperties));
        
        TestVals("xmlElementGetNumProperties",m_NumProperties,xmlElementGetNumProperties(id));
            
        repeat(m_NumProperties)
        {
            var pname; pname = ds_list_find_value(m_PropertiesN,i);
            var pvalue; pvalue = ds_list_find_value(m_PropertiesV,i)
            show_debug_message(global.__dbt+".properties." + pname + "=" + pvalue);
            TestVals("xmlElementGetPropertyName",pname,xmlElementGetPropertyName(id,i))
            TestVals("xmlElementGetPropertyValue",pvalue,xmlElementGetPropertyValue(id,i))
            TestVals("xmlElementFindPropertyIndex",i,xmlElementFindPropertyIndex(id,pname));
            TestVals("xmlGetProperty",pvalue,xmlGetProperty( global.__root,global.__dbt,pname));

            TestVals("xmlElementSetPropertyName",0,xmlElementSetPropertyName(id,i,"test"));
            TestVals("xmlElementSetPropertyName",ds_list_find_value(m_PropertiesN,i),"test");
            ds_list_replace(m_PropertiesN,i,pname);
            
            TestVals("xmlElementSetPropertyValue",0,xmlElementSetPropertyValue(id,i,"test2"));
            TestVals("xmlElementSetPropertyValue",ds_list_find_value(m_PropertiesV,i),"test2");
            ds_list_replace(m_PropertiesV,i,pvalue);
            
            i+=1;
        }
            
        show_debug_message(global.__dbt+".data=" + m_Data);
        show_debug_message(global.__dbt+".numelements="+string(m_NumElements));

        i = 0;
        repeat(m_NumElements)
        {
            //global.__dbt += m_Name +".";
            var en; en = ds_list_find_value(m_Elements,i);
            TestVals("xmlElementGetElement",en, xmlElementGetElement(id,i));
            TestVals("xmlElementFindElement",en,xmlElementFindElement(id,en.m_Name));
            TestVals("xmlElementFindElementIndex",i,xmlElementFindElementIndex(id,en.m_Name));
            
            TestAllScripts(en,1);
            i+=1;
            
        }
        global.__dbt = string_copy(global.__dbt,1,string_length(global.__dbt)-string_length(m_Name)-2);
        
        
    }
}
else
{
   global.__dbt = "";
   global.__root = argument0;
   TestAllScripts(argument0,1);
}
