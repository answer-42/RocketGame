local vector = require "libs/vector"
local bullets = require "bullets"

local rocket = {}
rocket.position = vector(0, 0)
rocket.speed = vector(0, 0)
rocket.direction = 0

function rocket.init()
  rocket.position = vector(300, 300)
  rocket.speed = vector(0, 0)
  rocket.direction = 0
end

function rocket.load()
  rocket.init()
  rocket.image = love.graphics.newImage("assets/rocket.png")
end

function rocket.update( dt )
  if love.keyboard.isDown("left") then
    rocket.direction = rocket.direction - 0.01
  end
  if love.keyboard.isDown("right") then
    rocket.direction = rocket.direction + 0.01
  end
  if love.keyboard.isDown("up") then
    rocket.speed.x = rocket.speed.x - dt * math.sin(-rocket.direction)
    rocket.speed.y = rocket.speed.y - dt * math.cos(-rocket.direction)
  end
  if love.keyboard.isDown("space") then
    bullets.shoot_bullet(rocket)
  end
  rocket.position.x = (rocket.position.x + rocket.speed.x) % love.graphics.getWidth()
  rocket.position.y = (rocket.position.y + rocket.speed.y) % love.graphics.getHeight()
end

function rocket.draw()
  love.graphics.draw(rocket.image, rocket.position.x, rocket.position.y, rocket.direction, 1, 1, 16, 16) -- Offset of 16px so that rot. around middle of rocket
  for x = -1, 1 do
    for y = -1, 1 do
      love.graphics.draw(rocket.image, rocket.position.x + love.graphics.getWidth()*x, rocket.position.y + love.graphics.getHeight()*y, rocket.direction, 1, 1, 16, 16) -- Offset of 16px so that rot. around middle of rocket
    end
  end
  -- love.graphics.circle("line", rocket.position.x, rocket.position.y, 16, 20)
end

function rocket.resolve_collision()
  gamestates.set_state("game_finished")
end

return rocket
