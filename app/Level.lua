Level  = Level or BaseClass()
local text = nil
local iv = nil
local btn = nil
function Level:__init(...)
	-- body
end

function Level:__delete( ... )
	-- body
end

function  Level:load( ... )
	-- body
	love.graphics.setBackgroundColor(54,172,248)
	text = oText.New()
	text:setColor(255,0,0)
	text:setPosition({x = 200,y = 427})
	text:setText("oImageView")

	iv = oImageView.New()
	iv:loadTexture("res/purple.png")
	iv:setPosition({x = 300,y = 427})
	btn = oButton.New()
	btn:loadTextures("res/n.png","res/d.png","res/r.png")
	btn:setTitleText("OK")
	btn:addTouchEventListener(function ( sender,eventType )
		-- body
		if eventType == 1 then 

		elseif eventType == 3 then 

		end
	end)
	btn:setPosition({x = 240,y = 500})
end


function Level:draw( ... )
	-- body
	if text then 
		text:draw()
	end
	if iv then 
		iv:draw()
	end
	if btn then 
		btn:draw()
	end
end

function Level:mousemoved( x, y, dx, dy, istouch )
	-- body
	btn:mousemoved(x, y, dx, dy, istouch)
end

function Level:mousepressed( x, y, button, istouch )
	-- body
	btn:mousepressed(x, y, button, istouch)
end

function Level:mousereleased( x, y, button, istouch )
	btn:mousereleased(x, y, button, istouch)
end