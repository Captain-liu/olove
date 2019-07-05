Level  = Level or BaseClass()
local text = nil
local iv = nil
local btn = nil

function Level:__delete( ... )
	-- body
end

function  Level:load( ... )
	-- body
	love.setBackgroundColor(54,172,248)
	iv = oImageView.New()
	iv:loadTexture("res/logo_bg.jpg")
	iv:setPosition({x = 360,y = 640})
	uiManager:addUI(iv)

	text = oText.New()
	text:setColor(255,0,0)
	text:setPosition({x = 240,y = 400})
	text:setText("hello love")
	uiManager:addUI(text)

	btn = oButton.New()
	btn:loadTextures("res/n.png","res/d.png","res/r.png")
	btn:setTitleText("OK")
	btn:addTouchEventListener(function ( sender,eventType )
		-- body
		if eventType == 1 then 

		elseif eventType == 3 then 
		--	love.window.showMessageBox("tip","pressed ok","error",false)
			oAction.New(0.5,100,text):start()	
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