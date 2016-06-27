
require "framework/ui/oPage"
oPageView = oPageView or BaseClass(oNode)

function oPageView:__init( ... )
	-- body
	self.pages = {}
	self.beginx = 0 
	self.beginy = 0
	self.pressed = false
	self.orientation = 0	--	0.level  1.vertical
end

function oPageView:__delete( ... )
	-- body
	for k ,v in pairs(self.pages) do 
		v:DeleteMe()
	end
	self.pages =  {}
end

function oPageView:setOrientation(orientation)
	-- body
	self.orientation = orientation
end

function oPageView:addPage(page)
	-- body
	self.pages[#self.pages+1] = page
	local length = #self.pages
	page:setPosition({x = self.x + self.width*(length-1)*(1-self.orientation),y = self.y+self.height*(length-1)*self.orientation})
end

function oPageView:draw()
   if self.width > 0 and self.height >0 then 
	local function myStencilFunction()
	   	love.graphics.rectangle("fill", self.x-self.width*self.ax,self.y-self.height*self.ay, self.width, self.height,20,20,10)
	end
    love.graphics.stencil(myStencilFunction, "increment", 1)
   -- Only allow rendering on pixels which have a stencil value greater than 0.
    love.graphics.setStencilTest("greater", 0)
	for k,v in pairs(self.pages) do 
	  	  v:update()
	  	  v:draw()
	 end
    love.graphics.setStencilTest()
   end
end

function oPageView:mousemoved( x, y, dx, dy, istouch )
	-- body
	--btn:mousemoved(x, y, dx, dy, istouch)
	if self.pressed then 
		local count = #self.pages
		local width = count*self.width
		if self:isContainPoint(x,y) then
			local offsetx = x - self.beginx
			local offsety = y - self.beginy
			self.beginx = x
			self.beginy = y
			for k,v in pairs(self.pages) do 
				v:move(offsetx*(1-self.orientation),offsety*self.orientation)
			end
		end
	end
end

function oPageView:mousepressed( x, y, button, istouch )
	-- body
	self.beginx = x
	self.beginy = y
	if self:isContainPoint(x,y) then
		self.pressed  = true
		for k,v in pairs(self.pages) do 
			--v:nextPage()
		end
	end
end

function oPageView:mousereleased( x, y, button, istouch )
	--btn:mousereleased(x, y, button, istouch)
	local offsetx = x - self.beginx
	local offsety = y - self.beginy
	self.beginx = x
	self.beginy = y
	self.pressed = false
end