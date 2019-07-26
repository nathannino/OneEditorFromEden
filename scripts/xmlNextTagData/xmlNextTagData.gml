//datat = xmlNextTagData(endtag)
//used by core
//find the data all the way to </tag> in m_Data

//var pstart; pstart = string_pos(argument1,m_Data);

//if(pstart == 0) return "";

var pend; pend = string_pos(argument0,m_Data);

if(pend == 0) 
{
    //var ret; ret = m_Data;
    //m_Data = ""
    return "";
}    
//var psl; psl = string_length(argument1);
var pel; pel = string_length(argument0);
//show_debug_message("'"+string_copy(s,pstart+psl,pend-pstart-psl)+"'");
var ret; ret = string_copy(m_Data,1,pend-1);
m_Data = string_copy(m_Data,pend+pel,string_length(m_Data));

/*
draw_clear(background_color);
draw_text(0,0,m_Data)
screen_refresh()
debugwait();
*/
return ret;
