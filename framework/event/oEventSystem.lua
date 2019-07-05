--Author  Captain
--Date 2016.6.26
_inner_event_system_list = _inner_event_system_list or {}
_inner_event_system_id_count = _inner_event_system_id_count or 0

oEventSystem = oEventSystem or BaseClass()

function oEventSystem:load()
    _inner_event_system_id_count = _inner_event_system_id_count + 1
    self.system_id = _inner_event_system_id_count
    _inner_event_system_list[self.system_id] = self

    --事件列表
    self.event_list = {}
    self.is_deleted = false
end

function oEventSystem:CreateEvent(event_id)
    self.event_list[event_id] = oEvent.new(event_id)
end

function oEventSystem:Bind(event_id, event_func)
    assert(event_id)
    if self.is_deleted then
        return
    end

    if self.event_list[event_id] == nil then
        self:CreateEvent(event_id)
    end
    local tmp_event = self.event_list[event_id]
    return tmp_event:Bind(event_func)
end

function oEventSystem:UnBind(event_handle)
    assert(event_handle)
    assert(event_handle.event_id)

    if self.is_deleted then
        return
    end

    local tmp_event = self.event_list[event_handle.event_id]
    if tmp_event ~= nil then
        tmp_event:UnBind(event_handle)
    end
end

-- 立即触发
function oEventSystem:Fire(event_id, ...)
    assert(event_id)
    if self.is_deleted then
        return
    end
    
    local tmp_event = self.event_list[event_id] 
    if tmp_event ~= nil then
        tmp_event:Fire({...})
    end
end

function oEventSystem:__delete()
    if not self.is_deleted then
        _inner_event_system_list[self.system_id] = nil
        self.is_deleted = true
    end
end


