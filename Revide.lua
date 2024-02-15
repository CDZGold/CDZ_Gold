setDefaultTab("Combat")

local revidar = false
addSwitch("revidar", "revidar", function(widget)
    revidar = not revidar
    widget:setOn(revidar)
end)

onTextMessage(function(mode, text)
  if revidar == true and not g_game.getAttackingCreature() and string.find(text, "You lose") then
    local targetName = string.sub(text, string.find(text, " [^ ]*$") + 1, #text - 1)
  local target = getPlayerByName(targetName)
if target then
  g_game.attack(target)
  CaveBot.setOff()
  TargetBot.setOff()
end
  end
end)