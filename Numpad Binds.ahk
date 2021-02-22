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
NumpadHome::
	if WinExist("C:\Program Files (x86)\GOG Galaxy\GalaxyClient.exe")
		WinActivate, ahk_exe GalaxyClient.exe
	else
		RunWait C:\Program Files (x86)\GOG Galaxy\GalaxyClient.exe
		WinActivate
return

Numpad8::
NumpadUp::
	IfWinExist ahk_class SpotifyMainWindow {
		ifWinActive ahk_class SpotifyMainWindow
			WinMinimize
		else
			WinActivate
	else
		run "C:\Users\Ryan Comerford\AppData\Roaming\Spotify\Spotify.exe"
return

Numpad4::
NumpadLeft::
	RunWait C:\Program Files (x86)\Google\Chrome\Application\chrome.exe --profile-directory="Profile 2",, Max
	WinActivate
	WinMaximize
return

Numpad5::
NumpadClear::
	if WinExist("ahk_exe Discord.exe")
		WinActivate, ahk_exe Discord.exe
	else
		RunWait "C:\Users\Ryan Comerford\AppData\Local\Discord\Update.exe" --processStart="Discord.exe"
		WinActivate
return

; MC AUTORUN

Numpad9::
NumpadPgUp::
	toggle := !toggle
	if !toggle
		Send {Ctrl down}, {w down}
	else
		Send {Ctrl up}, {w up}
return

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
