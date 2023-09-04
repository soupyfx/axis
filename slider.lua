local inputService = game:GetService("UserInputService")
local mouse = game:GetService("Players").LocalPlayer:GetMouse()

local slider = {}

function slider.new(parents, name, options)
	local slider = {}
	slider.data = parents.libary.internal.verify({
		title = "button",
		min = 0,
		max = 100,
		callback = function() parents.libary.internal.error("no callback was set for slider "..name) end
	}, options or {})
	
	local instance = parents.libary.gui.assets.slider:Clone()
	instance.text.Text = slider.data.title
	instance.LayoutOrder = parents.tab._layout()
	instance.Parent = parents.tab.instances.frame.objects
	
	slider.instance = instance
	
	slider.data.value = (slider.data.min+slider.data.max)/2
	slider.data.hovered = false
	
	function slider._update()
		slider.data.value = math.floor(((slider.data.max - slider.data.min) * math.clamp((mouse.X - slider.instance.body.AbsolutePosition.X) / (slider.instance.body.AbsoluteSize.X), 0, 1)) + slider.data.min)
		game:GetService("TweenService"):Create(slider.instance.body.interact, TweenInfo.new(0.1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut), {Size = UDim2.fromScale((slider.data.value/slider.data.max),1)}):Play()
		slider.data.callback(slider.data.value)
	end
	
	--[[
	/ destroy
	/ destroys the slider
	]]

	function slider.destroy()
		table.remove(parents.libary.internal.elements.slider, table.find(parents.libary.internal.elements.slider, name, 1))
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
		slider.data.title = title
		slider.instance.text.Text = title
	end
	
	--[[
	/ callback
	/ sets the callback of the slider
	/ func <function>
	]]

	function slider.callback(func)
		slider.data.callback = func
	end
	
	--[[
	/ set
	/ sets the value for the slider
	/ value <number>
	]]

	function slider.set(value)
		slider.data.value = value
		slider._update()
	end
	
	slider.instance.body.MouseEnter:Connect(function()
		slider.data.hovered = true
	end)

	slider.instance.body.MouseLeave:Connect(function()
		task.wait(0.2)
		slider.data.hovered = false
	end)

	parents.libary.internal.connections["began"..name] = inputService.InputBegan:Connect(function(input)
		if input.UserInputType ~= Enum.UserInputType.MouseButton1 or not slider.data.hovered then return end
		slider._update()

		parents.libary.internal.connections["move"..name] = mouse.Move:Connect(function()
			if not inputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) or not slider.data.hovered then parents.libary.internal.connections["move"..name]:Disconnect(); return end
			slider._update()
		end)
	end)

	print("----- slider -----")
	print(slider)

	return slider
end

return slider