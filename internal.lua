local inputService = game:GetService("UserInputService")
local players = game:GetService("Players")
local runService = game:GetService("RunService")

local viewport = workspace.CurrentCamera.ViewportSize
local mouse = players.LocalPlayer:GetMouse()

local internal = {}

function internal.key(key)
	local gui = internal:create("ScreenGui", {
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
		Name = "axiskey",
		Parent = runService:IsStudio() and players.LocalPlayer:WaitForChild("PlayerGui", 100) or game:GetService("CoreGui")
	})
	
	local frame = internal:create("Frame", {
		ZIndex = 0,
		BackgroundColor3 = Color3.fromRGB(30, 30, 30),
		BackgroundTransparency = 0.5,
		Size = UDim2.new(0, 400, 0, 50),
		Position = UDim2.fromOffset((viewport.X/2) - 200, (viewport.Y/2) - 25),
		Parent = gui
	}, 
	{
		{
			["type"] = "UIStroke",
			properties = {
				["Color"] = Color3.fromRGB(120, 255, 255),
				["Thickness"] = 2,
				["LineJoinMode"] = Enum.LineJoinMode.Round,
				["Transparency"] = 0.5,
				["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border
			}
		},
		{
			["type"] = "UICorner",
			properties = {
				["CornerRadius"] = UDim.new(0, 4)
			}
		}
	})
	
	local text = internal:create("TextBox", {
		PlaceholderColor3 = Color3.fromRGB(205, 205, 205),
		TextSize = 25,
		TextColor3 = Color3.fromRGB(205, 205, 205),
		FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal),
		BackgroundTransparency = 1,
		PlaceholderText = "enter key or enter 'exit'",
		Size = UDim2.new(1, 0, 1, 0),
		Parent = frame
	})
	
	text.Text = ""
	local drag = internal.drag("key", frame, text)
	local exit,correct = false,false

	text.FocusLost:Connect(function(enter)
		if not enter then return end

		if text.Text == "exit" then exit = true end
		if text.Text == key then correct = true; exit = true end

		text.Text = ""
	end)

	repeat task.wait() until exit

	gui:Destroy()
	drag.destroy()

	return correct
end

function internal.drag(name, move, drag)
	local hovered = false
	local mouseInitial, moveInitial

	internal.connections["enter"..name] = drag.MouseEnter:Connect(function()
		hovered = true
	end)

	internal.connections["leave"..name] = drag.MouseLeave:Connect(function()
		hovered = false
	end)

	internal.connections["began"..name] = inputService.InputBegan:Connect(function(input)
		if input.UserInputType ~= Enum.UserInputType.MouseButton1 or not hovered then return end

		mouseInitial = {x=mouse.X,y=mouse.Y}
		moveInitial = move.Position

		internal.connections["move"..name] = mouse.Move:Connect(function()
			if not inputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) or not hovered then internal.connections["move"..name]:Disconnect(); return end
			move.Position = (moveInitial - UDim2.new(0, (mouseInitial.x - mouse.X), 0, (mouseInitial.y - mouse.Y)))
			--game:GetService("TweenService"):Create(move, TweenInfo.new(0.1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut), {Position = (moveInitial - UDim2.new(0, (mouseInitial.x - mouse.X), 0, (mouseInitial.y - mouse.Y)))}):Play()
		end)

	end)

	return {destroy=function()
		local connections = {"enter","leave","began","move"}
		for index, connection in connections do
			local name = connection..name
			pcall(function()
				internal.connections[name]:Disconnect()
				internal.connections[name] = nil
			end)
		end
	end}
end

function internal.verify(default, options)
	local table = default

	for name, option in options do
		if table[name] ~= nil then
			table[name] = option
		end
	end

	return table
end

function internal.error(error)
	warn("axis | "..error)
end

function internal:create(type, properties, parts)
	local instance = Instance.new(type)

	for name, value in properties do
		instance[name] = value
	end

	for _, part in parts or {} do
		self:create(part.type, part.properties, part.parts).Parent = instance
	end

	return instance
end

internal.elements = {tab={},button={},title={},paragraph={},toggle={},slider={},dropdown={},notication={}}
internal.connections = {}
internal.current = nil

return internal