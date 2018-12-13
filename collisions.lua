local vector = require "libs/vector"
local collisions = {}

function collisions.resolve(rocket, asteroids, bullets)
  collisions.rocket_asteroids_collision(rocket, asteroids)
  collisions.bullets_asteroids_collision(bullets, asteroids)
end

function collisions.rocket_asteroids_collision(rocket, asteroids)
  for i, asteroid in pairs(asteroids) do
    local distance = rocket.position:dist(asteroid.position)
    if distance < 32 then
      rocket.resolve_collision()
    end
  end
end

function collisions.bullets_asteroids_collision(bullets, asteroids)
  for bullet_number, bullet in pairs(bullets) do
    for asteroid_number, asteroid in pairs(asteroids) do
    end
  end
end

return collisions
