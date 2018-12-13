local vector = require "libs/vector"

local bullets = {}
bullets.database = {}

local radius = 5
local segments = 10
local speed = 1

local time

function bullets.init()
  bullets.database = {}
  time = love.timer.getTime()
end

function bullets.load()
end

function bullets.update(dt)
  for i, v in pairs(bullets.database) do
    if v.position.x > 0 and v.position.x < love.graphics.getWidth() and v.position.y > 0 and v.position.y < love.graphics.getHeight() then
      v.position.x = v.position.x + v.speed.x
      v.position.y = v.position.y + v.speed.y
    else
      table.remove(bullets.database, i)
    end
  end
end

function bullets.draw()
  for i, v in pairs(bullets.database) do
    love.graphics.setColor(0, 1, 0)
    love.graphics.circle("fill", v.position.x, v.position.y, radius, segments)
    love.graphics.setColor(255, 255, 255)
  end
end

function bullets.shoot_bullet(rocket)
  local direction = rocket.direction
  local x = rocket.position.x + 16 * math.sin(direction)
  local y = rocket.position.y - 16 * math.cos(direction)

  if love.timer.getTime() - time > 0.2 then
    table.insert(bullets.database, {position = vector(x,y),
                                    direction = direction,
                                    speed = vector(speed*-math.sin(-direction), speed*-math.cos(-direction))})
    time = love.timer.getTime()
  end
end

function bullets.resolve_collision(bullet_number)
  table.remove(bullets.database, bullet_number)
end

return bullets
