///@desc script that uses instances variables to see if it should return true

if (KeyboardTimeout == 0) {
	var returnvalue = true;
	KeyboardTimeout = DefaultKeyboardTimeout;
} else if !(KeyboardTimeoutStarted) {
	var returnvalue = true;
	KeyboardTimeoutStarted = true;
} else {
	returnvalue = false;
	KeyboardTimeout -= 1;
}
return returnvalue;