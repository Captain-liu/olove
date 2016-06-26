require  "framework/init"


require "app/Level"
local level = nil
function love.load()
	level = Level.New()
	level:load()

	posx,posy = love.graphics.getWidth()*0.5,love.graphics.getHeight()*0.5
end

function love.draw()
	-- body
	if level then level:draw() end
	love.graphics.rectangle('line',posx,posy,50,50)
	love.graphics.print(love.timer.getFPS())
end

function love.update( dt )
	-- body
	
end

function love.wheelmoved( dx,dy )
	-- body

end
function love.touchpressed( id,x,y,dx,dy,pressure )
	-- body
	px = x
end

function love.touchmoved( id, x, y, dx, dy, pressure )
	-- body
	px = x
end

function love.touchreleased( id, x, y, dx, dy, pressure )
	px = x
end

function love.keypressed( key )
	-- body
end

function love.mousemoved( x, y, dx, dy, istouch )
	-- body
	level:mousemoved(x, y, dx, dy, istouch)
end

function love.mousepressed( x, y, button, istouch )
	-- body
	level:mousepressed(x, y, button, istouch)
end

function love.mousereleased( x, y, button, istouch )
	level:mousereleased(x, y, button, istouch)
end

function love.run( ... )
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