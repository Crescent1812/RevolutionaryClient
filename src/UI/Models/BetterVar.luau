local BetterVar = {}
BetterVar.__index = BetterVar

function BetterVar.createvar<v1>(varname: string, type: v1): v1
	return type
end

return BetterVar
