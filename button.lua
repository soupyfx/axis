local button = {}

function button.new(parents, name, options)
	local button = {}
	button.data = parents.libary.internal.verify({
		title = "button",
		callback = function() parents.libary.internal.error("no callback was set for button "..name) end
	}, options or {})
	
	local instance = parents.libary.gui.assets.button:Clone()
	instance.Text = button.data.title
	instance.LayoutOrder = parents.tab._layout()
	instance.Parent = parents.tab.instances.frame.objects

	button.instance = instance
	
	--[[
	/ destroy
	/ destroys the button
	]]

	function button.destroy()
		table.remove(parents.libary.internal.elements.button, table.find(parents.libary.internal.elements.button, name, 1))
		button.instance:Destroy()
	end
	
	--[[
	/ rename
	/ renames the button
	/ title <string>
	]]
	
	function button.rename(title)
		button.data.title = title
		button.instance.Text = title
	end
	
	--[[
	/ callback
	/ sets the callback of the button
	/ func <function>
	]]

	function button.callback(func)
		button.data.callback = func
	end

	button.instance.Activated:Connect(function()
		button.data.callback()
	end)

	print("----- button -----")
	print(button)

	return button
end

return button
