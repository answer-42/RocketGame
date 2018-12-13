gamestates = require "gamestates"

function love.load()
  love.window.setMode(450,800, {resizable = true,vsync = false})
  love.window.setTitle("RocketGame")
  gamestates.set_state("menu")
end

function love.update(dt)
  gamestates.state_event("update", dt)
end

function love.draw()
  gamestates.state_event("draw")
end

function love.keyreleased(key, code)
  gamestates.state_event("keyreleased", key, code)
end

function love.quit()
end
