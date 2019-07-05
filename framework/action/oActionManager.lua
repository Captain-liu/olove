oActionManager = oActionManager or BaseClass()

function oActionManager:load(time_,distance,node)
	self.actionTable = {}
end

function oActionManager:addAction(action)
	-- body
	table.insert(self.actionTable,action)
end

function oActionManager:update(dt)

	for k, v in pairs(self.actionTable) do
		if v.update then v:update(dt) end
	end
end