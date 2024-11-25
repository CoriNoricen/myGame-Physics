function love.load()
    wf = require 'Libraries/windfield'

    -- in brackets (x -> y for gravity)
    world = wf.newWorld(0, 500)

    -- x position, y position, radius
    player = world:newCircleCollider(150, 355, 45)

    ball = world:newCircleCollider(400, 600, 20)

    -- x position, y position, width, height
    groundBase = world:newRectangleCollider(100, 400, 600, 25)
    groundMiddle = world:newRectangleCollider(400, 300, 300, 100)
    groundTop = world:newBSGRectangleCollider(150, 100, 300, 50, 20)
    groundBase:setType('static')
    groundMiddle:setType('static')
    groundTop:setType('static')

    leftWall = world:newRectangleCollider(-10, 0, 10, 575)
    rightWall = world:newRectangleCollider(800, 0, 10, 575)
    upWall = world:newRectangleCollider(0, -10, 775, 10)
    downWall = world:newRectangleCollider(25, 600, 750, 10)
    leftWall:setType('static')
    rightWall:setType('static')
    upWall:setType('static')
    downWall:setType('static')

    lineLeft = world:newLineCollider(0, 575, 25, 600)
    lineRight = world:newLineCollider(800, 575, 775, 600)
    lineLeft:setType('static')
    lineRight:setType('static')
end

function love.update(dt)
    --prevents player from moving too quickly
    local px, py = player:getLinearVelocity()
    if love.keyboard.isDown('left') and px > -300 then
        player:applyForce(-8000, 0)
    elseif love.keyboard.isDown('right') and px < 300 then
        player:applyForce(8000,0)
    end

    world:update(dt)
end

function love.draw()
    world:draw()
end

function love.keypressed(key)
    --jump
    if key == 'up' then 
        -- quick force pushing on collidor (-5000 going up)
        player:applyLinearImpulse(0, -5000)
    end
end