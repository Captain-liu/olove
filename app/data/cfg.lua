-- a template  cfgs readonly
local data = {
	name="12132123111111111111111115555555555555555555555566666666666666666666666666666",
	code="010"
}

local s = {}
setmetatable(s,{
	__index = function(tt,k) return data[k] end,
	__newindex = function(tt,k,v) assert(false,"table is readonly") end
})
return s