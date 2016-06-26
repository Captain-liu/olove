--Author  Captain
--Date 2016.6.26
_state_id = _state_id or 0
oGameTFSM = oGameTFSM or BaseClass()

function oGameTFSM:__init()
   -- if GameTFSM.Instance then
   --     error("Attempt to create a GameTFSM twice!")
  --  end
    oGameTFSM.Instance = self
    self.cur_state_id = 0
    self.state_list = {}
end

function oGameTFSM:__delete()
    self.cur_state_id = 0
    self.state_list = {}
end

function oGameTFSM:CreateSubState(state)
    _state_id = _state_id + 1
    local state_id = _state_id
    self.state_list[state_id] = state
    return state_id
end

function oGameTFSM:GetCurrentState( ... )
    -- body
    return self.state_list[self.cur_state_id]
end
function oGameTFSM:ChangeStateByID(state_id)
    local new_state = self.state_list[state_id]
    if new_state then
        -- 一般来说状态不可重入
        --print("----self.cur_state_id---",self.cur_state_id,state_id)
        if not self:IsInStateByID(state_id) then
            local old_state = self.state_list[self.cur_state_id]
            if old_state then
                old_state:Exit()
            end
            new_state:Enter()
        end
        self.cur_state_id = state_id
    end
end

function oGameTFSM:Update(elapse_time)
    if self.state_list[self.cur_state_id] then    
        self.state_list[self.cur_state_id]:StateUpdate(elapse_time)
    end
end

function oGameTFSM:IsInStateByID(id)
    if self.cur_state_id == id then
        return true
    else
        return false
    end
end