local Roblox32 = {}
Roblox32.__index = Roblox32

type func<OBJ> = {
	Functions: OBJ,
}

function Roblox32.GetSingleModule<OBJ>(Functions: OBJ): func<OBJ>
	return { Functions = Functions }
end

return Roblox32
