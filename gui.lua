local players = game:GetService("Players")
local run = game:GetService("RunService")
local viewport = workspace.CurrentCamera.ViewportSize

return function(libary)
	local gui    = {assets={}}
	local assets = gui.assets

	local screenGui = libary.internal:create("ScreenGui", {
		Name = "axis",
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
		IgnoreGuiInset = true,
		ResetOnSpawn = false,
		Parent = run:IsStudio() and players.LocalPlayer:WaitForChild("PlayerGui", 100) or game:GetService("CoreGui")
	})

	gui.frame = libary.internal:create("Frame", {
		ZIndex = 0,
		BorderSizePixel = 0,
		BackgroundColor3 = Color3.fromRGB(30, 30, 30),
		Size = UDim2.new(0, 700, 0, 400),
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		Position = UDim2.fromOffset((viewport.X/2) - 350, (viewport.Y/2) - 200),
		Parent = screenGui
	},
	{
		{
			type = "UIStroke",
			properties = {
				Color = Color3.fromRGB(120, 255, 255),
				Thickness = 2,
				LineJoinMode = Enum.LineJoinMode.Round,
				Transparency = 0.5,
				ApplyStrokeMode = Enum.ApplyStrokeMode.Border
			}
		},
		{
			type = "UICorner",
			properties = {
				CornerRadius = UDim.new(0, 4)
			}
		}
	})

	gui.topbar = libary.internal:create("Frame",{
		BorderSizePixel = 0,
		BackgroundColor3 = Color3.fromRGB(40, 40, 40),
		Size = UDim2.new(1, 0, 0, 25),
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		Parent = gui.frame
	},
	{
		{
			type = "UICorner",
			properties = {
				CornerRadius = UDim.new(0, 4),
			}
		},
		{
			type = "TextLabel",
			properties = {
				TextWrapped = true,
				ZIndex = 2,
				BorderSizePixel = 0,
				TextScaled = true,
				BackgroundColor3 = Color3.fromRGB(255, 255, 255),
				TextXAlignment = Enum.TextXAlignment.Right,
				FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal),
				TextSize = 14,
				TextColor3 = Color3.fromRGB(205, 205, 205),
				Size = UDim2.new(0.99, 0, 0.9, 0),
				BorderColor3 = Color3.fromRGB(0, 0, 0),
				BackgroundTransparency = 1,
				Position = UDim2.new(0.005, 0, 0.05, 0),
				Parent = gui.topbar,
			}
		}
	})

	gui.tabSelect = libary.internal:create("Frame", {
		BorderSizePixel = 0,
		BackgroundColor3 = Color3.fromRGB(40, 40, 40),
		Size = UDim2.new(0.2, 0, 1, -25),
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		Position = UDim2.new(0, 0, 0, 25),
		Parent = gui.frame
	},
	{
		{
			type = "UICorner",
			properties = {
				CornerRadius = UDim.new(0, 4)
			}
		},
		{
			type = "UIPadding",
			properties = {
				PaddingTop = UDim.new(0, 5),
				PaddingRight = UDim.new(0, 5),
				PaddingBottom = UDim.new(0, 5),
				PaddingLeft = UDim.new(0, 5)
			}
		},
		{
			type = "Folder",
			properties = {
				Name = "objects"
			},
			parts = {
				{
					type = "UIListLayout",
					properties = {
						VerticalAlignment = Enum.VerticalAlignment.Bottom,
						Padding = UDim.new(0, 5),
						SortOrder = Enum.SortOrder.LayoutOrder
					}
				}
			}
		}
	})

	gui.tabs = libary.internal:create("Frame", {
		BorderSizePixel = 0,
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		BackgroundTransparency = 1,
		Size = UDim2.new(0.8, 0, 1, -25),
		ClipsDescendants = true,
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		Position = UDim2.new(0.2, 0, 0, 25),
		Parent = gui.frame
	})

	gui.notications = libary.internal:create("Frame", {
		BorderSizePixel = 0,
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		BackgroundTransparency = 1,
		Size = UDim2.new(0, 275, 1, 0),
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		Position = UDim2.new(0, 0, 0, 0),
		Parent = screenGui
	}, 
	{
		{
			type = "UIPadding",
			properties = {
				PaddingTop = UDim.new(0, 5),
				PaddingRight = UDim.new(0, 5),
				PaddingBottom = UDim.new(0, 5),
				PaddingLeft = UDim.new(0, 5),
			}
		},
		{
			type = "Folder",
			properties = {
				Name = "objects"
			},
			parts = {
				{
					type = "UIListLayout",
					properties = {
						VerticalAlignment = Enum.VerticalAlignment.Bottom,
						Padding = UDim.new(0, 5),
						SortOrder = Enum.SortOrder.LayoutOrder,
					}
				}
			}
		}
	})

	local folder = libary.internal:create("Folder", {
		Name = "axisassets",
		Parent = run:IsStudio() and workspace or nil
	})

	assets.notication = libary.internal:create("Frame", {
		ZIndex = 0,
		BorderSizePixel = 0,
		BackgroundColor3 = Color3.fromRGB(31, 31, 31),
		AnchorPoint = Vector2.new(0.5, 0.5),
		Size = UDim2.new(1, 0, 0, 140),
		Parent = folder
	},
	{
		{
			type = "TextButton",
			properties = {
				ZIndex = 4,
				Size = UDim2.new(1, 0, 1, 0),
				Name = "button",
				Text = "",
				BackgroundTransparency = 1
			}
		},
		{
			type = "TextLabel",
			properties = {
				TextWrapped = true,
				ZIndex = 2,
				BorderSizePixel = 0,
				FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal),
				TextSize = 25,
				TextColor3 = Color3.fromRGB(205, 205, 205),
				Size = UDim2.new(1, 0, -0.1, 45),
				BorderColor3 = Color3.fromRGB(0, 0, 0),
				Name = "title",
				BackgroundTransparency = 1
			}
		},
		{
			type = "TextLabel",
			properties = {
				TextWrapped = true,
				ZIndex = 2,
				BorderSizePixel = 0,
				TextYAlignment = Enum.TextYAlignment.Top,
				FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal),
				TextSize = 14,
				TextColor3 = Color3.fromRGB(205, 205, 205),
				Size = UDim2.new(1, 0, 0.489, 30),
				BorderColor3 = Color3.fromRGB(0, 0, 0),
				Name = "text",
				BackgroundTransparency = 1,
				Position = UDim2.new(0, 0, 0.296, 0)
			}
		},
		{
			type = "UIPadding",
			properties = {
				PaddingTop = UDim.new(0, 5),
				PaddingRight = UDim.new(0, 5),
				PaddingBottom = UDim.new(0, 5),
				PaddingLeft = UDim.new(0, 5)
			}
		},
		{
			type = "UIStroke",
			properties = {
				Color = Color3.fromRGB(120, 255, 255),
				Thickness = 1.75,
				Transparency = 0.5,
				ApplyStrokeMode = Enum.ApplyStrokeMode.Border
			}
		},
		{
			type = "UICorner",
			properties = {
				CornerRadius = UDim.new(0, 4)
			}
		},
		{
			type = "Frame",
			properties = {
				ZIndex = 2,
				BorderSizePixel = 0,
				BackgroundColor3 = Color3.fromRGB(120, 255, 255),
				BackgroundTransparency = 0.5,
				Size = UDim2.new(1, 10, 0, 1),
				BorderColor3 = Color3.fromRGB(0, 0, 0),
				Position = UDim2.new(0, -5, 0.25, 0),
				Name = "line"
			}
		}
	})

	assets.tab = libary.internal:create("ScrollingFrame", {
		BorderSizePixel = 0,
		ScrollBarImageTransparency = 1,
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 1, 0),
		Selectable = false,
		ScrollBarThickness = 0,
		SelectionGroup = false,
		Parent = folder
	},
	{
		{
			type = "UIPadding",
			properties = {
				PaddingTop = UDim.new(0, 10),
				PaddingRight = UDim.new(0, 10),
				PaddingBottom = UDim.new(0, 10),
				PaddingLeft = UDim.new(0, 10)
			}
		},
		{
			type = "Folder",
			properties = {
				Name = "objects"
			},
			parts = {
				{
					type = "UIListLayout",
					properties = {
						Padding = UDim.new(0, 6),
						SortOrder = Enum.SortOrder.LayoutOrder,
					}
				}
			}
		}
	})

	assets.tabSelect = libary.internal:create("TextButton", {
		ZIndex = 2,
		BorderSizePixel = 0,
		BackgroundColor3 = Color3.fromRGB(30, 30, 30),
		TextSize = 14,
		FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal),
		TextColor3 = Color3.fromRGB(200, 200, 200),
		Size = UDim2.new(1, 0, 0, 20),
		Parent = folder
	},
	{
		{
			type = "UIStroke",
			properties = {
				Color = Color3.fromRGB(255, 20, 20),
				Thickness = 1,
				LineJoinMode = Enum.LineJoinMode.Round,
				Transparency = 0.5,
				ApplyStrokeMode = Enum.ApplyStrokeMode.Border
			}
		},
		{
			type = "UICorner",
			properties = {
				CornerRadius = UDim.new(0, 4)
			}
		},
	})

	assets.button = libary.internal:create("TextButton", {
		TextWrapped = true,
		ZIndex = 2,
		BorderSizePixel = 0,
		BackgroundColor3 = Color3.fromRGB(30, 30, 30),
		TextSize = 14,
		FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal),
		TextColor3 = Color3.fromRGB(205, 205, 205),
		Size = UDim2.new(1, 0, 0, 30),
		Parent = folder
	},
	{
		{
			type = "UIStroke",
			properties = {
				Color = Color3.fromRGB(120, 255, 255),
				Thickness = 1,
				LineJoinMode = Enum.LineJoinMode.Round,
				Transparency = 0.5,
				ApplyStrokeMode = Enum.ApplyStrokeMode.Border
			}
		},
		{
			type = "UICorner",
			properties = {
				CornerRadius = UDim.new(0, 4)
			}
		},
	})
	
	assets.title = libary.internal:create("TextLabel", {
		TextWrapped = true,
		ZIndex = 2,
		BorderSizePixel = 0,
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal),
		TextSize = 25,
		TextColor3 = Color3.fromRGB(205, 205, 205),
		Size = UDim2.new(1, 0, 0, 45),
		BackgroundTransparency = 1,
		Parent = folder
	},
	{
		{
			type = "Frame",
			properties = {
				ZIndex = 2,
				BorderSizePixel = 0,
				BackgroundColor3 = Color3.fromRGB(120, 255, 255),
				BackgroundTransparency = 0.5,
				Size = UDim2.new(1, 4, 0, 1),
				Position = UDim2.new(0, -2, 1, -1)
			}
		}
	})
	
	assets.paragraph = libary.internal:create("TextLabel", {
		TextWrapped = true,
		ZIndex = 2,
		BorderSizePixel = 0,
		TextYAlignment = Enum.TextYAlignment.Top,
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal),
		TextSize = 14,
		TextColor3 = Color3.fromRGB(205, 205, 205),
		Size = UDim2.new(1, 0, 0, 30),
		BackgroundTransparency = 1,
		Parent = folder
	})
	
	assets.toggle = libary.internal:create("TextButton", {
		TextWrapped = true,
		ZIndex = 2,
		BorderSizePixel = 0,
		BackgroundColor3 = Color3.fromRGB(30, 30, 30),
		TextSize = 14,
		FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal),
		TextColor3 = Color3.fromRGB(205, 205, 205),
		Size = UDim2.new(1, 0, 0, 30),
		Parent = folder
	}, 
	{
		{
			type = "UIStroke",
			properties = {
				Color = Color3.fromRGB(255, 20, 20),
				Thickness = 1,
				LineJoinMode = Enum.LineJoinMode.Round,
				Transparency = 0.5,
				ApplyStrokeMode = Enum.ApplyStrokeMode.Border
			}
		},
		{
			type = "UICorner",
			properties = {
				CornerRadius = UDim.new(0, 4),
			}
		},
	})
	
	assets.slider = libary.internal:create("Frame", {
		ZIndex = 2,
		BorderSizePixel = 0,
		BackgroundColor3 = Color3.fromRGB(30, 30, 30),
		Size = UDim2.new(1, 0, 0, 45),
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		Parent = folder
	},
	{
		{
			type = "UIStroke",
			properties = {
				Color = Color3.fromRGB(120, 255, 255),
				Thickness = 1,
				LineJoinMode = Enum.LineJoinMode.Round,
				Transparency = 0.5,
				ApplyStrokeMode = Enum.ApplyStrokeMode.Border
			}
		},
		{
			type = "UICorner",
			properties = {
				CornerRadius = UDim.new(0, 4),
			}
		},
		{
			type = "TextLabel",
			properties = {
				TextWrapped = true,
				ZIndex = 3,
				BorderSizePixel = 0,
				BackgroundColor3 = Color3.fromRGB(255, 255, 255),
				FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal),
				TextSize = 16,
				TextColor3 = Color3.fromRGB(205, 205, 205),
				Size = UDim2.new(1, 0, 0.6, 0),
				BorderColor3 = Color3.fromRGB(0, 0, 0),
				Name = "text",
				BackgroundTransparency = 1,
				Position = UDim2.new(0, 0, 0, 0)
			}
		},
		{
			type = "Frame",
			properties = {
				ZIndex = 3,
				BorderSizePixel = 0,
				BackgroundTransparency = 1,
				Size = UDim2.new(0.98, 0, 0.3, 0),
				BorderColor3 = Color3.fromRGB(0, 0, 0),
				Position = UDim2.new(0.01, 0, 0.6, 0),
				Name = "body"
			},
			parts = {
				{
					type = "UIStroke",
					properties = {
						Color = Color3.fromRGB(120, 255, 255),
						Thickness = 1,
						LineJoinMode = Enum.LineJoinMode.Round,
						Transparency = 0.5,
						ApplyStrokeMode = Enum.ApplyStrokeMode.Border
					}
				},
				{
					type = "UICorner",
					properties = {
						CornerRadius = UDim.new(0, 4),
					}
				},
				{
					type = "Frame",
					properties = {
						ZIndex = 3,
						BorderSizePixel = 0,
						BackgroundColor3 = Color3.fromRGB(120, 255, 255),
						Size = UDim2.new(0.5, 0, 1, 0),
						BackgroundTransparency = 0.5,
						BorderColor3 = Color3.fromRGB(0, 0, 0),
						Name = "interact"
					},
					parts = {
						{
							type = "UICorner",
							properties = {
								CornerRadius = UDim.new(0, 4)
							}
						},
					}
				}
			}
		}
	})
	
	assets.dropdown = libary.internal:create("Frame", {
		ZIndex = 2,
		BorderSizePixel = 0,
		BackgroundColor3 = Color3.fromRGB(30, 30, 30),
		Size = UDim2.new(1, 0, 0, 30),
		Selectable = true,
		ClipsDescendants = true,
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		Parent = folder
	},
	{
		{
			type = "UIStroke",
			properties = {
				Color = Color3.fromRGB(120, 255, 255),
				Thickness = 1,
				LineJoinMode = Enum.LineJoinMode.Round,
				Transparency = 0.5,
				ApplyStrokeMode = Enum.ApplyStrokeMode.Border
			}
		},
		{
			type = "UICorner",
			properties = {
				CornerRadius = UDim.new(0, 4)
			}
		},
		{
			type = "UIPadding",
			properties = {
				PaddingTop = UDim.new(0, 0),
				PaddingRight = UDim.new(0, 5),
				PaddingLeft = UDim.new(0, 5)
			},
		},
		{
			type = "TextButton",
			properties = {
				TextWrapped = true,
				ZIndex = 5,
				BorderSizePixel = 0,
				BackgroundColor3 = Color3.fromRGB(31, 31, 31),
				TextSize = 16,
				FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal),
				TextColor3 = Color3.fromRGB(205, 205, 205),
				Selectable = false,
				Size = UDim2.new(1, 10, 0, 30),
				Name = "button",
				BorderColor3 = Color3.fromRGB(0, 0, 0),
				Position = UDim2.new(0, -5, 0, 0)
			},
			parts = {
				{
					type = "UICorner",
					properties = {
						CornerRadius = UDim.new(0, 4)
					}
				}
			}
		},
		{
			type = "Folder",
			properties = {
				Name = "objects" 
			},
			parts = {
				{
					type = "Frame",
					properties = {
						BorderSizePixel = 0,
						BackgroundColor3 = Color3.fromRGB(255, 255, 255),
						LayoutOrder = -1,
						Size = UDim2.new(0, 0, 0, 30),
						BorderColor3 = Color3.fromRGB(0, 0, 0),
					}
				},
				{
					type = "UIListLayout",
					properties = {
						Padding = UDim.new(0, 5),
						SortOrder = Enum.SortOrder.LayoutOrder
					}
				}
			}
		}
	})
	
	assets.dropdownSelect = libary.internal:create("TextButton", {
		ZIndex = 2,
		BorderSizePixel = 0,
		BackgroundColor3 = Color3.fromRGB(30, 30, 30),
		TextSize = 14,
		FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal),
		TextColor3 = Color3.fromRGB(205, 205, 205),
		Size = UDim2.new(1, 0, 0, 20),
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		Parent = folder
	}, 
	{
		{
			type = "UIStroke",
			properties = {
				Color = Color3.fromRGB(120, 255, 255),
				Thickness = 1,
				LineJoinMode = Enum.LineJoinMode.Round,
				Transparency = 0.5,
				ApplyStrokeMode = Enum.ApplyStrokeMode.Border
			}
		},
		{
			type = "UICorner",
			properties = {
				CornerRadius = UDim.new(0, 4),
			}
		},
	})

	gui.topbar:FindFirstChildWhichIsA("TextLabel").Text = libary.data.title
	libary.internal.drag("main", gui.frame, gui.topbar)

	return gui
end