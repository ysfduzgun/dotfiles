/* See LICENSE file for copyright and license details. */

/* appearance */
static const unsigned int borderpx  = 1;        /* border pixel of windows */
static const unsigned int snap      = 32;       /* snap pixel */
static const unsigned int systraypinning = 0;   /* 0: sloppy systray follows selected monitor, >0: pin systray to monitor X */
static const unsigned int systrayonleft = 0;    /* 0: systray in the right corner, >0: systray on left of status text */
static const unsigned int systrayspacing = 2;   /* systray spacing */
static const int systraypinningfailfirst = 1;   /* 1: if pinning fails, display systray on the first monitor, False: display systray on the last monitor*/
static const int showsystray        = 1;        /* 0 means no systray */
static const int showbar            = 1;        /* 0 means no bar */
static const int topbar             = 1;        /* 0 means bottom bar */
static const int horizpadbar        = 5;        /* horizontal padding for statusbar */
static const int vertpadbar         = 5;        /* vertical padding for statusbar */
static const char *fonts[]          = { "JetBrains Mono Nerd Font:size=16" };
static const char dmenufont[]       = "JetBrains Mono Nerd Font:size=18";
static const char col_gray1[]       = "#2E3440";
static const char col_gray2[]       = "#3B4252";
static const char col_gray3[]       = "#434C5E"; 
static const char col_gray4[]       = "#4C566A";
static const char col_cyan[]        = "#88C0D0"; 
static const char col_white[]       = "#D8DEE9"; 
static const char col_green[]       = "#8FBCBB"; 
static const char *colors[][3]      = {
	/*               fg         bg         border   */
	[SchemeNorm] = { col_cyan, col_gray1, col_gray4 },
    [SchemeTitle] = { col_cyan, col_gray1, col_gray4  },
	[SchemeSel]  = { col_green, col_gray4,  col_gray1  },
};

/* tagging */
//static char *tags[] = {"", "", "", "", "", "", "", ""};
//static char *tags[] = {"", "", "", "", "", "", "", ""};
static const char *tags[] = { "1", "2", "3", "4", "5", "6", "7", "8", "9" };

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class      instance    title       tags mask     isfloating   monitor */
	{ "Gimp",           NULL,       NULL,       0,            1,           -1 },
	{ "Google-chrome",	NULL,       NULL,       1 << 8,       0,           -1 },
};

/* layout(s) */
static const float mfact     = 0.55; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 1;    /* 1 means respect size hints in tiled resizals */
static const int lockfullscreen = 1; /* 1 will force focus on the fullscreen window */

static const Layout layouts[] = {
	/* symbol     arrange function */
	//{ "[]=",      tile },    /* first entry is default */
	//{ "><>",      NULL },    /* no layout function means floating behavior */
	//{ "[M]",      monocle },
	{ "",        tile },    /* first entry is default */
	{ "",      NULL },    /* no layout function means floating behavior */
	{ "[M]",      monocle },

};

/* key definitions */
#define MODKEY Mod1Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[] = { "dmenu_run", "-m", dmenumon, "-fn", dmenufont, "-nb", col_gray1, "-nf", col_gray3, "-sb", col_cyan, "-sf", col_gray4, NULL };

static const char *termcmd[]  = { "st", NULL };
static const char *lockcmd[]  = { "slock", NULL };
static const char *cpickcmd[] = { "dwmcolorpicker", NULL };

/* Hardware keys for volume and brightness */
#include <X11/XF86keysym.h>
static const char *mutevol[]    = { "dwmvolume", "--toggle", NULL };
static const char *mutemic[]    = { "dwmvolume", "--toggle-mic", NULL };
static const char *upvol[]      = { "dwmvolume", "--inc", NULL };
static const char *downvol[]    = { "dwmvolume", "--dec", NULL };
static const char *upbl[] 	    = { "dwmbrightness", "--inc", NULL };
static const char *downbl[]     = { "dwmbrightness", "--dec", NULL };

