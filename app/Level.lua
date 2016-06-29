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
	text:setPosition({x = 200,y = 500})
	text:setText("hello love")
	uiManager:addUI(text)

	iv = oImageView.New()
	iv:loadTexture("res/purple.png")
	iv:setPosition({x = 300,y = 500})
	uiManager:addUI(iv)

	btn = oButton.New()
	btn:loadTextures("res/n.png","res/d.png","res/r.png")
	btn:setTitleText("OK")
	btn:addTouchEventListener(function ( sender,eventType )
		-- body
		if eventType == 1 then 

		elseif eventType == 3 then 
		--	love.window.showMessageBox("tip","pressed ok","error",false)
		end
	end)
	btn:setPosition({x = 240,y = 600})
	uiManager:addUI(btn)

	opage = oPageView.New()
	opage:setSize(300,400)
	opage:setPosition({x = 240,y = 240})
	opage:addPage(oPageItem.New():setSize(270,360))
	opage:addPage(oPageItem.New():setSize(270,360))
	opage:addPage(oPageItem.New():setSize(270,360))
	opage:addPage(oPageItem.New():setSize(270,360))
	opage:addPage(oPageItem.New():setSize(270,360))
	opage:addPage(oPageItem.New():setSize(270,360))
	uiManager:addUI(opage)

	
end

function Level:draw( ... )
	-- body
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