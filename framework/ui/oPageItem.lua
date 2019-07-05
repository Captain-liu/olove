oPageItem = oPageItem or BaseClass(oNode)

function oPageItem:load( ... )
	-- body

end

function oPageItem:__delete( ... )
	-- body
end

function oPageItem:draw()
	-- body
	if self.width > 0 and self.height >0 then 
		love.graphics.rectangle("line", self.x-self.width*self.ax,self.y-self.height*self.ay, self.width, self.height)
		love.graphics.rectangle("line", self.x-self.width*self.ax,self.y-self.height*self.ay, self.width, self.height)
		local font = love.graphics.newFont(12)
		local txt = love.graphics.newText(font,""..self.index)
		local width = txt:getWidth()
		local height = txt:getHeight()
		love.graphics.draw(txt,self.x-self.width*self.ax,self.y-self.height*self.ay)
   end
end

function oPageItem:setPageIndex( index )
	-- body
	self.index = index
end

function oPageItem:move(offsetx ,offsety)
	-- body
	self.x = self.x + offsetx
	self.y = self.y + offsety
end

function oPageItem:nextPage( ... )
	-- body
	self.next = true
end

function oPageItem:lastPage( ... )
	-- body
end

function oPageItem:addChild( ... )
	-- body
end