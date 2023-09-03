local dropdown = {}

function dropdown.new(parents, name, options)
	local dropdown = {}
	dropdown.options = parents.libary.internal.verify({
		title = "dropdown",
		values = {"skirt"},
		callback = function() parents.libary.internal.error("no callback was set for dropdown "..options.name) end
	}, options or {})
	
	if rawlen(options.values) == 0 then 
		parents.libary.internal.error("dropdown "..options.name.." cannot have no values")
		return nil
	end
	
	local instance = parents.libary.gui.assets.dropdown:Clone()
	instance.button.Text = dropdown.options.title
	instance.LayoutOrder = parents.tab._layout()
	instance.Parent = parents.tab.instances.frame.objects
	
	dropdown.instance = instance
	
	dropdown.selected = dropdown.options.values[1]
	dropdown.open = false
	dropdown.buttons = {}
	
	function dropdown._recreate()
		for index, name in dropdown.buttons do
			dropdown.instance.objects:FindFirstChild(name):Destroy()
		end

		dropdown.buttons = {}

		for index, value in dropdown.options.values do
			local thing = parents.libary.gui.assets.dropdownSelect:Clone()
			thing.Name = value
			thing.Text = value
			thing.Parent = dropdown.instance.objects

			table.insert(dropdown.buttons, value)

			thing.Activated:Connect(function()
				dropdown.options.callback(value)
			end)
		end
	end
	dropdown._recreate()
	
	function dropdown._update()
		if dropdown.open then
			instance.Size = UDim2.new(1,0,0,(35+(rawlen(dropdown.options.values)*25)))
		else
			instance.Size = UDim2.new(1,0,0,30)
		end
	end

	
	--[[
	/ destroy
	/ destroys the slider
	]]

	function dropdown.destroy()
		table.remove(parents.libary.elements.dropdown, table.find(parents.libary.elements.dropdown, name, 1))
		dropdown.instance:Destroy()
		
	end
	
	--[[
	/ rename
	/ renames the slider
	/ title <string>
	]]
	
	function dropdown.rename(title)
		dropdown.options.title = title
		dropdown.instance.button.Text = title
	end
	
	--[[
	/ callback
	/ sets the callback of the slider
	/ func <function>
	]]

	function dropdown.callback(func)
		dropdown.options.callback = func
	end
	
	--[[
	/ value
	/ sets the values of the dropdown
	/ values <{}>
	]]

	function dropdown.value(values)
		if rawlen(values) == 0 then 
			parents.libary.internal.error("dropdown "..options.name.." cannot have no values")
			return nil
		end

		dropdown.options.values = values
		dropdown._recreate()
	end
	
	--[[
	/ set
	/ sets the dropdown open or closed
	/ value <boolean>
	]]

	function dropdown.set(value)
		dropdown.open = value
		dropdown._update()
	end
	
	--[[
	/ toggle
	/ toggle the dropdown open or closed
	/ none
	]]

	function dropdown.toggle()
		dropdown.open = not dropdown.open
		dropdown._update()
	end

	dropdown.instance.button.Activated:Connect(function()
		dropdown.toggle()
	end)

	return dropdown
end

return dropdown
