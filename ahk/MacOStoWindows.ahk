;
; AutoHotkey Version: 1.x
; 
; 
; --------------------------------------------------------------
; Emulate OSX keymap layout
; on Windows
; --------------------------------------------------------------
 
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance force

 
; --------------------------------------------------------------
; NOTES
; --------------------------------------------------------------
; ! = ALT
; ^ = CTRL
; + = SHIFT
; # = WIN
 

; Switching between windows
LCtrl & Tab::AltTab
 
;following section remaps alt-delete keys to mimic OSX
;command-delete deletes whole line
^BS::Send {LShift down}{Home}{LShift Up}{Del}
 
;alt-function-delete deletes next word
!Delete::Send {LShift down}{LCtrl down}{Right}{Lctrl up}{LShift Up}{Del}
 
;alt-delete deletes previous word
!BS::Send {LShift down}{LCtrl down}{Left}{Lctrl up}{LShift Up}{Del}
 
;following section mimics command-q and command-w
;behaviour to close windows
^SC011::^F4 ;w
^SC010::Send {LAlt down}{Ctrl up}{F4}{LAlt up} ;q
; Ctrl+H (cmd+h) to hide window
^SC023::WinMinimize,a ;h
 
 
;following section remaps alt-arrow and command-arrow
;keys to mimic OSX behaviour
^Up::Send {Lctrl down}{Home}{Lctrl up}
^Down::Send {Lctrl down}{End}{Lctrl up}
^Left::Send {Home}
^Right::Send {End}
^+Up::Send {Shift down}{Lctrl down}{Home}{Lctrl up}{Shift up}
^+Down::Send {Shift down}{Lctrl down}{End}{Lctrl up}{Shift up}
^+Left::Send {Shift down}{Home}{Shift up}
^+Right::Send {Shift down}{End}{Shift up} 
 
; Tabs switching
^#Left::Send {LCtrl down}{LShift down}{Tab}{LShift up}{LCtrl up}
^#Right::Send {LCtrl down}{Tab}{LCtrl up}
 
; Switching between windows of the same app
^SC056::    ; Next window Cmd+\ (left from Z)
WinGetClass, ActiveClass, A
WinGet, WinClassCount, Count, ahk_class %ActiveClass%
IF WinClassCount = 1
    Return
Else
WinSet, Bottom,, A
WinActivate, ahk_class %ActiveClass%
return
 
; --------------------------------------------------------------
; Application specific
; --------------------------------------------------------------
 
; Google Chrome
#IfWinActive, ahk_class Chrome_WidgetWin_1
 
; Show Web Developer Tools with cmd + alt + i
^!SC017::Send {F12} ;i
 
; Show source code with cmd + alt + u
^!SC016::Send {Alt up}{LCtrl down}{SC016}{LCtrl up} ;u
 
#IfWinActive