scriptname affsnamemanager

FormList Property affsFloraForms  auto

Event OnInit()

EndEvent

string Function GetPlantIdentNameAddress
    return ".ffs." + Game.GetPlayer().GetName() + ".name"
EndFunction

bool Function UpdateIdentifiedNames()
    Int index = affsFloraForms.GetSize()
    
    string identifiedAddress = ".ffs." + Game.GetPlayer().GetName() + ".identified"
    While index
        index -= 1
        Flora currentFlora = affsFloraForms.GetAt(index) as Flora
        Int isIdentified = JFormDB.getInt(currentFlora, nameAddress)
        if (isIdentified)
            currentFlora.SetName(JFormDB.getStr(currentFlora, GetPlantIdentNameAddress()))
        EndIf
    EndWhile
EndFunction

Function StoreVanillaNames()
    string nameAddress = ".ffs." + Game.GetPlayer().GetName() + ".name"
    Int index = affsFloraForms.GetSize()
    While index
        index -= 1
        Flora currentFlora = affsFloraForms.GetAt(index) as Flora
        JFormDB.setStr(currentFlora, nameAddress, currentFlora.GetName())
    EndWhile
    
EndFunction