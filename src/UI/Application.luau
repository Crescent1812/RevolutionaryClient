local IncludeModules = require(script.Parent.Parent.ModuleIncludes.IncludeModules)
local Modules = require(script.Parent.Parent.ModulesHandler.Modules)
local Application = {}
Application.__index = Application

export type Application = typeof(setmetatable({} :: {}, Application))

type ApplicationConfig<C, Table> = {
	Config: C,
	tbl: Table,
}

function Application.new<C, Table>(
	callback: () -> (),
	AppName: string,
	what: Instance,
	path: Instance?,
	Config: C,
	tbl: Table
): ApplicationConfig<C, Table>
	what.Parent = path
	callback()
	local CharmLIB = IncludeModules.IncludeModule(Modules.Charm)
	local PrintingNewApp = CharmLIB.computed(function() end)
	local _subscribedApplication = CharmLIB.subscribe(PrintingNewApp, function()
		print(`created new application {AppName}`)
	end)

	return { Config = Config, tbl = tbl }
end

return Application
