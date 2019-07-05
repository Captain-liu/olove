--Author  Captain
--Date 2019.07.05
local utf8 = require("utf8")
oTextInput = oTextInput or BaseClass(oNode)
function oTextInput:load( ... )
	-- body
	for k,v in pairs(utf8) do print(k,v) end
	self.txt = ""
	love.textinput= function(t)
		-- body
		self.txt = self.txt..t
	end

	love.keypressed = function (key)

		if key == "backspace" then 
			local byteoffset = utf8.offset(self.txt ,-1)
			if byteoffset then
				self.txt = string.sub(self.txt,1,byteoffset-1)
			end
		end
	end
	return self
end


function oTextInput:draw()
	-- body
	if not self.visible then end
	local txt = self.txt
	love.graphics.print(txt)
end
