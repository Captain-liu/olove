
require  "framework/init"


require "app/Level"
local level = nil
function love.load()
	uiManager = oUiManager.New()
	level = Level.New()
	level:load()
end

function love.draw()
	-- body
	uiManager:draw()
end

function love.update( dt )
	-- body
	uiManager:update(dt)
end

function love.wheelmoved( dx,dy )
	-- body

end
function love.touchpressed( id,x,y,dx,dy,pressure )
	-- body

end

function love.touchmoved( id, x, y, dx, dy, pressure )
	-- body
	
end

function love.touchreleased( id, x, y, dx, dy, pressure )
	
end

function love.keypressed( key )
	-- body
end

function love.mousemoved( x, y, dx, dy, istouch )
	-- body
	--level:mousemoved(x, y, dx, dy, istouch)

	uiManager:mousemoved(x, y, button, istouch)
end

function love.mousepressed( x, y, button, istouch )
	-- body
	--level:mousepressed(x, y, button, istouch)

	uiManager:mousepressed(x, y, button, istouch)
end

function love.mousereleased( x, y, button, istouch )
	--level:mousereleased(x, y, button, istouch)
	uiManager:mousereleased(x, y, button, istouch)
end

function love.run(dt)
	-- body
	if love.math then 
		love.math.setRandomSeed(os.time())
	end
	if love.load then love.load(arg) end
	if love.timer then love.timer.step() end
	local dt  = 0;
	while true do 
		if love.event then 
			love.event.pump()
			for name,a,b,c,d,e,f in love.event.poll() do 
				if name == "quit" then 
					if not love.quit or not love.quit() then 
						return a
					end
				end
				love.handlers[name](a,b,c,d,e,f)
			end
		end

		if love.time then 
			love.timer.step()
			dt = love.timer.getDelta()
		end

		if love.update then love.update(dt) end
		if love.graphics and love.graphics.isActive() then
			love.graphics.clear(love.graphics.getBackgroundColor())
			love.graphics.origin()
			if love.draw then love.draw() end
			love.graphics.present()
		end
		if love.timer then love.timer.sleep(0.001) end
	end
end