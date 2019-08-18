/// @description call user event 5

if (CalledBy != undefined) {
	with(CalledBy) {
		event_perform(ev_other,ev_user5);
	}
} else {
	show_message("Error : obj_OEFE_SplashScreen did not receive a CalledBy id. Calling show_error() to crash");
	show_error("The splash screen did not receive a CalledBy id in room " + string(room) + " (Starting from 0)",true);
}
