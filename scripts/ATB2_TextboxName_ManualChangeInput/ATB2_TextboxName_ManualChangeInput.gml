///@desc A ATB2 script that handles everything needed when someone else is changing input
///@args Name The value in TextboxName
///@args obj The general ATB2 object
///@args input The new input to send to the textbox

var scr_TextboxName = argument0;
var scr_ATB2obj = argument1;
var scr_input = argument2;


with (scr_ATB2obj) {
	if (TextboxName == scr_TextboxName) {
		input = scr_input;
		event_perform(ev_other,ev_user10);
	}
}