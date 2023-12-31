local toggle = {}

function toggle.new(parents, name, options)
	local toggle = {}
	toggle.data = parents.libary.internal.verify({
		title = "button",
		callback = function() parents.libary.internal.error("no callback was set for toggle "..name) end
	}, options or {})
	
	local instance = parents.libary.gui.assets.toggle:Clone()
	instance.Text = toggle.data.title
	instance.LayoutOrder = parents.tab._layout()
	instance.Parent = parents.tab.instances.frame.objects

	toggle.instance = instance

	toggle.data.toggled = false
	
	function toggle._update()
		toggle.data.callback(toggle.data.toggled)
		if toggle.data.toggled then toggle.instance.UIStroke.Color = Color3.fromRGB(20,255,20) else toggle.instance.UIStroke.Color = Color3.fromRGB(255,20,20) end
	end
	
	--[[
	/ destroy
	/ destroys the toggle
	]]

	function toggle.destroy()
		table.remove(parents.libary.internal.elements.toggle, table.find(parents.libary.internal.elements.toggle, name, 1))
		toggle.instance:Destroy()
	end
	
	--[[
	/ rename
	/ renames the toggle
	/ title <string>
	]]
	
	function toggle.rename(title)
		toggle.data.title = title
		toggle.instance.Text = title
	end
	
	--[[
	/ callback
	/ sets the callback of the toggle
	/ func <function>
	]]

	function toggle.callback(func)
		toggle.data.callback = func
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
	
	--[[
	/ toggle
	/ toggles the toggle
	/ none
	]]

	function toggle.toggle()
		toggle.data.toggled = not toggle.data.toggled
		toggle._update()
	end

	toggle.instance.Activated:Connect(function()
		toggle.toggle()
	end)

	print("----- toggle -----")
	print(toggle)

	return toggle
end

return toggle