local Profiles = require(script.Parent.Parent.Parent.UI.Profiles)

local p1 = Profiles.NewProfile(
	function(item: string): string
		print(item)
		return item
	end,
	"p1",
	{
		ProfileConfigName = "p1",
		Config = Instance.new("Configuration"),
	},
	Instance.new("ScreenGui")
)

local p2 = Profiles.NewProfile(
	function(item: string): string
		print(item)
		return item
	end,
	"p2",
	{
		ProfileConfigName = "p2",
		Config = Instance.new("Configuration"),
	},
	Instance.new("ScreenGui")
)

local bindedProfiles = Profiles.StoreProfile(p1, p2)
