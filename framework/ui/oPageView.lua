
require "framework/ui/oPage"
oPageView = oPageView or BaseClass(oNode)

function oPageView:__init( ... )
	-- body
	self.pages = {}
	self.beginx = 0 
	self.beginy = 0
end

function oPageView:__delete( ... )
	-- body
	for k ,v in pairs(self.pages) do 
		v:DeleteMe()
	end
	self.pages =  {}
end

function oPageView:addPage(page)
	-- body
	self.pages[#self.pages+1] = page
	local length = #self.pages
	page:setSize(200,200)
	page:setPosition({x = self.x + self.width*(length-1),y = self.y})
	
end

function oPageView:draw()
   if self.width > 0 and self.height >0 then 
   	  love.graphics.rectangle("line", self.x-self.width*self.ax,self.y-self.height*self.ay, self.width, self.height)
   	  for k,v in pairs(self.pages) do 
   	  	  v:update()
   	  	  v:draw()
   	  end
   end
end

function oPageView:mousemoved( x, y, dx, dy, istouch )
	-- body
	--btn:mousemoved(x, y, dx, dy, istouch)
--[[	if self:isContainPoint(x,y) then
		local offsetx = x - self.beginx
		local offsety = y - self.beginy
		self.beginx = x
		self.beginy = y
		for k,v in pairs(self.pages) do 
			v:move(offsetx)
		end
	end]]
end

function oPageView:mousepressed( x, y, button, istouch )
	-- body
	self.beginx = x
	self.beginy = y
	if self:isContainPoint(x,y) then
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
	if self:isContainPoint(x,y) then
		for k,v in pairs(self.pages) do 
			v:move(offsetx)
		end
	end
end