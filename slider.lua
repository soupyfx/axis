local inputService = game:GetService("UserInputService")

local mouse = game:GetService("Players").LocalPlayer:GetMouse()

local slider = {}

function slider.new(parents, name, options)
	local slider = {}
	slider.options = parents.libary.internal.verify({
		title = "button",
		min = 0,
		max = 100,
		callback = function() parents.libary.internal.error("no callback was set for slider "..slider.options.name) end
	}, options or {})
	
	local instance = parents.libary.gui.assets.slider:Clone()
	instance.text.Text = slider.options.title
	instance.LayoutOrder = parents.tab._layout()
	instance.Parent = parents.tab.instances.frame.objects
	
	slider.instance = instance
	
	slider.value = (slider.options.min+slider.options.max)/2

	slider.hovered = false
	
	function slider._update()
		slider.value = math.floor(((slider.options.max - slider.options.min) * math.clamp((mouse.X - instance.body.AbsolutePosition.X) / (instance.body.AbsoluteSize.X), 0, 1)) + slider.options.min)
		game:GetService("TweenService"):Create(instance.body.interact, TweenInfo.new(0.1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut), {Size = UDim2.fromScale((slider.value/slider.options.max),1)}):Play()
		slider.options.callback(slider.value)
	end
	
	--[[
	/ destroy
	/ destroys the slider
	]]

	function slider.destroy()
		table.remove(parents.libary.elements.slider, table.find(parents.libary.elements.slider, name, 1))
		slider.instance:Destroy()
		
		local connections = {"began","move"}
		for index, connection in connections do
			local name = connection..name
			if parents.libary.internal.connections[name] ~= nil then
				parents.libary.internal.connections[name]:Disconnect()
				parents.libary.internal.connections[name] = nil
			end
		end
	end
	
	--[[
	/ rename
	/ renames the slider
	/ title <string>
	]]
	
	function slider.rename(title)
		slider.options.title = title
		slider.instance.text.Text = title
	end
	
	--[[
	/ callback
	/ sets the callback of the slider
	/ func <function>
	]]

	function slider.callback(func)
		slider.options.callback = func
	end
	
	--[[
	/ set
	/ sets the value for the slider
	/ value <number>
	]]

	function slider.set(value)
		slider.value = value
		slider._update()
	end
	
	slider.instance.body.MouseEnter:Connect(function()
		slider.hovered = true
	end)

	slider.instance.body.MouseLeave:Connect(function()
		task.wait(0.2)
		slider.hovered = false
	end)

	parents.libary.internal.connections["began"..name] = inputService.InputBegan:Connect(function(input)
		if input.UserInputType ~= Enum.UserInputType.MouseButton1 or not slider.hovered then return end
		slider._update()

		parents.libary.internal.connections["move"..name] = mouse.Move:Connect(function()
			if not inputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) or not slider.hovered then parents.libary.internal.connections["move"..name]:Disconnect(); return end
			slider._update()
		end)
	end)

	return slider
end

return slider