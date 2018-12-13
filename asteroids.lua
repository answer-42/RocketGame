local vector = require "libs/vector"

local asteroids = {}
asteroids.database = {}
asteroids.number = 10

function asteroids.init()
  for i = 1, asteroids.number do
    local x = love.math.random(0, love.graphics.getWidth())
    local y = love.math.random(0, love.graphics.getHeight())
    asteroids.database[i] = { image = love.graphics.newImage("assets/asteroid.png"), position = vector(0, y), direction = love.math.random(0, 2*math.pi), speed = 0.1 }
  end
end

function asteroids.load()
end

function asteroids.update(dt)
    for i, asteroid in pairs(asteroids.database) do
      v_x = asteroid.speed * math.sin(-asteroid.direction)
      v_y = asteroid.speed * math.cos(-asteroid.direction)
      asteroid.position.x = (asteroid.position.x + v_x) % love.graphics.getWidth()
      asteroid.position.y = (asteroid.position.y + v_y) % love.graphics.getHeight()
    end
end

function asteroids.draw()
  for i, v in pairs(asteroids.database) do
    love.graphics.draw(v.image, v.position.x, v.position.y)
  end
end

function asteroids.resolve_collision(asteroid_number)
  table.remove(asteroids.database, asteroid_number)
  if #asteroids.database == 0 then
      gamestates.set_state("game_finished")
    end
end

return asteroids
