#NoEnv
#Warn

SendMode Input
SetWorkingDir %A_ScriptDir%

toggle := true

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
	if WinExist("ahk_exe Spotify.exe")
		WinActivate, ahk_exe Spotify.exe
	else
		RunWait C:\Users\Ryan Comerford\AppData\Roaming\Spotify\Spotify.exe
		WinActivate
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

; VOLUME CONTROLS

Numpad6::
NumpadRight::Send {Volume_Up}

NumpadPgDn::
Numpad3::Send {Volume_Down}

NumpadDel::
NumpadDot::Send {Volume_Mute}

; MEDIA CONTROLS

Numpad0::
NumpadIns::Send {Media_Play_Pause}

Numpad1::
NumpadEnd::Send {Media_Prev}

Numpad2::
NumpadDown::Send {Media_Next}
