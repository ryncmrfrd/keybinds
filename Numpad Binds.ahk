#NoEnv
#Warn

SendMode Input
SetWorkingDir %A_ScriptDir%

DetectHiddenWindows, On

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

; VOLUME CONTROLS (SPOTIFY)

Numpad8::
NumpadUp::
	spotifyKey("^{Down}")
return

Numpad9::
NumpadPgUp::
	spotifyKey("^{Up}")
return

; MEDIA CONTROLS

Numpad0::
NumpadIns::
	Send {Media_Play_Pause}
return

Numpad1::
NumpadEnd::Send {Media_Prev}

Numpad2::
NumpadDown::Send {Media_Next}