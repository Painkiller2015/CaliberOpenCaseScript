Global $Paused
Global $ArrayPriority[10]= [0,0,0,0,0,0,0,0,0,0]
$Resolutin = FileReadLine("Config.txt", 1)

Switch $Resolutin			;Задаёт значение исходя из разрешения экрана		
	Case "1920"
		Local $ButtonX = 1620
		Local $ButtonY = 878
		
		Local  $YColor = 500;
		Local $GetColorFirstCells[2] = [338, $YColor]
		Local $GetColorSecondCells[2] = [632, $YColor]
		Local $GetColorThreeCells[2] = [928, $YColor]
		Local $GetColorFourCells[2] = [1223, $YColor]
		Local $GetColorFiveCells[2] = [1518, $YColor]

		Local $YCell = 672 								;x+137
		Local $TakeFirstCells = [370, $YCell]
		Local $TakeSecondCells = [665, $YCell]
		Local $TakeThreeCells = [960, $YCell]
		Local $TakeFourCells = [1255, $YCell]
		Local $TakeFiveCells = [1550, $YCell]
		
		
		For $i = 0 To 9				
			$ArrayPriority[$i] = PriorityFHD(FileReadLine("Config.txt", $i+2))
		Next
		
	Case "2440"
		Local $ButtonX = 2150
		Local $ButtonY = 1170
		
		Local $YColor = 666;
		Local $GetColorFirstCells[2] = [480, $YColor]
		Local $GetColorSecondCells[2] = [873, $YColor]
		Local $GetColorThreeCells[2] = [1267, $YColor]
		Local $GetColorFourCells[2] = [1660, $YColor]
		Local $GetColorFiveCells[2] = [2053, $YColor]

		Local $YCell = 900
		Local $TakeFirstCells = [500, $YCell]
		Local $TakeSecondCells = [895, $YCell]
		Local $TakeThreeCells = [1290, $YCell]
		Local $TakeFourCells = [1685, $YCell]
		Local $TakeFiveCells = [2080, $YCell]
		
		For $i = 0 To 9						;Приоритеты в массив
			$ArrayPriority[$i] =  Priority2K(FileReadLine("Config.txt", $i+2)) ;Get Name Resorse in Config
		Next
EndSwitch
	



HotKeySet("{NUMPAD1}", "OpenCase")
HotKeySet("{ESC}", "Terminate")

Func OpenCase()					;Основная функция
	While 1
		Sleep(500)
		MouseClick("left", $ButtonX, $ButtonY) 
		Sleep(4000)
		
		Local $Cell1 = PixelGetColor ($GetColorFirstCells[0], $GetColorFirstCells[1])			; take color
		Local $Cell2 = PixelGetColor ($GetColorSecondCells[0] ,$GetColorSecondCells[1] )
		Local $Cell3 = PixelGetColor ($GetColorThreeCells[0], $GetColorThreeCells[1])
		Local $Cell4 = PixelGetColor ($GetColorFourCells[0], $GetColorFourCells[1])
		Local $Cell5 = PixelGetColor ($GetColorFiveCells[0], $GetColorFiveCells[1])

For $i = 0 To 9
	TakeCell($ArrayPriority[$i], $Cell1, $Cell2, $Cell3, $Cell4, $Cell5)
Next
	
	WEnd
EndFunc
While 1									 ;Ожидание команд
	Sleep (100)
WEnd

Func PriorityFHD($Resourse)			;Задаёт приоритетные цвета
	
	Switch $Resourse
	Case $Resourse = "Secret Drafts" 
	    Return 5317997
	Case $Resourse = "Blueprints" 
	    Return 10730715
	Case $Resourse = "Microchips" 
	    Return 3553083
	Case $Resourse = "Encrypted Messages" 
	    Return 15520925
	Case $Resourse = "Chemical Comonents" 
	    Return 9090393
	Case $Resourse = "CompositeMaterials" 
	    Return 2630699
	Case $Resourse = "Fuels" 
	    Return 7694180
	Case $Resourse = "Alloys" 
	    Return 7690574
	Case $Resourse = "Medications" 
	    Return 13885676
	Case $Resourse = "Spare Parts" 
	    Return 2040100
EndSwitch
EndFunc

Func Priority2K($Resourse)			;Задаёт приоритетные цвета
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
	

Func TakeCell($Priority, $Cell1, $Cell2, $Cell3, $Cell4, $Cell5) ;Выбирает нужный ресурс
	Switch $Priority
		Case $Cell1
			MouseClick("left", 500, 900) 
			Sleep(500)
			MouseClick("left", $ButtonX, $ButtonY) 
		
		Case $Cell2
			MouseClick("left", 895, 900) 	
			Sleep(500)
			MouseClick("left", $ButtonX, $ButtonY) 
			
		Case $Cell3
			MouseClick("left", 1290, 900) 
			Sleep(500)
			MouseClick("left", $ButtonX, $ButtonY) 
		
		Case $Cell4
			MouseClick("left", 1685, 900) 	
			Sleep(500)
			MouseClick("left", $ButtonX, $ButtonY) 
		
		Case $Cell5
			MouseClick("left", 2080, 900) 
			Sleep(500)
			MouseClick("left", $ButtonX, $ButtonY) 
	EndSwitch		
EndFunc
Func Terminate() 					;Останавливает выполнение
    Exit 0
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
