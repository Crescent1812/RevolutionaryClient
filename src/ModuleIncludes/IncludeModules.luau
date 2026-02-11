local IncludeModules = {}
IncludeModules.__index = IncludeModules

function IncludeModules.IncludeModule<V>(include: V): V
	print(`Included Module: {include}`)
	return include
end

return IncludeModules
