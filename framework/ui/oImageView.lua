--Author  Captain
--Date 2016.6.25
oImageView = oImageView or BaseClass(oNode)

function oImageView:load(...)
	self.imagefilename = ""
	
end

function oImageView:loadTexture(filename)
	-- body
	self.imagefilename = filename
	self.image = love.graphics.newImage(self.imagefilename)
	return self
end

function oImageView:draw( ... )
	-- body
	if not self.visible then end
	local  image = self.image
	local width = image:getWidth()
	local height = image:getHeight()
	love.graphics.draw(image,self.x-width*self.ax,self.y-height*self.ay,0,self.scale,self.scale)
end

function oImageView:getSize( ... )
	-- body
end

function oImageView:__delete( ... )
	-- body
end