/* Screenshot */
static const char *shotnow[]  	= { "dwmscreenshot", "--now", NULL };
static const char *shotin3[]  	= { "dwmscreenshot", "--in3", NULL };
static const char *shotin5[]  	= { "dwmscreenshot", "--in5", NULL };
static const char *shotwin[]  	= { "dwmscreenshot", "--win", NULL };
static const char *shotarea[]  	= { "dwmscreenshot", "--area", NULL };

static const Key keys[] = {
	// Hardware Keys -----------
	{ 0, 						XF86XK_AudioMute, 			spawn, {.v = mutevol } },
	{ 0, 						XF86XK_AudioMicMute, 		spawn, {.v = mutemic } },
	{ 0, 						XF86XK_AudioLowerVolume, 	spawn, {.v = downvol } },
	{ 0, 						XF86XK_AudioRaiseVolume, 	spawn, {.v = upvol   } },
	{ 0, 						XF86XK_MonBrightnessUp, 	spawn, {.v = upbl   } },
	{ 0, 						XF86XK_MonBrightnessDown, 	spawn, {.v = downbl   } },

    // Misc
    { Mod4Mask, 		        XK_l, 				        spawn, {.v = lockcmd } },
    { MODKEY|ControlMask,       XK_l, 				        spawn, {.v = lockcmd } },
    { MODKEY, 					XK_c, 						spawn, {.v = cpickcmd } },

	// Print Keys -----------
	{ 0, 						XK_Print, 					spawn, {.v = shotnow } },
	{ Mod4Mask, 				XK_Print, 					spawn, {.v = shotin3 } },
	{ ShiftMask, 				XK_Print, 					spawn, {.v = shotin5 } },
	{ ControlMask, 				XK_Print, 					spawn, {.v = shotwin } },
	{ MODKEY,    				XK_Print, 					spawn, {.v = shotarea } },


	/* modifier                     key        function        argument */
	{ MODKEY,                       XK_p,      spawn,          {.v = dmenucmd } },
	{ MODKEY|ShiftMask,             XK_Return, spawn,          {.v = termcmd } },
	{ MODKEY,                       XK_b,      togglebar,      {0} },
	{ MODKEY,                       XK_j,      focusstack,     {.i = +1 } },
	{ MODKEY,                       XK_k,      focusstack,     {.i = -1 } },
	{ MODKEY,                       XK_i,      incnmaster,     {.i = +1 } },
	{ MODKEY,                       XK_d,      incnmaster,     {.i = -1 } },
	{ MODKEY,                       XK_h,      setmfact,       {.f = -0.05} },
	{ MODKEY,                       XK_l,      setmfact,       {.f = +0.05} },
	{ MODKEY,                       XK_Return, zoom,           {0} },
	{ MODKEY,                       XK_Tab,    view,           {0} },
	{ MODKEY|ShiftMask,             XK_c,      killclient,     {0} },
	{ MODKEY,                       XK_t,      setlayout,      {.v = &layouts[0]} },
	{ MODKEY,                       XK_f,      setlayout,      {.v = &layouts[1]} },
	{ MODKEY,                       XK_m,      setlayout,      {.v = &layouts[2]} },
	{ MODKEY,                       XK_space,  setlayout,      {0} },
	{ MODKEY|ShiftMask,             XK_space,  togglefloating, {0} },
	{ MODKEY,                       XK_0,      view,           {.ui = ~0 } },
	{ MODKEY|ShiftMask,             XK_0,      tag,            {.ui = ~0 } },
	{ MODKEY,                       XK_comma,  focusmon,       {.i = -1 } },
	{ MODKEY,                       XK_period, focusmon,       {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_comma,  tagmon,         {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_period, tagmon,         {.i = +1 } },
	TAGKEYS(                        XK_1,                      0)
	TAGKEYS(                        XK_2,                      1)
	TAGKEYS(                        XK_3,                      2)
	TAGKEYS(                        XK_4,                      3)
	TAGKEYS(                        XK_5,                      4)
	TAGKEYS(                        XK_6,                      5)
	TAGKEYS(                        XK_7,                      6)
	TAGKEYS(                        XK_8,                      7)
	TAGKEYS(                        XK_9,                      8)
	{ MODKEY|ShiftMask,             XK_q,      quit,           {0} },
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static const Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};

