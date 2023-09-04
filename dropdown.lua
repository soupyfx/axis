local dropdown = {}

function dropdown.new(parents, name, options)
	local dropdown = {}
	dropdown.data = parents.libary.internal.verify({
		title = "dropdown",
		values = {"skirt"},
		callback = function() parents.libary.internal.error("no callback was set for dropdown "..name) end
	}, options or {})
	
	if rawlen(dropdown.data.values) == 0 then 
		parents.libary.internal.error("dropdown "..name.." cannot have no values")
		return nil
	end
	
	local instance = parents.libary.gui.assets.dropdown:Clone()
	instance.button.Text = dropdown.data.title
	instance.LayoutOrder = parents.tab._layout()
	instance.Parent = parents.tab.instances.frame.objects
	
	dropdown.instance = instance
	
	dropdown.data.open = false
	dropdown.data.buttons = {}
	
	function dropdown._recreate()
		for index, name in dropdown.data.buttons do
			dropdown.instance.objects:FindFirstChild(name):Destroy()
		end

		dropdown.data.buttons = {}

		for index, value in dropdown.data.values do
			local thing = parents.libary.gui.assets.dropdownSelect:Clone()
			thing.Name = value
			thing.Text = value
			thing.Parent = dropdown.instance.objects

			table.insert(dropdown.data.buttons, value)

			thing.Activated:Connect(function()
				dropdown.data.callback(value)
			end)
		end
	end
	dropdown._recreate()
	
	function dropdown._update()
		if dropdown.data.open then
			instance.Size = UDim2.new(1,0,0,(35+(rawlen(dropdown.data.values)*25)))
		else
			instance.Size = UDim2.new(1,0,0,30)
		end
	end

	
	--[[
	/ destroy
	/ destroys the slider
	]]

	function dropdown.destroy()
		table.remove(parents.libary.internal.elements.dropdown, table.find(parents.libary.internal.elements.dropdown, name, 1))
		dropdown.instance:Destroy()
		
	end
	
	--[[
	/ rename
	/ renames the slider
	/ title <string>
	]]
	
	function dropdown.rename(title)
		dropdown.data.title = title
		dropdown.instance.button.Text = title
	end
	
	--[[
	/ callback
	/ sets the callback of the slider
	/ func <function>
	]]

	function dropdown.callback(func)
		dropdown.data.callback = func
	end
	
	--[[
	/ value
	/ sets the values of the dropdown
	/ values <{}>
	]]

	function dropdown.value(values)
		if rawlen(values) == 0 then 
			parents.libary.internal.error("dropdown "..name.." cannot have no values")
			return nil
		end

		dropdown.data.values = values
		dropdown._recreate()
	end
	
	--[[
	/ set
	/ sets the dropdown open or closed
	/ value <boolean>
	]]

	function dropdown.set(value)
		dropdown.data.open = value
		dropdown._update()
	end
	
	--[[
	/ toggle
	/ toggle the dropdown open or closed
	/ none
	]]

	function dropdown.toggle()
		dropdown.data.open = not dropdown.data.open
		dropdown._update()
	end

	dropdown.instance.button.Activated:Connect(function()
		dropdown.toggle()
	end)

	print("----- dropdown -----")
	print(dropdown)

	return dropdown
end

return dropdown
