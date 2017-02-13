Scriptname ffsPlantIdent extends ReferenceAlias  

int isFlora = 0;

Event OnInit()
	RegisterForCrosshairRef()
EndEvent

bool Function isFlora(ObjectReference flora)
	return false
endFunction

Event OnCrosshairRefChange(ObjectReference ref)
;	If ref && ref as Flora
;		Debug.Trace("Targeted a Flora")
;              isFlora=1
;   else
;         Debug.Trace("Targetting nothing or a non-flora")
;         isFlora=0
;	EndIf
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

