setDefaultTab("Combat")

macro(100, 'Combo', function()
 if not g_game.isAttacking() or (stop and stop >= now) then return end
  if player:getLevel() >= 250 then
   say(storage.combo4)
end
 if player:getLevel() >= 150 then
   say(storage.combo3)
end
 if player:getLevel() >= 50 then
   say(storage.combo2)
end
 if player:getLevel() >= 1 then
  say(storage.combo1)
end
end)
UI.Label('Key Special 1')
UI.TextEdit(storage.keymagia1 or "F1", function(widget, newText)
storage.keymagia1 = newText
end)

onKeyPress(function(keys)
    if storage.ultimate == nil or modules.game_console:isChatEnabled() then return end
    if keys == storage.keymagia1 then
        say(storage.ultimate)
    end
end)
UI.Label('Key Special 2')
UI.TextEdit(storage.keymagia2 or "F2", function(widget, newText)
storage.keymagia2 = newText
end)

onKeyPress(function(keys)
    if storage.sspell == nil or modules.game_console:isChatEnabled() then return end
    if keys == storage.keymagia2 then
        say(storage.sspell)
    end
end)