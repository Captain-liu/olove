--Author  Captain
--Date 2016.6.25
oButton = oButton or BaseClass(oNode)
function oButton:load()
	self.pressObj = ""
	self.movedObj = ""
	self.releasedObj = ""
	self.status = 1
	local text = oText.New()
	self.oText = text
	text:setColor(255,0,0)
	text:setPosition({x = self.x,y = self.y})
	text:setText("")
	self.touchSize = {width = 100,height = 20}
end

function oButton:loadTextures(pressed,moved,released)
	-- body
	self.pressObj = 	love.graphics.newImage(pressed)
	self.movedObj = 	love.graphics.newImage(moved)
	self.releasedObj = 	love.graphics.newImage(released)

	local image = self.releasedObj
	local width = image:getWidth()
	local height = image:getHeight()
	self:setTouchSize({width = width,height = height})
end

function oButton:setPosition( point )
	-- body
	self.x  = point.x
	self.y  = point.y
	if self.oText then 
		self.oText:setPosition(point)
	end
end

function oButton:setTitleText(txt)
	-- body
	if self.oText then 
		self.oText:setText(txt)
	end
end

function oButton:setTitleColor( ... )
	-- body
	if self.oText then 
		self.oText:setColor(...)
	end	
end

function oButton:draw(...)
	-- body
	if not self.visible then end
	if self.status == 1 then 
		local image = self.pressObj
		local width = image:getWidth()
		local height = image:getHeight()
		love.graphics.draw(image,self.x-width*self.ax,self.y-height*self.ay)
	elseif self.status == 2 then

	elseif self.status == 3 then 
		local image = self.releasedObj
		local width = image:getWidth()
		local height = image:getHeight()
		love.graphics.draw(image,self.x-width*self.ax,self.y-height*self.ay)
	end
	if self.oText then 
		self.oText:draw()
	end
end

function oButton:__delete( ... )
	-- body
	if self.oText then 
		self.oText:DeleteMe()
	end
end

function oButton:mousemoved( x, y, dx, dy, istouch )
	-- body
	
end

function oButton:mousepressed( x, y, button, istouch )
	-- body
	--print(x,y)
	if self:isContainPoint(x,y) then 
		self.status = 3
		if self.touchEventFunc then 
			self.touchEventFunc(self,1)
		end
	end
end

function oButton:mousereleased( x, y, button, istouch )
	if self:isContainPoint(x,y) then 
		if self.touchEventFunc then 
			self.touchEventFunc(self,3)
		end
	end
	self.status = 1
end

function oButton:addTouchEventListener(func)
	-- body
	self.touchEventFunc = func
end