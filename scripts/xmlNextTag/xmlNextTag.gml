//tag = xmlNextTag()
//used by core
//finds the next <tag> in m_Data


var pstart; pstart = string_pos("<",m_Data);
if(pstart == 0) return "";

var pend; pend = string_pos(">",m_Data);

if(pend == 0) return "";


//show_debug_message("'"+string_copy(s,pstart,pend-pstart+1)+"'");

var ret; ret = string_copy(m_Data,pstart,pend-pstart+1);
m_Data = string_copy(m_Data,pend+1,string_length(m_Data));

/*
draw_clear(background_color);
draw_text(0,0,"Name: " + ret + "#" +m_Data)
screen_refresh()
debugwait();
*/

return ret;
