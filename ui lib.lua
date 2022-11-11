local library = {}

for i,v in pairs(game.CoreGui:GetChildren()) do
	if v:IsA("ScreenGui") and v.Name == "UI" then
		v:Destroy()
	end
end

function library:NewWindow(name)
	
	local ScreenGui = Instance.new("ScreenGui")
	local Top = Instance.new("Frame")
	local c = Instance.new("Frame")
	local UIGridLayout = Instance.new("UIGridLayout")

	local TextLabel = Instance.new("TextLabel")


	ScreenGui.Parent = game.CoreGui
	ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	ScreenGui.Name = "UI"

	Top.Name = "Top"
	Top.Parent = ScreenGui
	Top.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	Top.Position = UDim2.new(0.0443886369, 0, 0.590078354, 0)
	Top.Size = UDim2.new(0, 492, 0, 42)
	Top.Draggable = true

	c.Name = "c"
	c.Parent = Top
	c.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
	c.Position = UDim2.new(0, 0, 1, 0)
	c.Size = UDim2.new(0, 491, 0, 257)

	UIGridLayout.Parent = c
	UIGridLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIGridLayout.CellSize = UDim2.new(0, 150, 0, 50)
	

	TextLabel.Parent = Top
	TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel.BackgroundTransparency = 1.000
	TextLabel.Size = UDim2.new(0, 366, 0, 41)
	TextLabel.Font = Enum.Font.SourceSans
	TextLabel.Text = name
	TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel.TextScaled = true
	TextLabel.TextSize = 14.000
	TextLabel.TextWrapped = true
	TextLabel.TextXAlignment = Enum.TextXAlignment.Left
	TextLabel.TextYAlignment = Enum.TextYAlignment.Bottom
	
	local Events = {}
	
	function Events:NewButton(text, callback)
	text = text or "New Button"
	callback = callback or function() end
		
		local TextButton = Instance.new("TextButton")

		TextButton.Parent = c
		TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TextButton.Size = UDim2.new(0, 200, 0, 50)
		TextButton.Font = Enum.Font.SourceSans
		TextButton.Text = text
		TextButton.TextColor3 = Color3.fromRGB(0, 0, 0)
		TextButton.TextScaled = true
		TextButton.TextSize = 14.000
		TextButton.TextWrapped = true
		TextButton.MouseButton1Down:Connect(function()
			pcall(callback)
		end)
		
	end
	return Events
end
return library
