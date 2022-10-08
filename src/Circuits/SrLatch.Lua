local LogicGates = require(script.Parent.Parent.LogicGates)

local NorGate = LogicGates.NorGate
local methods = {}

function methods:SetA(state: boolean)
    if self.a:GetA() == state then
        return
    end
    self.a:SetA(state)
end

function methods:SetB(state: boolean)
    if self.b:GetB() == state then
        return
    end
    self.b:SetB(state)
end

return function (output)
    local NorGateA, NorGateB
    NorGateA = NorGate(function(bool)
        NorGateB:SetA(bool)
    end)
    NorGateB = NorGate(function(bool)
        NorGateA:SetB(bool)
        output(bool)
    end)

    return setmetatable({
        a = NorGateA;
        b = NorGateB;
    }, {__index = methods})
end