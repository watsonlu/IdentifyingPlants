Scriptname ffsPlantIdent extends ReferenceAlias

int isFlora = 0;

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
		; not yet implemented
	EndIf
EndEvent


Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
      If (akBaseItem as Ingredient)
         ;Picked up an Ingredient
         if (isFlora == 1)
             ;picked up Ingredient while looking at a flora
             ;Do the thing
         EndIf
      EndIf
EndEvent

