local tab = {}

function tab.new(libary, name, options)
	local tab = {}
	tab.data = libary.internal.verify({
		title = "tab"
	}, options or {})
	
	local button = libary.gui.assets.tabSelect:Clone()
	button.Text = tab.data.title
	button.Parent = libary.gui.tabSelect.objects
	
	local frame = libary.gui.assets.tab:Clone()
	frame.Visible = false
	frame.Parent = libary.gui.tabs
	
	tab.instances = {frame=frame,button=button}
	
	tab.data.selected = false
	tab.data.layout = 0
	
	function tab._layout()
		tab.data.layout = tab.data.layout + 1
		return tab.layout
	end

	function tab._disable()
		tab.data.selected = false
		tab.instances.frame.Visible = false
		tab.instances.button.UIStroke.Color = Color3.fromRGB(255,20,20)
	end
	
	function tab._enable()
		tab.data.selected = true
		tab.instances.frame.Visible = true
		tab.instances.button.UIStroke.Color = Color3.fromRGB(20,255,20)
	end
	
	--[[
	/ select
	/ select the current tab if it is isnt select (unselects the currently enabled tab)
	]]
	
	function tab.select()
		if libary.data.current then
			libary.data.current._disable()
		end

		tab._enable()

		libary.data.current = tab
	end
	
	--[[
	/ title
	/ creates a new title
	/ name <string>, options <{title <string>}>
	]]

	function tab.title(name, options)
		if libary.internal.elements.title[name] ~= nil then
			libary.internal.error("title "..name.." already exists")
			return nil
		end

		libary.internal.elements.title[name] = libary.internal.elements.title.new({libary = libary, tab = tab}, name, options)
		return libary.internal.elements.title[name]
	end
	
	--[[
	/ paragraph
	/ creates a new paragraph
	/ name <string>, options <{title <string>, size <number>}>
	]]

	function tab.paragraph(name, options)
		if libary.internal.elements.paragraph[name] ~= nil then
			libary.internal.error("paragraph "..name.." already exists")
			return nil
		end

		libary.internal.elements.paragraph[name] = libary.internal.elements.paragraph.new({libary = libary, tab = tab}, name, options)
		return libary.internal.elements.paragraph[name]
	end
	
	--[[
	/ button
	/ creates a new button
	/ name <string>, options <{title <string>, callback <function>}>
	]]
	
	function tab.button(name, options)
		if libary.internal.elements.button[name] ~= nil then
			libary.internal.error("button "..name.." already exists")
			return nil
		end

		libary.internal.elements.button[name] = libary.internal.elements.button.new({libary = libary, tab = tab}, name, options)
		return libary.internal.elements.button[name]
	end
	
	--[[
	/ toggle
	/ creates a new toggle
	/ name <string>, options <{title <string>, callback <function>}>
	]]

	function tab.toggle(name, options)
		if libary.internal.elements.toggle[name] ~= nil then
			libary.internal.error("toggle "..name.." already exists")
			return nil
		end

		libary.internal.elements.toggle[name] = libary.internal.elements.toggle.new({libary = libary, tab = tab}, name, options)
		return libary.internal.elements.toggle[name]
	end
	
	--[[
	/ slider
	/ creates a new slider
	/ name <string>, options <{title <string>, min <number>, max <number>, callback <function>}>
	]]

	function tab.slider(name, options)
		if libary.internal.elements.slider[name] ~= nil then
			libary.internal.error("slider "..name.." already exists")
			return nil
		end

		libary.internal.elements.slider[name] = libary.internal.elements.slider.new({libary = libary, tab = tab}, name, options)
		return libary.internal.elements.slider[name]
	end
	
	--[[
	/ dropdown
	/ creates a new dropdown
	/ name <string>, options <{title <string>, min <values>, callback <function>}>
	]]

	function tab.dropdown(name, options)
		if libary.internal.elements.dropdown[name] ~= nil then
			libary.internal.error("dropdown "..name.." already exists")
			return nil
		end

		libary.internal.elements.dropdown[name] = libary.internal.elements.dropdown.new({libary = libary, tab = tab}, name, options)
		return libary.internal.elements.dropdown[name]
	end

	tab.instances.button.Activated:Connect(function()
		tab.select()
	end)

	print("----- tab -----")
	print(tab)

	return tab
end

return tab
