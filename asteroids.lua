local vector = require "libs/vector"

asteroids = {}
asteroids.database = {}

function asteroids.load()
  asteroids.database[1] = { image = love.graphics.newImage("assets/asteroid.png"),
                            position = vector(100, 150),
                            direction = 15,
                            speed = 10 }
end

function asteroids.update(dt)
end

function asteroids.draw()
  for i, v in pairs(asteroids.database) do
    love.graphics.draw(v.image, v.position.x, v.position.y)
  end
end

return asteroids
