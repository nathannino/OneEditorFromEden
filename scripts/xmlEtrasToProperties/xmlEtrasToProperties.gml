//xmlEtrasToProperties(extra)
//extracts the property names and values from the etra information of a tag
var extra; extra = argument0;
    {
    
            var eq; eq = string_pos("=",extra);
            var vname;
            while(eq)
            {
                vname = xmlTrim(xmlNoNL(string_copy(extra,1,eq-1)));
                
                value = "";
                extra = string_copy(extra, eq+1,string_length(extra))
                if(string_char_at(extra,1) == "\"")
                {
                    extra = string_copy(extra, 2,string_length(extra))
                    ve = string_pos("\"",extra);
                    if(ve) 
                    {
                        value = string_copy(extra,1,ve-1);
                        extra = string_copy(extra, ve+1,string_length(extra))
                        ds_list_add(m_PropertiesN,vname);
                        ds_list_add(m_PropertiesV,value);
                        
                    }
                    else extra = ""
                }
                else if(string_char_at(extra,1) == "'")
                {
                    extra = string_copy(extra, 2,string_length(extra))
                    ve = string_pos("'",extra);
                    if(ve) 
                    {
                        value = string_copy(extra,1,ve-1);
                        extra = string_copy(extra, ve+1,string_length(extra))
                        ds_list_add(m_PropertiesN,vname);
                        ds_list_add(m_PropertiesV,value);
                    }
                    else extra = ""
                }
               
                //show_debug_message("'" + vname + "'='" + value +"'")
                eq = string_pos("=",extra);
            }
            m_NumProperties = ds_list_size(m_PropertiesN);
    }  
