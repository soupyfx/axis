local axis = {}
local code = {}

local needed = {"internal","gui","tab","button","title","paragraph","toggle","slider","dropdown","notication"}
for index, need in needed do code[need] = loadstring(game:HttpGet("https://raw.githubusercontent.com/soupyfx/chlorine/main/"..need..".lua"))() end

--[[
/ new
/ creates a new gui
/ options <{name <string>, key <{enabled <boolean>, key <string>}>}>
]]

function axis.new(options)
	local libary = {}
	libary.code = code
	libary.internal = libary.code.internal
	
	libary.options = libary.internal.verify({
		title = "axis",
		key = { enabled = false, key = "" }
	}, options or {})
	
	if libary.options.key.enabled then 
		if not libary.internal.key(libary.options.key.key) then return nil end
	end
	
	libary.elements = {tab={},button={},title={},paragraph={},toggle={},slider={},dropdown={},notication={}}
	libary.gui = libary.code.gui(libary)
	
	libary.gui.topbar:FindFirstChildWhichIsA("TextLabel").Text = libary.options.title
	libary.internal.drag("main", libary.gui.frame, libary.gui.topbar)
	
	--[[
	/ tab
	/ creates a new tab
	/ name <string>, options <{title <string>}>
	]]
	
	function libary.tab(name, options)
		if libary.elements.tab[name] ~= nil then
			libary.internal.error("tab "..name.." already exists")
			return nil
		end
		
		libary.elements.tab[name] = libary.code.tab.new(libary, name, options)
		return libary.elements.tab[name]
	end

	--[[
	/ notication
	/ creates a new notication
	/ name <string>, options <{title <string>, text <string>, lifetime <number>}>
	]]

	function libary.notication(name, options)
		if libary.elements.notication[name] ~= nil then
			libary.internal.error("notication "..name.." already exists")
			return nil
		end
		
		libary.elements.notication[name] = libary.code.notication.new(libary, name, options)
		return libary.elements.notication[name]
	end
	
	return libary
end

return axis
