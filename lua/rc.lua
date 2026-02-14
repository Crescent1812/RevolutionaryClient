local lfs = 

local function is_lua_file(name)
	return name:match("%.lua$") or name:match("%.luau$")
end

local function scan_folder(path, files)
	for item in lfs.dir(path) do
		if item ~= "." and item ~= ".." then
			local full = path .. "/" .. item
			local attr = lfs.attributes(full)

			if attr.mode == "directory" then
				scan_folder(full, files)
			elseif attr.mode == "file" and is_lua_file(item) then
				table.insert(files, full)
			end
		end
	end
end

local function write_rc_file(files, output)
	local out = assert(io.open(output, "w"))

	for _, file in ipairs(files) do
		out:write("--===== script: " .. file .. " =====\n")

		local f = assert(io.open(file, "r"))
		local content = f:read("*a")
		f:close()

		out:write(content .. "\n\n")
	end

	out:close()
end

-- CONFIG
local project_root = "src" -- change to your project folder
local output_file = "project.rc"

local files = {}
scan_folder(project_root, files)
table.sort(files)

write_rc_file(files, output_file)

print("Generated:", output_file)
