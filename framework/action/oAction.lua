oAction = oAction or BaseClass()

function oAction:__init(time_,distance,node)
	self.totaltime = time_*30
	self.boolaction = false
	self.node = node
	self.step = distance/self.totaltime
end

function oAction:__delete( ... )
	-- body
end

function oAction:start(...)
	-- body
	self.boolaction = true
end

function oAction:update(dt) 

	if self.boolaction then
		self.totaltime = self.totaltime -1 
		if self.totaltime < 0 then
			self.boolaction = false
		else
			self.node:move(self.step,0)
		end
	end
end