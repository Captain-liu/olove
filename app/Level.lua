Level  = Level or BaseClass()
local text = nil
local iv = nil
local btn = nil
local inputText = nil
function Level:__delete( ... )
	-- body
end

function  Level:load( ... )
	-- body
	love.setBackgroundColor(54,172,248)
	iv = oImageView.new()
	iv:loadTexture("res/logo_bg.jpg")
	iv:setPosition({x = 360,y = 640})
	uiManager:addUI(iv)

	inputText = oTextInput.new()
	inputText:setPosition({x = 240,y = 200})
	uiManager:addUI(inputText)
	text = oText.new()
	text:setScale(3)
	text:setColor(255,0,0)
	text:setPosition({x = 240,y = 400})
	local str = require("app/data/cfg").name
	text:setText(str)
	uiManager:addUI(text)

	btn = oButton.new()
	btn:loadTextures("res/n.png","res/d.png","res/r.png")
	btn:setTitleText("OK")
	btn:addTouchEventListener(function ( sender,eventType )
		-- body
		if eventType == 1 then 

		elseif eventType == 3 then 
		--	love.window.showMessageBox("tip","pressed ok","error",false)
			oAction.new(0.5,100,text):start()	
		end
	end)
	btn:setPosition({x = 240,y = 600})
	uiManager:addUI(btn)

	opage = oPageView.new()
	opage:setSize(300,400)
	opage:setPosition({x = 240,y = 240})
	opage:addPage(oPageItem.new():setSize(270,360))
	opage:addPage(oPageItem.new():setSize(270,360))
	opage:addPage(oPageItem.new():setSize(270,360))
	opage:addPage(oPageItem.new():setSize(270,360))
	opage:addPage(oPageItem.new():setSize(270,360))
	opage:addPage(oPageItem.new():setSize(270,360))
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