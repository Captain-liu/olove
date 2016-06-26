--Author  Captain
--Date 2016.6.25
oImageView = oImageView or BaseClass(oNode)

function oImageView:__init(...)
	self.imagefilename = ""
end

function oImageView:loadTexture(filename)
	-- body
	self.imagefilename = filename
	return self
end

function oImageView:draw( ... )
	-- body
	if not self.visible then end
	local  image = love.graphics.newImage(self.imagefilename)
	local width = image:getWidth()
	local height = image:getHeight()
	love.graphics.draw(image,self.x-width*self.ax,self.y-height*self.ay)
	
end

function oImageView:getSize( ... )
	-- body
end

function oImageView:__delete( ... )
	-- body
end



