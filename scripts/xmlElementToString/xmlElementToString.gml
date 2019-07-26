
//xmlElementToString(xmlElement)
//clones the structure under another
//the resulting element stand on it's own if ElementUnder is noone
//returns 0 on success, -100 on bad element,
with(argument0) 
{
    var skip; skip = (m_Parent==noone and m_Name =="root");
    if(!skip)
    {
        global.__xmls += global.__xmlsind + "<"+m_Name;
        var i; i = 0;
        var pname,pvalue,quote; 
        repeat(m_NumProperties)
        {
            
            pname = ds_list_find_value(m_PropertiesN,i);
            pvalue = ds_list_find_value(m_PropertiesV,i);
            quote = "\"";
            if(string_pos("\"",pvalue)) quote = "'";
            global.__xmls += " " + pname +"=" + quote + pvalue + quote;
            i+=1;
        }
        
        if(string_pos("?",m_Name) == 1) 
        {
            global.__xmls +="?>";
            global.__xmls += chr(13) + chr(10);
        }
        else if(m_Empty) 
        {
            global.__xmls +=" />";
            global.__xmls += chr(13) + chr(10);
        }
        else if(!m_NumElements)
        {
            global.__xmls += ">"
            global.__xmls += m_Data;
            global.__xmls += "</"+m_Name+">";
            global.__xmls += chr(13) + chr(10);
        }
    }
    if(!m_Empty and m_NumElements)
    {
        if(!skip) 
        {
            global.__xmls += ">"
            global.__xmls += chr(13) + chr(10);
            global.__xmlsind += "    ";
        }
        var i; i = 0;
        repeat(ds_list_size(m_Elements))
        {
            
            xmlElementToString(ds_list_find_value(m_Elements,i));
            
            i+=1;
        }
        if(!skip) 
        {
            global.__xmlsind = string_copy(global.__xmlsind,1,string_length(global.__xmlsind)-4)
            global.__xmls += global.__xmlsind + "</"+m_Name+">";
            global.__xmls += chr(13) + chr(10);
        }
    }

    
    exit;
}

