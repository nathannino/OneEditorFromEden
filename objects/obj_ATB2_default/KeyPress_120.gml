/// @description debuging the clipboard
// You can write your code in this editor

if (clipboard_has_text() && false) {
	//var ClipboardText9 = "Hello\nhi"
	var ClipboardText9 = clipboard_get_text();
	var ClipboardLength9 = string_length(ClipboardText9);
	var ClipboardWidth9 = string_width(ClipboardText9);
	show_debug_message("ClipboardText is " + ClipboardText9);
	show_debug_message("ClipboardLength is " + string(ClipboardLength9));
	show_debug_message("ClipboardWidth is " + string(ClipboardWidth9));
	for (var i9 = 0;i9 < ClipboardLength9; i9++) {
		if (i9 == 0) {
			var CBTtext = ClipboardText9;
		} else {
			var CBTtext = string_delete(ClipboardText9,1,i9);
		}
		CBTtext = string_delete(CBTtext,2,string_length(CBTtext)-1);
		show_debug_message("\"" + CBTtext + "\" is the " + string(i9) + " char in the clipboard");
		if (CBTtext == "\n") {
			show_debug_message("New line");
		}
	}
}

