#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


NumpadAdd::Send     {F14} ; discord deafen
NumpadEnter::Send   {F13} ; discord mute

Numpad6::
NumpadRight::Send {Volume_Up} ; volume up

NumpadPgDn::
Numpad3::Send {Volume_Mute} ; volume mute

NumpadDel::
NumpadDot::Send {Volume_Down} ; volume down

Numpad0::
NumpadIns::Send {Media_Play_Pause} ; play/pause

Numpad1::
NumpadEnd::Send {Media_Prev} ; previous

Numpad2::
NumpadDown::Send {Media_Next} ; next