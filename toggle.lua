local toggle = {}

function toggle.new(parents, name, options)
	local toggle = {}
	toggle.options = parents.libary.internal.verify({
		title = "button",
		callback = function() parents.libary.internal.error("no callback was set for toggle "..options.name) end
	}, options or {})
	
	local instance = parents.libary.gui.assets.toggle:Clone()
	instance.Text = toggle.options.title
	instance.LayoutOrder = parents.tab._layout()
	instance.Parent = parents.tab.instances.frame.objects

	toggle.instance = instance
	
	toggle.toggled = false
	
	function toggle._update()
		toggle.options.callback(toggle.toggled)
		if toggle.toggled then instance.UIStroke.Color = Color3.fromRGB(20,255,20) else instance.UIStroke.Color = Color3.fromRGB(255,20,20) end
	end
	
	--[[
	/ destroy
	/ destroys the toggle
	]]

	function toggle.destroy()
		table.remove(parents.libary.elements.toggle, table.find(parents.libary.elements.toggle, name, 1))
		toggle.instance:Destroy()
	end
	
	--[[
	/ rename
	/ renames the toggle
	/ title <string>
	]]
	
	function toggle.rename(title)
		toggle.options.title = title
		toggle.instance.Text = title
	end
	
	--[[
	/ callback
	/ sets the callback of the toggle
	/ func <function>
	]]

	function toggle.callback(func)
		toggle.options.callback = func
	end
	
	--[[
	/ toggle
	/ toggles the toggle
	/ none
	]]

	function toggle.toggle()
		toggle.toggled = not toggle.toggled
		toggle._update()
	end

	--[[
	/ set
	/ sets the toggle
	/ value <boolean>
	]]

	function toggle.set(value)
		toggle.toggled = value
		toggle._update()
	end

	toggle.instance.Activated:Connect(function()
		toggle.toggle()
	end)

	return toggle
end

return toggle