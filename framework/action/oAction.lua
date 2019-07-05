oAction = oAction or BaseClass()

function oAction:load(time_,distance,node)
	self.totaltime = time_*60
	self.boolaction = false
	self.node = node
	self.step = distance/self.totaltime
	actionManager:addAction(self)
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
			self.node:move(0,1)
		end
	end
end