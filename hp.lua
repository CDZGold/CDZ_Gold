setDefaultTab("HP")

if storage.healspell == nil then
  storage.healspell = 'regeneration'
end

macro(2000, function()
  if player:getLevel() < 200 then
    storage.healspell = 'regeneration'
  elseif player:getLevel() >= 200 then
    storage.healspell = 'super regeneration'
  end
end)

healmacro = macro(200, 'heal', function()
  if hppercent() < 99 then
    say(storage.healspell)
  end
 end)

UI.Label('Id Heal Item')
UI.TextEdit(storage.hpitem or "3060", function(widget, newText)
storage.hpitem = newText
end)

UI.Label('HpToUse(apenasNumeros)')
UI.TextEdit(storage.hptouse or "40", function(widget, newText)
storage.hptouse = newText
end)

itemhealmacro = macro(200, 'Item heal', function()
  if hppercent() < tonumber(storage.hptouse) then
    use(tonumber(storage.hpitem))
  end
end)

UI.Separator()

UI.Label("Mana shield spell:")
UI.TextEdit(storage.manaShield or "Yomotsu Shield", function(widget, newText)
  storage.manaShield = newText
end)

local lastManaShield = 0
macro(20, "mana shield", function() 
  if hasManaShield() or lastManaShield + 90000 > now then return end
    say(storage.manaShield)
end)

UI.Label("Haste spell:")
UI.TextEdit(storage.hasteSpell or "speed up", function(widget, newText)
  storage.hasteSpell = newText
end)

macro(500, "haste", function() 
  if hasHaste() then return end
  if TargetBot then 
    TargetBot.saySpell(storage.hasteSpell) -- sync spell with targetbot if available
  else
    say(storage.hasteSpell)
  end
end)

UI.Label("Anti paralyze spell:")
UI.TextEdit(storage.antiParalyze or "speed up", function(widget, newText)
  storage.antiParalyze = newText
end)

macro(100, "anti paralyze", function() 
  if not isParalyzed() then return end
  if TargetBot then 
    TargetBot.saySpell(storage.antiParalyze) -- sync spell with targetbot if available
  else
    say(storage.antiParalyze)
  end
end)

UI.Separator()

UI.Separator()