local vector = require "libs/vector"
local collisions = {}

function collisions.resolve(rocket, asteroids, bullets)
  collisions.rocket_asteroids_collision(rocket, asteroids)
  collisions.bullets_asteroids_collision(bullets, asteroids)
end

function collisions.rocket_asteroids_collision(rocket, asteroids)
  for i, asteroid in pairs(asteroids.database) do
    local distance = rocket.position:dist(asteroid.position)
    if distance < 32 then
      rocket.resolve_collision()
    end
  end
end

function collisions.bullets_asteroids_collision(bullets, asteroids)
  for bullet_number, bullet in pairs(bullets.database) do
    for asteroid_number, asteroid in pairs(asteroids.database) do
      if bullet.position:dist(asteroid.position) < 21 then -- 16 + bullet.radius = 21
        bullets.resolve_collision(bullet_number)
        asteroids.resolve_collision(asteroid_number)
      end
    end
  end
end

return collisions
