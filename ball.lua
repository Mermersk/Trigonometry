--Ball class

Ball = {}
Ball_mt = {__index = Ball}

function Ball:create()
    local b = {}
    setmetatable(b, Ball_mt)
    return b
end

function Ball:initialize()

    self.speed = love.math.random(1, 5)
    self.x_dir = love.math.random(25, 700)
    self.y_dir = love.math.random(25, 500)
    self.angle_change = 1.5
    self.angle = love.math.random(0, 6)

    self.xCollision = false
    self.yCollision = false

    self.color = {love.math.random(), love.math.random(), love.math.random()}

end

function Ball:update(dt)

    self.x_dir = self.x_dir + (self.speed * math.sin(self.angle)) --How much to travel on the x-plane?
    self.y_dir = self.y_dir + (self.speed * math.cos(self.angle)) --How much to travel on the y-plane?
    
    if love.keyboard.isDown("up") then
        self.angle = self.angle + self.angle_change*dt
    end
    if love.keyboard.isDown("down") then
        self.angle = self.angle - self.angle_change*dt
    end

    self.screen_widht, self.screen_height = love.window.getMode()

    if self.x_dir > self.screen_widht or self.x_dir < 0 then --Collision detection at the window borders
        self.xCollision = true
    end
    if self.y_dir > self.screen_height or self.y_dir < 0 then
        self.yCollision = true
    end

    if self.xCollision == true then
        self.angle = -self.angle
        self.xCollision = false
    end

    if self.yCollision == true then
        self.angle = ((self.angle + (math.pi/2)) * -1) - (math.pi/2)
        self.yCollision = false
    end
      
end


function Ball:draw()

    love.graphics.setColor(self.color)
    love.graphics.circle("fill", self.x_dir, self.y_dir, 24)
    love.graphics.setColor(1, 1, 1, 1)
end

return Ball

