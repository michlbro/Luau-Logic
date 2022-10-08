local methods = {}
function methods:SetA(state: boolean)
    if self.a == state then
        return
    end
    self.a = state
    if self.a then
        self.c(false)
    else
        self.c(true)
    end
end

function methods:Update()
    if self.a then
        self.c(false)
    else
        self.c(true)
    end
end

return function (output)
    local newInverterGate = setmetatable({
        c = output
    }, {__index = methods})
    
    return newInverterGate
end