///@desc A ATB2 script that handles everything needed when someone else is changing input
///@args ID the object id of the textbox (not it's name, but the instance_id) [you might be able to go with the object name if there are only one, but it's not recomended
///@args input The new input to send to the textbox

var scr_TextboxID = argument0;
var scr_input = argument1;

scr_TextboxID.input = scr_input;
with (scr_TextboxID) {
	event_perform(ev_other,ev_user10);
}