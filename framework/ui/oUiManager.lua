oUiManager = oUiManager or BaseClass()

function oUiManager:__init( ... )
	-- body
	self.uitable = {}
end

function oUiManager:__delete( ... )
	-- body
	for k,v in pairs(self.uitable) do 
		v:DeleteMe()
	end
end

function oUiManager:addUI(node)
	-- body
	table.insert( self.uitable , node )
end

function oUiManager:draw( ... )
	-- body
	for k,v in pairs(self.uitable) do 
		v:draw()
	end
end

function oUiManager:update( ... )
	-- body
	for k,v in pairs(self.uitable) do 
		v:update()
	end
end

function oUiManager:mousemoved( x, y, dx, dy, istouch )
	-- body
	--btn:mousemoved(x, y, dx, dy, istouch)
	for k,v in pairs(self.uitable) do 
		if v.mousemoved then 
			v:mousemoved(x,y,dx,dy,istouch)
		end
	end
end

function oUiManager:mousepressed( x, y, button, istouch )
	-- body
	--btn:mousepressed(x, y, button, istouch)
	for k,v in pairs(self.uitable) do 
		if v.mousepressed then 
			v:mousepressed(x,y,button, istouch)
		end
	end
end

function oUiManager:mousereleased( x, y, button, istouch )
	--btn:mousereleased(x, y, button, istouch)
		for k,v in pairs(self.uitable) do 
		if v.mousereleased then 
			v:mousereleased(x,y,button, istouch)
		end
	end
end