Scriptname ffsPlantIdent extends ReferenceAlias

import ffsNameHandler

FormList property AllFlora auto

int isFlora = 0;
String undiscoveredText = "Unknown Plant"

Event OnInit()
	RegisterForCrosshairRef()
EndEvent

bool Function isFlora(ObjectReference ref)
	If ref && ref.GetBaseObject() as Flora
		return true
	Else
		return false
	EndIf
endFunction

Event OnCrosshairRefChange(ObjectReference ref)
	If isFlora(ref)
		isFlora = 1
	Else
		isFlora = 0
	EndIf
EndEvent

Event OnPlayerLoadGame()
	saveAllFlora(allFlora)
	updateDiscovered(allFlora)
EndEvent


Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
      If (akBaseItem as Ingredient)
         ;Picked up an Ingredient
         if (isFlora == 1)
             ;picked up Ingredient while looking at a flora
             Debug.Trace("Player harvested an Ingredient")
             storeData(akBaseItem)
         EndIf
      EndIf
EndEvent

