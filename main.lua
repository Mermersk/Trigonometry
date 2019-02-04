
require("ball")

function love.load()

  bolti = Ball:create()
  bolti2 = Ball:create()
  bolti:initialize()
  bolti2:initialize()

  myBalls = {}
  for i = 1, 500 do
    table.insert(myBalls, Ball:create())
    myBalls[i]:initialize()
  end

  
  paused = false
end

function love.update(dt)
  if paused == false then
   
    bolti:update(dt)
    bolti2:update(dt)

    for i = 1, #myBalls do
      myBalls[i]:update(dt)
    end
  end


  --if angle < 2*math.pi then --Make it go a full circle, in radians that is about 6,30, wich is equivalent to 2*pi
    --angle = angle + angle_change*dt
  --end

end

function love.draw()

  for i = 1, #myBalls do
    myBalls[i]:draw()
  end
  bolti:draw()
  bolti2:draw()
  --love.graphics.print("Angle(radians): " .. angle, 5, 5)
  --love.graphics.print("X: " .. math.floor(x_dir), 5, 25)
  --love.graphics.print("Y: " .. math.floor(y_dir), 5, 50)

  --love.graphics.print("Cos angle: " .. math.cos(angle), 5, 80)

  --love.graphics.print("Sin angle: " .. math.sin(angle), 5, 110)

  love.graphics.print(bolti.x_dir)
  love.graphics.print(bolti2.x_dir, 0, 25)

end

function love.keypressed(key, scancode, isrepeat)

  if key == "return" then
    if paused == true then
      paused = false
    else
      paused = true
    end
  end
end
