Scriptname ffsNameHandler

; todo: make a global namespace variable

Function saveAllFlora(FormList allFlora) global
	Int index = allFlora.GetSize()
	While index
		index -= 1
		Form flora = allFlora.GetAt(index) as Form
		saveOriginalName(flora, flora.GetName())
	EndWhile
EndFunction

Function updateDiscoveredFlora(FormList allFlora) global
	Int index = allFlora.GetSize()
	While index
		index -= 1
		Form flora = allFlora.GetAt(index) as Form
		bool identified = isFloraIdentified(flora)
		if identified
			; not yet implemented, set new name
		endif
	endwhile
EndFunction

Function saveOriginalName(Form plant, String name) global
	JFormDB.setStr(plant, ".ffs.originalname", name)
endFunction

String Function getSavedName(Form plant) global
	return JFormDB.getStr(plant, ".ffs.originalname")
endFunction

Bool Function unidentifyFlora(Form plant) global
	JFormDB.setFlt(plant, ".ffs.identified", 0)
endFunction

Bool Function identifyFlora(Form plant) global
	JFormDB.setFlt(plant, ".ffs.identified", 1)
endFunction

Bool Function isFloraIdentified(Form plant) global
    Int ident = JFormDB.getInt(plant, ".ffs.identified")
    if ident == 1
    	return True
    endIf
    return false
endfunction
