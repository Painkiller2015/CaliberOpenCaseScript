Global $Paused
Global $Resolutin = FileReadLine("Config.txt", 1)
Global $ArrayPriority[10]= [0,0,0,0,0,0,0,0,0,0]

For $i = 0 To 9					
		$ArrayPriority[$i] =  Priority(FileReadLine("Config.txt", $i+2)) ;Get Name Resorse in Config
Next

Switch $Resolutin			
	Case "1920"
		Local $ButtonX = 1620
		Local $ButtonY = 878
	
		Local $Coord1[4] = [260, 340, 500, 600]
		Local $Coord2[4] = [550, 340, 485, 600]
		Local $Coord3[4] = [840, 340, 1080, 600]
		Local $Coord4[4] = [1140, 340, 1380, 600]
		Local $Coord5[4] = [1430, 340, 1670, 600]
	
	Case "2440"
		Local $ButtonX = 2150
		Local $ButtonY = 1170
		
		Local $Coord1[4] = [375, 600, 610, 765]
		Local $Coord2[4] = [775, 600, 1010, 765]
		Local $Coord3[4] = [1165, 600, 1400, 765]
		Local $Coord4[4] = [1540, 600, 1810, 765]
		Local $Coord5[4] = [1900, 600, 2200, 765]
EndSwitch

HotKeySet("{NUMPAD1}", "OpenCase")
HotKeySet("{NUMPAD2}", "Wait")
HotKeySet("{ESC}", "Terminate")

Func OpenCase()					;???????? ???????
	While 1
		Sleep(1000)
		MouseClick("left", $ButtonX, $ButtonY) 
		Sleep(4000)
		
		
		For $i = 0 To 9				
				Local $Cell1 = PixelSearch($Coord1[0], $Coord1[1], $Coord1[2], $Coord1[3], $ArrayPriority[$i], 10)	
				Local $Cell2 = PixelSearch($Coord2[0], $Coord2[1], $Coord2[2], $Coord2[3], $ArrayPriority[$i], 10)
				Local $Cell3 = PixelSearch($Coord3[0], $Coord3[1], $Coord3[2], $Coord3[3], $ArrayPriority[$i], 10)
				Local $Cell4 = PixelSearch($Coord4[0], $Coord4[1], $Coord4[2], $Coord4[3], $ArrayPriority[$i], 10)
				Local $Cell5 = PixelSearch($Coord5[0], $Coord5[1], $Coord5[2], $Coord5[3], $ArrayPriority[$i], 10)
			Switch $Resolutin
				Case "1920"
					If $Cell1<> 0 Then 
MouseClick("left",364, 670) 
						Sleep(500)
						MouseClick("left", $ButtonX, $ButtonY) 
						ExitLoop
					EndIf
	
					If $Cell2<> 0 Then 
MouseClick("left", 666, 670) 
						Sleep(500)
						MouseClick("left", $ButtonX, $ButtonY) 
						ExitLoop
					EndIf
					
					If $Cell3<> 0 Then 
MouseClick("left", 960, 670) 
						Sleep(500)
						MouseClick("left", $ButtonX, $ButtonY) 
						ExitLoop
					EndIf
					
					If $Cell4<> 0 Then 
MouseClick("left", 1250, 670) 
						Sleep(500)
						MouseClick("left", $ButtonX, $ButtonY) 
						ExitLoop
					EndIf
					
					If $Cell5<> 0 Then 
MouseClick("left", 1545, 670) 
						Sleep(500)
						MouseClick("left", $ButtonX, $ButtonY) 
						ExitLoop
					EndIf
				
				Case "2440"
					If $Cell1 <> 0 Then 
						MouseClick("left", 500, 900) 
						Sleep(500)
						MouseClick("left", $ButtonX, $ButtonY) 
						ExitLoop
					EndIf
					If $Cell2 <> 0 Then 
						MouseClick("left", 895, 900) 
						Sleep(500)
						MouseClick("left", $ButtonX, $ButtonY) 
						ExitLoop
					EndIf
					If $Cell3 <> 0 Then 
						MouseClick("left", 1290, 900) 
						Sleep(500)
						MouseClick("left", $ButtonX, $ButtonY) 
						ExitLoop
					EndIf
					If $Cell4 <> 0 Then 
						MouseClick("left", 1685, 900) 
						Sleep(500)
						MouseClick("left", $ButtonX, $ButtonY) 
						ExitLoop
					EndIf
					If $Cell5<> 0 Then 
						MouseClick("left",  2080, 900) 
						Sleep(500)
						MouseClick("left", $ButtonX, $ButtonY) 
						ExitLoop
					EndIf
			EndSwitch
		
		Next
	
		ContinueLoop
	
		For $i = 0 To 9
			TakeCell($ArrayPriority[$i], $Cell1, $Cell2, $Cell3, $Cell4, $Cell5)
		Next
	
	WEnd
EndFunc

While 1									 ;???????? ??????
	Sleep (100)
WEnd

Func Priority($Resourse)			;?????? ???????????? ?????
	Switch $Resourse
	Case $Resourse = "Secret Drafts" 
	    Return 4333658
	Case $Resourse = "Blueprints" 
	    Return 3241406 	
	Case $Resourse = "Microchips" 
	    Return 3040201
	Case $Resourse = "Encrypted Messages" 
	    Return 15521181
	Case $Resourse = "Chemical Comonents" 
	    Return 11918904 
	Case $Resourse = "CompositeMaterials" 
	    Return 7368311
	Case $Resourse = "Fuels" 
	    Return 6444113
	Case $Resourse = "Alloys" 
	    Return 1580319 
	Case $Resourse = "Medications" 
	    Return 1645855
	Case $Resourse = "Spare Parts" 
	    Return 2830647 
EndSwitch
EndFunc

	
Func Terminate() 					;????????????? ??????????
    Exit 0
EndFunc

Func Wait()
	While 1									 ;???????? ??????
	Sleep (100)
	WEnd
EndFunc

#Coord Pixel
#310 - 480x666 GetColorFirstCells
#703 - 873x666 GetColorSecondCells
#1097 - 1267x666 GetColorThreeCells
#1490 - 1660x666 GetColorFourCells
#1883 - 2053x666 GetColorFiveCells

#Color 2k
#3040201 Microchips
#1645855 Medications
#1580319 Alloys
#11918904 Chemical Comonents
#3241406 Blueprints
#15521181 Encrypted Messages
#2830647 Spare Parts
#4333658 Secret Drafts
#6444113 Fuels
#7368311 CompositeMaterials

#CellButton
#500x900 TakeFirstCells
#895x900 TakeSecondCells
#1290x900 TakeThreeCells
#1685x900 TakeFourCells
#2080x900 TakeFiveCells
