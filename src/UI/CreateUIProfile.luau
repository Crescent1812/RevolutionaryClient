local ReplicatedStorage = game:GetService("ReplicatedStorage")
local CreateUIProfile = {}
CreateUIProfile.__index = CreateUIProfile

export type CreateUIProfile = typeof(setmetatable({} :: {}, CreateUIProfile))

local cup = {} :: CreateUIProfile

type cc = {
	Instance: string,
	string: string,
	number: string,
	Name: string,
}

type PDIR = {
	Parent: Instance?,
}

function CreateUIProfile.NewProfile<p>(callback: (item: string) -> string, Name: string, props, item: p): p
	props = props or {}
	props.ProfileConfigName = props.ProfileConfigName or Instance.new("Configuration").Name or string
	props.Config = props.Config or Instance.new("Configuration")

	local ProfileConfig = Instance.new("Configuration")
	ProfileConfig.Name = props.ProfileConfigNames

	callback(ProfileConfig.Name)
	return props, item, Name
end

function CreateUIProfile.RemoveProfile<p>(callback: (c: cc) -> string, Name: string, props, item: p): p
	local function getprofiledir(dir: PDIR): PDIR
		return dir
	end
	local _gpd = getprofiledir(ReplicatedStorage.RevolutionaryClient.Profiles)

	props = props or {}
	props.ProfileConfigName = props.ProfileConfigName or Instance.new("Configuration").Name or string
	props.Config = props.Config or Instance.new("Configuration")

	local ProfileConfig = Instance.new("Configuration")
	ProfileConfig.Name = props.ProfileConfigNames

	callback(ProfileConfig.Name)
	return props, item, Name
end

return CreateUIProfile :: CreateUIProfile
