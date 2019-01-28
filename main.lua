

function love.load()


  speed = 2
  x_dir = 300
  y_dir = 300
  angle_change = 1.5
  angle = 0

  vertices = {50, 50, 100, 50, 50, 100}

  horizontal_collision = false
  vertical_collision = false

  paused = false
end

function love.update(dt)

  x_dir = x_dir + (speed * math.sin(angle)) --How much to travel on the x-plane?
  y_dir = y_dir + (speed * math.cos(angle)) --How much to travel on the y-plane?
  
  if love.keyboard.isDown("up") then
    angle = angle + angle_change*dt
  end
  if love.keyboard.isDown("down") then
    angle = angle - angle_change*dt
  end

  screen_widht, screen_height = love.window.getMode()

  if x_dir > screen_widht or x_dir < 0 then --Collision detection at the window borders
    horizontal_collision = true
  end
  if y_dir > screen_height or y_dir < 0 then
    vertical_collision = true
  end

  if horizontal_collision == true then
    --speed = -speed
    angle = -angle
    horizontal_collision = false
  end
  if vertical_collision == true then
    angle = ((angle + (math.pi/2)) * -1) - (math.pi/2)
    --speed = -speeds
    vertical_collision = false
  end
  if love.keyboard.isDown("left") then
    speed = speed + 0.5*dt
  end



  --if angle < 2*math.pi then --Make it go a full circle, in radians that is about 6,30, wich is equivalent to 2*pi
    --angle = angle + angle_change*dt
  --end

end

function love.draw()

  love.graphics.polygon("line", vertices)
  love.graphics.circle("fill", x_dir, y_dir, 24)

  love.graphics.print("Angle(radians): " .. angle, 5, 5)
  love.graphics.print("X: " .. x_dir, 5, 25)
  love.graphics.print("Y: " .. y_dir, 5, 50)
  love.graphics.print(tostring(vertical_collision), 5, 75)

  love.graphics.line(x_dir, y_dir, 800, y_dir)
  love.graphics.line(x_dir, y_dir, x_dir, 600)

  love.graphics.print(math.cos(angle), 5, 400)

  love.graphics.print(math.sin(angle), 5, 430)

end

function love.keypressed(key, scancode, isrepeat)

  if key == "enter" then

    if paused == true then
      paused = false
    end
    if paused == false then
      paused = true
    end

  end

end
