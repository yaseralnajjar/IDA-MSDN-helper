#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=favicon.ico
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****

; Z-Rantom | AT4RE
; 2015/01/12
; Special thx to Koud3lka

Run("idaq.exe")

if _CheckOpenOneTime() = 0 then exit

HotKeySet("!z", "HotKeyPressed") ; Alt-z

While 1
    Sleep(100)
	if not ProcessExists("idaq.exe") and not ProcessExists("idaq64.exe") then exit
WEnd

Func HotKeyPressed()
    Switch @HotKeyPressed ; The last hotkey pressed

        Case "!z" ; String is the Alt-d hotkey.
			if WinActive("IDA") Then

				Send("^C")
				$x = ClipGet()
				$x = StringReplace($x, ";", "")
				$x = StringReplace($x, "ds:", "")
				$x = StringReplace($x, "call", "")
				$x = StringReplace($x, " ", "")
				if Asc(StringMid($x, StringLen($x), 1)) = Asc("A") then $x = StringMid($x, 1, StringLen($x)-1)
				if Asc(StringMid($x, StringLen($x), 1)) = Asc("W") then $x = StringMid($x, 1, StringLen($x)-1)

				if not WinExists("H3Viewer 1.") then run("C:\Program Files (x86)\Helpware\H3Viewer\h3viewer.exe")
				if not WinExists("H3Viewer 1.") then run("C:\Program Files\Helpware\H3Viewer\h3viewer.exe")
				WinActivate("H3Viewer 1.")
				WinSetState("H3Viewer 1.", "", @SW_SHOW)
				WinWaitActive("H3Viewer 1.")

				Send("^2")
				ControlSetText("H3Viewer 1.", "", "[CLASS:TTntEdit.UnicodeClass; INSTANCE:2]", "")
				ControlSetText("H3Viewer 1.", "", "[CLASS:TTntEdit.UnicodeClass; INSTANCE:2]", $x)
				Send("{ENTER}")

				sleep(50)
				If ControlGetText("H3Viewer 1.", "", "[CLASS:TTntEdit.UnicodeClass; INSTANCE:2]") <> $x then
					ControlSetText("H3Viewer 1.", "", "[CLASS:TTntEdit.UnicodeClass; INSTANCE:2]", "")
					ControlSetText("H3Viewer 1.", "", "[CLASS:TTntEdit.UnicodeClass; INSTANCE:2]", $x)
					Send("{ENTER}")
				EndIf

			EndIf

    EndSwitch
EndFunc   ;==>HotKeyPressed

Func _CheckOpenOneTime()
	If Not ProcessExists(@AutoItPID) Then Return SetError(1, 0, '')
	If Not @error Then
		Local $a_Processes = ProcessList()
		For $i = 1 To $a_Processes[0][0]
			If $a_Processes[$i][1] = @AutoItPID Then ExitLoop
		Next
		$list = ProcessList($a_Processes[$i][0])
		If $list[0][0] > 1 Then Return 0
		If $list[0][0] = 1 Then Return 1
	EndIf
	Return SetError(1, 0, '')
EndFunc
