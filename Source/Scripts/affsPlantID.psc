Scriptname affsPlantID extends ReferenceAlias  
import JArray
Event OnActivate(ObjectReference akActionRef)
    string identifiedAddress = ".ffs." + Game.GetPlayer().GetName() + ".identified"
    If akActionRef == Game.GetPlayer()
        int isIdentified = JFormDB.GetInt(self.GetReference().GetBaseObject(), identifiedAddress)
        if isIdentified == 0
        EndIf
    EndIf
EndEvent

function IdentifyPlant(Flora plant)
    string nameAddress = ".ffs." + Game.GetPlayer().GetName() + ".name"
    string identifiedAddress = ".ffs." + Game.GetPlayer().GetName() + ".identified"
    JFormDB.setStr(plant, identifiedAddress, 1)
    plant.SetName(JFormDb.getStr(plant, nameAddress))
EndFunction