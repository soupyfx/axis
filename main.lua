local libary = {}

local needed = {"internal","gui"}
for index, need in needed do libary[need] = loadstring(game:HttpGet("https://raw.githubusercontent.com/soupyfx/chlorine/main/"..need..".lua"))() end
--for index, need in needed do libary[need] = require(game:GetService("ReplicatedStorage"):FindFirstChild(need)) end

local needed = {"tab","button","title","paragraph","toggle","slider","dropdown","notication"}
for index, need in needed do libary.internal.elements[need] = loadstring(game:HttpGet("https://raw.githubusercontent.com/soupyfx/chlorine/main/"..need..".lua"))() end
--for index, need in needed do libary.internal.elements[need] = require(game:GetService("ReplicatedStorage"):FindFirstChild(need)) end

local axis = {}

--[[
/ new
/ creates a new gui
/ options <{name <string>, key <{enabled <boolean>, key <string>}>}>
]]

function axis.new(options)
	libary.data = libary.internal.verify({
		title = "axis",
		key = { enabled = false, key = "" }
	}, options or {})
	
	if libary.data.key.enabled then 
		if not libary.internal.key(libary.data.key.key) then return nil end
	end
	
	libary.gui = libary.gui(libary)
	
	--[[
	/ tab
	/ creates a new tab
	/ name <string>, options <{title <string>}>
	]]
	
	function libary.tab(name, options)
		if libary.internal.elements.tab[name] ~= nil then
			libary.internal.error("tab "..name.." already exists")
			return nil
		end
		
		libary.internal.elements.tab[name] = libary.internal.elements.tab.new(libary, name, options)
		return libary.internal.elements.tab[name]
	end

	--[[
	/ notication
	/ creates a new notication
	/ name <string>, options <{title <string>, text <string>, lifetime <number>}>
	]]

	function libary.notication(name, options)
		if libary.internal.elements.notication[name] ~= nil then
			libary.internal.error("notication "..name.." already exists")
			return nil
		end
		
		libary.internal.elements.notication[name] = libary.internal.elements.notication.new(libary, name, options)
		return libary.internal.elements.notication[name]
	end
	
	return libary
end

return axis
