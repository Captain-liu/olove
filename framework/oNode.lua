oNode = oNode or BaseClass()

function oNode:__init( ... )
	-- body
	self.ax = 0.5
	self.ay = 0.5
	self.x = 0
	self.y = 0
	self.r = 255
	self.g = 255 
	self.b = 255
	self.visible = true
end

function oNode:setSize( ... )
	-- body
end

function oNode:setAnchorPoint(point)
	-- body
	self.ax = point.x
	self.ay = point.y
end

function oNode:setPosition(point)
	-- body
	self.x = point.x
	self.y = point.y
end

function oNode:setVisible( isVisible )
	-- body
	self.visible = isVisible
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

function oNode:__delete( ... )
	-- body
end