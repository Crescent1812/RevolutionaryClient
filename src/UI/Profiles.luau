local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Profiles = {}
Profiles.__index = Profiles

export type CreateUIProfile = typeof(setmetatable({} :: {}, Profiles))

type PDIR = {
	Parent: Instance?,
}

type bindProfile<A, B> = {
	p1: A,
	p2: B,
}

function Profiles.NewProfile<p>(callback: (item: string) -> string, Name: string, props, item: p): p
	props = props or {}
	props.ProfileConfigName = props.ProfileConfigName or Instance.new("Configuration").Name or string
	props.Config = props.Config or Instance.new("Configuration")

	local ProfileConfig = Instance.new("Configuration")
	ProfileConfig.Name = props.ProfileConfigNames

	callback("CreateProfile")
	return props, item, Name
end

function Profiles.RemoveProfile<p>(callback: (c: string) -> string, Name: string, props, item: p): p
	local function getprofiledir(dir: PDIR): PDIR
		return dir
	end
	local _gpd = getprofiledir(ReplicatedStorage.RevolutionaryClient.Profiles)

	props = props or {}
	props.ProfileConfigName = props.ProfileConfigName or Instance.new("Configuration").Name or string
	props.Config = props.Config or Instance.new("Configuration")

	local ProfileConfig = Instance.new("Configuration")
	ProfileConfig.Name = props.ProfileConfigNames

	callback("RemoveProfile")
	return props, item, Name
end

function Profiles.StoreProfile<A, B>(p1: A, p2: B): bindProfile<A, B>
	return { p1 = p1, p2 = p2 }
end

return Profiles
