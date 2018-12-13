local game_finished = {}

function game_finished.load()
end

function game_finished.update(dt)
end

function game_finished.draw()
  love.graphics.print("Press Enter to start playing.\nEscape to quit.", 100, 100)
end

function game_finished.keyreleased(key, code)
  if key == "return" then
    gamestates.set_state("game", "new_game")
  elseif key == "escape" then
    love.event.quit()
  end
end

return game_finished
