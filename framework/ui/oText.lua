--Author  Captain
--Date 2016.6.25
oText = oText or BaseClass(oNode)

function oText:__init( ... )
	-- body
	self.txt = ""
	self.fontSize = 18
	self.fontName = ""
end

function oText:setText(txt)
	-- body
	self.txt = txt
end

function oText:setFontSize( fontsize)
	-- body
	self.fontSize = fontsize 
end

function oText:setFontName(fontname )
	-- body
	self.fontName = fontname
end

function oText:draw()
	-- body
	if not self.visible then end
	local font = love.graphics.newFont(self.fontSize)
	local txt = love.graphics.newText(font,self.txt)
	local width = txt:getWidth()
	local height = txt:getHeight()
	love.graphics.setColor(self.r,self.g, self.b)
	love.graphics.draw(txt,self.x-width*self.ax,self.y-height*self.ay)
	love.graphics.setColor(255, 255, 255)
end

function oText:setAlign( ... )
	-- body
end

function oText:parseText(txt)
	-- body
end

function oText:__delete( ... )
	-- body
end