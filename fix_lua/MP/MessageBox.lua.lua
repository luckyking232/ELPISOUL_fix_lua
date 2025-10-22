local MessageBox = {}

function MessageBox.Show(content, sureBtnParam, cancelBtnParam, touchScreenBtnParam, returnBtnParam, layer, checkboxParam)
  local tb = {}
  tb.text = content
  tb.sureBtnParam = sureBtnParam
  tb.cancelBtnParam = cancelBtnParam
  tb.touchScreenBtnParam = touchScreenBtnParam
  tb.returnBtnParam = returnBtnParam
  tb.checkboxParam = checkboxParam
  OpenWindow(WinResConfig.CurrencyWindow.name, layer, tb)
end

return MessageBox
