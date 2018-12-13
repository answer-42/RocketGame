local game = {}

local vector = require "libs/vector"

local rocket = require "rocket"
local asteroids = require "asteroids"
local collisions = require "collisions"
local bullets = require "bullets"

function game.enter(_, new_game)
  if new_game == "new_game" then
    rocket.init()
    asteroids.init()
    bullets.init()
  elseif new_game == "paused_game" then
  end
end

function game.load(old_state_name, state)
  rocket.load(state)
  asteroids.load(state)
  bullets.load(state)
end

function game.update(dt)
  rocket.update(dt)
  asteroids.update(dt)
  bullets.update(dt)
  collisions.resolve(rocket, asteroids.database, bullets.database)
end

function game.draw()
  rocket.draw()
  asteroids.draw()
  bullets.draw()
end

function game.keyreleased(key, code)
  if key == "escape" then
    gamestates.set_state("game_paused")
  end
end

return game
