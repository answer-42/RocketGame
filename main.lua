local rocket = require "rocket"
local asteroids = require "asteroids"

function love.load()
  love.window.setMode(450,800, {resizable = true,vsync = false})
  love.window.setTitle("RocketGame")
  rocket.load()
  asteroids.load()
end

function love.update(dt)
  rocket.update(dt)
  asteroids.update(dt)
end

function love.draw()
  rocket.draw()
  asteroids.draw()
end

function love.quit()
end

function love.keyreleased(key)
  if key == "escape" then
    love.event.quit()
  end
end
