require("Home_MultipleNmuberByName")

function GetHome_MultipleBtnUis(ui)
  local uis = {}
  uis.WordTxt = ui:GetChild("WordTxt")
  uis.Nmuber = GetHome_MultipleNmuberUis(ui:GetChild("Nmuber"))
  uis.buttonCtr = ui:GetController("button")
  uis.root = ui
  return uis
end
