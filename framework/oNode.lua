oNode = oNode or BaseClass()

function oNode:load( ... )
	-- body
	self.ax = 0.5
	self.ay = 0.5
	self.x = 0
	self.y = 0
	self.r = 255
	self.g = 255 
	self.b = 255
	self.visible = true
	self.width = 0
	self.height = 0
	self.graphic = love.graphic
end

function oNode:setSize(width,height)
	-- body
	self.width = width
	self.height = height
	self:setTouchSize{width = width,height = height}
	return self
end

function oNode:isContainPoint(x,y)
	-- body
	local posx = self.x
	local posy = self.y
	local  size = self.touchSize
	if x > posx + size.width/2 or x <posx - size.width/2 or y > posy + size.height/2 or y < posy -size.height/2 then 
		return false
	end
	return true
end

function oNode:setTouchSize(size)
	-- body
	self.touchSize =  size
	return self
end

function oNode:setAnchorPoint(point)
	-- body
	self.ax = point.x
	self.ay = point.y
	return self
end

function oNode:setPosition(point)
	-- body
	self.x = point.x
	self.y = point.y
	return self
end

function oNode:getPosition()
	-- body
	return self.x ,self.y
end

function oNode:setVisible( isVisible )
	-- body
	self.visible = isVisible
	return self
end

function oNode:move(x,y)
	-- body
	self.x=self.x+x
	self.y=self.y+y
end
function oNode:getVisible( ... )
	-- body
	return visible
end

function oNode:setColor( ... )
	-- body
	local args = {...}
	self.r = args[1]
	self.g = args[2]
	self.b = args[3]
end

function oNode:update(dt )
	-- body
end

function oNode:draw( ... )
	-- body
end

function oNode:__delete( ... )
	-- body
end