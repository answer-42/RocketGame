local menu = {}

function menu.load()
end

function menu.update(dt)
end

function menu.draw()
  love.graphics.print("Press Enter to start playing.\nEscape to quit.", 100, 100)
end

function menu.keyreleased(key, code)
  if key == "return" then
    gamestates.set_state("game", "new_game")
  elseif key == "escape" then
    love.event.quit()
  end
end

return menu
