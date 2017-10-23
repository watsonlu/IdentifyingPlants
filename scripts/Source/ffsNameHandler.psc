Scriptname ffsNameHandler

FormList property AllFlora auto

; todo: make a global namespace variable

Function saveAllFlora(FormList allFlora) global
	Int index = allFlora.GetSize()
	While index
		index -= 1
		Form flora = allFlora.GetAt(index) as Form
		JFormDb.setStr(flora, ".ffs.originalname", flora.GetName())
	EndWhile
EndFunction

Function updateDiscoveredFlora(FormList allFlora) global
	; not yet implemented
	; This should loop through the list of flora, checking to see if they are identified, and if so, setting their name correctly
EndFunction

Function saveName(Form plant, String name) global
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
