local loaded = {}

return setmetatable({}, {__index = function(_, index)
    if loaded[index] then
        return loaded[index]
    end
    local logicGate = script.Parent:FindFirstChild(index)
    if logicGate then
        local required = require(logicGate)
        loaded[index] = required
        return required
    end
end})