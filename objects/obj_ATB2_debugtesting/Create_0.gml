/// @description Debug testing uses hard coded values (Inspire yourself, but don't just copy paste it)
// You can write your code in this editor

ATB2_ManualChangeInput(inst_ATB2_debugtesting,"This is the ultimate test\nDo not dissapoint me. Now, we are going to flood this textbox with as much information as possible");
//Do note that using TextboxName at the start of a room might lead to problems revolving around what create event get's run before what
ATB2_TextboxName_ManualChangeInput("CustomTextboxName",obj_ATB2_default,"Using TextboxName instead of instance_id")