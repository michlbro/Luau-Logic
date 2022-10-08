local methods = {}

function methods:SetB(state: boolean)
    if self.b == state then
        return
    end
    self.b = state
    if self.a and self.b then
        self.c(true)
    elseif not self.a and not self.b then
        self.c(true)
    else
        self.c(false)
    end
end

function methods:SetA(state: boolean)
    if self.a == state then
        return
    end
    self.a = state
    if self.a and self.b then
        self.c(true)
    elseif not self.a and not self.b then
        self.c(true)
    else
        self.c(false)
    end
end

function methods:GetA()
    return self.a
end

function methods:GetB()
    return self.b
end

function methods:Update()
    if self.a and self.b then
        self.c(true)
    elseif not self.a and not self.b then
        self.c(true)
    else
        self.c(false)
    end
end

return function (output)
    local newOrGate = setmetatable({
        c = output
    }, {__index = methods})
    return newOrGate
end