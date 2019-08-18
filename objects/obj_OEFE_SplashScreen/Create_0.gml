/// @description Do stuff

x = 0;
y = 0;
CalledBy = undefined;

//Add all the splash screens manually
SplashArray[0] = spr_breakthecode_Splash0;
SplashArray[1] = spr_breakthecode_Splash1;
SplashArray[2] = spr_breakthecode_Splash2;
SplashArray[3] = spr_breakthecode_Splash3;
SplashArray[4] = spr_breakthecode_Splash4;
SplashArray[5] = spr_breakthecode_Splash5;
SplashArray[6] = spr_breakthecode_Splash6;
SplashArray[7] = spr_breakthecode_Splash7;
SplashArray[8] = spr_breakthecode_Splash8;
SplashArray[9] = spr_breakthecode_Splash9;
SplashArray[10] = spr_breakthecode_Splash10;
SplashArray[11] = spr_breakthecode_Splash11;
SplashArray[12] = spr_breakthecode_Splash12;
SplashArray[13] = spr_breakthecode_Splash13;
SplashArray[14] = spr_breakthecode_Splash14;
SplashArray[15] = spr_breakthecode_Splash15;

//change this number when adding more splashes
SplashArrayNumber = 15;
randomize();
sprite_index = SplashArray[irandom_range(0,SplashArrayNumber)];

alarm_set(0,2);