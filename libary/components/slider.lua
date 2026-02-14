local UserInputService = game:GetService("UserInputService")

local module = {}

function module.createSlider(tab, config)
	local sliderFrame = Instance.new("Frame")
	sliderFrame.Name = "Slider"
	sliderFrame.Size = UDim2.new(1, 0, 0, 70)
	sliderFrame.BackgroundColor3 = Color3.fromRGB(16, 16, 16)
	sliderFrame.BorderSizePixel = 0
	sliderFrame.ZIndex = 4
	sliderFrame.Parent = tab.Container
	
	local sliderCorner = Instance.new("UICorner")
	sliderCorner.CornerRadius = UDim.new(0, 8)
	sliderCorner.Parent = sliderFrame
	
	local sliderTitle = Instance.new("TextLabel")
	sliderTitle.Size = UDim2.new(1, -100, 0, 18)
	sliderTitle.Position = UDim2.new(0, 12, 0, 8)
	sliderTitle.BackgroundTransparency = 1
	sliderTitle.Text = config.Name or "Slider"
	sliderTitle.TextColor3 = tab.window.colorfulLetters and tab.window.themeColor or Color3.fromRGB(255, 255, 255)
	sliderTitle.TextSize = 14
	sliderTitle.Font = Enum.Font.GothamBold
	sliderTitle.TextXAlignment = Enum.TextXAlignment.Left
	sliderTitle.ZIndex = 5
	sliderTitle.Parent = sliderFrame
	
	local valueInput = Instance.new("TextBox")
	valueInput.Size = UDim2.new(0, 80, 0, 25)
	valueInput.Position = UDim2.new(1, -90, 0, 5)
	valueInput.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
	valueInput.BorderSizePixel = 0
	valueInput.PlaceholderText = "Input"
	valueInput.PlaceholderColor3 = Color3.fromRGB(150, 150, 150)
	valueInput.Text = ""
	valueInput.TextColor3 = Color3.fromRGB(255, 255, 255)
	valueInput.TextSize = 13
	valueInput.Font = Enum.Font.Gotham
	valueInput.ClipsDescendants = true
	valueInput.ZIndex = 5
	valueInput.Parent = sliderFrame
	
	local inputCorner = Instance.new("UICorner")
	inputCorner.CornerRadius = UDim.new(0, 6)
	inputCorner.Parent = valueInput
	
	local sliderBar = Instance.new("Frame")
	sliderBar.Size = UDim2.new(1, -24, 0, 6)
	sliderBar.Position = UDim2.new(0, 12, 0, 45)
	sliderBar.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	sliderBar.BorderSizePixel = 0
	sliderBar.ZIndex = 5
	sliderBar.Parent = sliderFrame
	
	local sliderBarCorner = Instance.new("UICorner")
	sliderBarCorner.CornerRadius = UDim.new(1, 0)
	sliderBarCorner.Parent = sliderBar
	
	local sliderFill = Instance.new("Frame")
	sliderFill.Size = UDim2.new(0, 0, 1, 0)
	sliderFill.BackgroundColor3 = tab.window.themeColor
	sliderFill.BorderSizePixel = 0
	sliderFill.ZIndex = 6
	sliderFill.Parent = sliderBar
	
	local sliderFillCorner = Instance.new("UICorner")
	sliderFillCorner.CornerRadius = UDim.new(1, 0)
	sliderFillCorner.Parent = sliderFill
	
	local min = config.Min or 0
	local max = config.Max or 100
	local currentValue = config.Default or min
	
	local function updateSlider(value)
		currentValue = math.clamp(value, min, max)
		local percentage = (currentValue - min) / (max - min)
		_G.createTween(sliderFill, {Size = UDim2.new(percentage, 0, 1, 0)}, 0.15, Enum.EasingStyle.Quart):Play()
		valueInput.Text = tostring(math.floor(currentValue))
		
		if config.Callback then
			config.Callback(currentValue)
		end
	end
	
	updateSlider(currentValue)
	
	local dragging = false
	
	sliderBar.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			local pos = (input.Position.X - sliderBar.AbsolutePosition.X) / sliderBar.AbsoluteSize.X
			local value = min + (pos * (max - min))
			updateSlider(value)
		end
	end)
	
	sliderBar.InputEnded:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = false
		end
	end)
	
	sliderFill.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
		end
	end)
	
	sliderFill.InputEnded:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = false
		end
	end)
	
	UserInputService.InputChanged:Connect(function(input)
		if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
			local pos = math.clamp((input.Position.X - sliderBar.AbsolutePosition.X) / sliderBar.AbsoluteSize.X, 0, 1)
			local value = min + (pos * (max - min))
			updateSlider(value)
		end
	end)
	
	valueInput.FocusLost:Connect(function()
		local value = tonumber(valueInput.Text)
		if value then
			updateSlider(value)
		else
			valueInput.Text = tostring(math.floor(currentValue))
		end
	end)
end

return module
