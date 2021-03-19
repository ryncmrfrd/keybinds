#NoEnv
#Warn

SendMode Input
SetWorkingDir %A_ScriptDir%

DetectHiddenWindows, On

toggle := true

; SPOTIFY FUNCTIONS

getSpotifyHwnd() {
	WinGet, spotifyHwnd, ID, ahk_exe spotify.exe
	spotifyHwnd := DllCall("GetWindow", "uint", spotifyHwnd, "uint", 2)
	spotifyHwnd := DllCall("GetWindow", "uint", spotifyHwnd, "uint", 2)
	Return spotifyHwnd
}

spotifyKey(key) {
	spotifyHwnd := getSpotifyHwnd()
	ControlFocus, Chrome_RenderWidgetHostHWND1, ahk_id %spotifyHwnd%
	ControlSend, , %key%, ahk_id %spotifyHwnd%
	Return
}

; DISCORD CONTROLS

NumpadAdd::Send {F14}
NumpadEnter::Send {F13}

; PROGRAM BINDS

Numpad7::
NumpadHome::Send {F15}

Numpad8::
NumpadUp::Send {F16}

Numpad4::
NumpadLeft::Send {F17}

Numpad5::
NumpadClear::Send {F18}

Numpad9::
NumpadPgUp::Send {F19}

; VOLUME CONTROLS (SPOTIFY)

Numpad6::
NumpadRight::
	spotifyKey("^{Up}")
return

NumpadPgDn::
Numpad3::
	spotifyKey("^{Down}")
return

NumpadDel::
NumpadDot::
	spotifyKey("^+{Down}")
return

; MEDIA CONTROLS

Numpad0::
NumpadIns::Send {Media_Play_Pause}

Numpad1::
NumpadEnd::Send {Media_Prev}

Numpad2::
NumpadDown::Send {Media_Next}