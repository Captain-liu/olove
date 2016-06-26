oPage = oPage or BaseClass(oNode)

function oPage:__init( ... )
	-- body
	self.next = false
end

function oPage:__delete( ... )
	-- body
end

function oPage:update( ... )
	-- body
	if self.next then 
	--	self.x = self.x - 1
	end
end

function oPage:draw()
	-- body
	if self.width > 0 and self.height >0 then 

   	  love.graphics.rectangle("line", self.x-self.width*self.ax,self.y-self.height*self.ay, self.width, self.height)
   end
end

function oPage:move( offsetx )
	-- body
	self.x = self.x + offsetx
end
function oPage:nextPage( ... )
	-- body
	self.next = true
end

function oPage:lastPage( ... )
	-- body
end

function oPage:addChild( ... )
	-- body
end