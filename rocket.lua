local vector = require "libs/vector"

local rocket = {}
rocket.position = vector(300, 300)
rocket.speed = vector(0, 0)
rocket.direction = 0

function rocket.load()
  rocket.image = love.graphics.newImage("assets/rocket.png")
end

function rocket.update( dt )
  if love.keyboard.isDown("left") then
    rocket.direction = rocket.direction - 0.01
  elseif love.keyboard.isDown("right") then
    rocket.direction = rocket.direction + 0.01
  elseif love.keyboard.isDown("up") then
    rocket.speed.x = rocket.speed.x - dt * math.sin(-rocket.direction)
    rocket.speed.y = rocket.speed.y - dt * math.cos(-rocket.direction)
  end
  rocket.position.x = rocket.position.x + rocket.speed.x
  rocket.position.y = rocket.position.y + rocket.speed.y
end

function rocket.draw()
  love.graphics.draw(rocket.image,
                     rocket.position.x,
                     rocket.position.y,
                     rocket.direction,
                     1,
                     1,
                     16, -- Offset of 16px so that rot. around middle of rocket
                     16) -- Offset of 16px so that rot. around middle of rocket
end

return rocket
