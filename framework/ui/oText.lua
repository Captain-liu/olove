--Author  Captain
--Date 2016.6.25
oText = oText or BaseClass(oNode)

function oText:load( ... )
	-- body
	self.txt = ""
	self.fontSize = 18
	self.fontName = "res/ms.otf"
	return self
end

function oText:setScale( s )
	-- body
	self.scale = s
end

function oText:setText(txt)
	-- body
	self.txt = txt
	return self
end

function oText:setFontSize( fontsize)
	-- body
	self.fontSize = fontsize 
	return self
end

function oText:setFontName(fontname )
	-- body
	self.fontName = fontname
	return self
end

function  oText:getDrawText()
	-- body
	if not self.drawTxt then 
		local font = love.graphics.newFont(self.fontName,self.fontSize)
		local txt = love.graphics.newText(font,self.txt)
		self.width = txt:getWidth()
		self.height = txt:getHeight()
		self.drawTxt = txt
	end
	return self.drawTxt
end

function oText:draw()
	-- body
	if not self.visible then end
	local txt = self:getDrawText()
	love.graphics.setColor(self.r,self.g, self.b)
	love.graphics.draw(txt,self.x-self.width*self.ax*self.scale,self.y-self.height*self.ay*self.scale,0,self.scale,self.scale)
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