local module = {}

function module.createDropdown(tab, config)
	local dropdownFrame = Instance.new("Frame")
	dropdownFrame.Name = "Dropdown"
	dropdownFrame.Size = UDim2.new(1, 0, 0, 50)
	dropdownFrame.BackgroundColor3 = Color3.fromRGB(16, 16, 16)
	dropdownFrame.BorderSizePixel = 0
	dropdownFrame.ZIndex = 4
	dropdownFrame.Parent = tab.Container
	
	local dropdownCorner = Instance.new("UICorner")
	dropdownCorner.CornerRadius = UDim.new(0, 8)
	dropdownCorner.Parent = dropdownFrame
	
	local dropdownTitle = Instance.new("TextLabel")
	dropdownTitle.Size = UDim2.new(1, -40, 0, 12)
	dropdownTitle.Position = UDim2.new(0, 12, 0, 5)
	dropdownTitle.BackgroundTransparency = 1
	dropdownTitle.Text = config.Name or "Dropdown"
	dropdownTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
	dropdownTitle.TextTransparency = 0.4
	dropdownTitle.TextSize = 10
	dropdownTitle.Font = Enum.Font.Gotham
	dropdownTitle.TextXAlignment = Enum.TextXAlignment.Left
	dropdownTitle.ZIndex = 5
	dropdownTitle.Parent = dropdownFrame
	
	local options = config.Options or config.List or {}
	local selectedLabel = Instance.new("TextLabel")
	selectedLabel.Size = UDim2.new(1, -50, 0, 20)
	selectedLabel.Position = UDim2.new(0, 12, 0, 22)
	selectedLabel.BackgroundTransparency = 1
	selectedLabel.Text = config.Default or (options[1]) or "None"
	selectedLabel.TextColor3 = tab.window.colorfulLetters and tab.window.themeColor or Color3.fromRGB(255, 255, 255)
	selectedLabel.TextSize = 14
	selectedLabel.Font = Enum.Font.GothamBold
	selectedLabel.TextXAlignment = Enum.TextXAlignment.Left
	selectedLabel.TextWrapped = true
	selectedLabel.TextScaled = false
	selectedLabel.ZIndex = 5
	selectedLabel.Parent = dropdownFrame
	
	task.spawn(function()
		task.wait(0.1)
		if not selectedLabel.TextFits then
			selectedLabel.TextScaled = true
		end
	end)
	
	local dropdownButton = Instance.new("TextButton")
	dropdownButton.Size = UDim2.new(1, 0, 0, 50)
	dropdownButton.BackgroundTransparency = 1
	dropdownButton.Text = ""
	dropdownButton.ZIndex = 5
	dropdownButton.Parent = dropdownFrame
	
	local dropdownIcon = Instance.new("ImageLabel")
	dropdownIcon.Size = UDim2.new(0, 20, 0, 20)
	dropdownIcon.Position = UDim2.new(1, -30, 0, 15)
	dropdownIcon.BackgroundTransparency = 1
	dropdownIcon.Image = "rbxassetid://83117456476141"
	dropdownIcon.ImageColor3 = tab.window.themeColor
	dropdownIcon.Rotation = 0
	dropdownIcon.ZIndex = 5
	dropdownIcon.Parent = dropdownFrame
	
	local dropdownList = Instance.new("ScrollingFrame")
	dropdownList.Name = "DropdownList"
	dropdownList.Size = UDim2.new(1, 0, 0, 0)
	dropdownList.Position = UDim2.new(0, 0, 0, 50)
	dropdownList.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
	dropdownList.BorderSizePixel = 0
	dropdownList.ScrollBarThickness = 4
	dropdownList.ScrollBarImageColor3 = Color3.fromRGB(60, 60, 60)
	dropdownList.ClipsDescendants = true
	dropdownList.Visible = false
	dropdownList.ZIndex = 5
	dropdownList.Parent = dropdownFrame
	
	local dropdownListCorner = Instance.new("UICorner")
	dropdownListCorner.CornerRadius = UDim.new(0, 8)
	dropdownListCorner.Parent = dropdownList
	
	local dropdownListLayout = Instance.new("UIListLayout")
	dropdownListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	dropdownListLayout.Padding = UDim.new(0, 2)
	dropdownListLayout.Parent = dropdownList
	
	local dropdownListPadding = Instance.new("UIPadding")
	dropdownListPadding.PaddingTop = UDim.new(0, 5)
	dropdownListPadding.PaddingBottom = UDim.new(0, 5)
	dropdownListPadding.PaddingLeft = UDim.new(0, 5)
	dropdownListPadding.PaddingRight = UDim.new(0, 5)
	dropdownListPadding.Parent = dropdownList
	
	local isOpen = false
	local selectedOption = config.Default or (options[1]) or "None"
	
	dropdownButton.MouseButton1Click:Connect(function()
		isOpen = not isOpen
		
		if isOpen then
			dropdownList.Visible = true
			local listHeight = math.min(#options * 32 + 10, 200)
			dropdownList.CanvasSize = UDim2.new(0, 0, 0, #options * 32 + 10)
			_G.createTween(dropdownList, {Size = UDim2.new(1, 0, 0, listHeight)}, 0.25, Enum.EasingStyle.Quart):Play()
			_G.createTween(dropdownIcon, {Rotation = 180}, 0.25, Enum.EasingStyle.Quart):Play()
			_G.createTween(dropdownFrame, {Size = UDim2.new(1, 0, 0, 50 + listHeight)}, 0.25, Enum.EasingStyle.Quart):Play()
		else
			_G.createTween(dropdownList, {Size = UDim2.new(1, 0, 0, 0)}, 0.25, Enum.EasingStyle.Quart):Play()
			_G.createTween(dropdownIcon, {Rotation = 0}, 0.25, Enum.EasingStyle.Quart):Play()
			_G.createTween(dropdownFrame, {Size = UDim2.new(1, 0, 0, 50)}, 0.25, Enum.EasingStyle.Quart):Play()
			task.wait(0.25)
			dropdownList.Visible = false
		end
	end)
	
	if options then
		for _, option in ipairs(options) do
			local optionButton = Instance.new("TextButton")
			optionButton.Size = UDim2.new(1, -10, 0, 28)
			optionButton.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
			optionButton.BorderSizePixel = 0
			optionButton.Text = ""
			optionButton.ZIndex = 6
			optionButton.Parent = dropdownList
			
			local optionCorner = Instance.new("UICorner")
			optionCorner.CornerRadius = UDim.new(0, 6)
			optionCorner.Parent = optionButton
			
			local optionCheck = Instance.new("ImageLabel")
			optionCheck.Size = UDim2.new(0, 0, 0, 0)
			optionCheck.Position = UDim2.new(0, 8, 0.5, 0)
			optionCheck.AnchorPoint = Vector2.new(0, 0.5)
			optionCheck.BackgroundTransparency = 1
			optionCheck.Image = "rbxassetid://116285837360817"
			optionCheck.ImageColor3 = tab.window.themeColor
			optionCheck.ZIndex = 7
			optionCheck.Parent = optionButton
			
			local optionText = Instance.new("TextLabel")
			optionText.Size = UDim2.new(1, -30, 1, 0)
			optionText.Position = UDim2.new(0, 25, 0, 0)
			optionText.BackgroundTransparency = 1
			optionText.Text = option
			optionText.TextColor3 = Color3.fromRGB(255, 255, 255)
			optionText.TextSize = 13
			optionText.Font = Enum.Font.Gotham
			optionText.TextXAlignment = Enum.TextXAlignment.Left
			optionText.ZIndex = 7
			optionText.Parent = optionButton
			
			if option == selectedOption then
				optionCheck.Size = UDim2.new(0, 16, 0, 16)
				optionButton.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
			end
			
			optionButton.MouseButton1Click:Connect(function()
				for _, child in pairs(dropdownList:GetChildren()) do
					if child:IsA("TextButton") then
						local check = child:FindFirstChild("ImageLabel")
						if check then
							_G.createTween(check, {Size = UDim2.new(0, 0, 0, 0)}, 0.2, Enum.EasingStyle.Quart):Play()
						end
						_G.createTween(child, {BackgroundColor3 = Color3.fromRGB(18, 18, 18)}, 0.2, Enum.EasingStyle.Quart):Play()
					end
				end
				
				_G.createTween(optionCheck, {Size = UDim2.new(0, 16, 0, 16)}, 0.2, Enum.EasingStyle.Back, Enum.EasingDirection.Out):Play()
				_G.createTween(optionButton, {BackgroundColor3 = Color3.fromRGB(25, 25, 25)}, 0.2, Enum.EasingStyle.Quart):Play()
				selectedOption = option
				selectedLabel.Text = option
				selectedLabel.TextScaled = false
				
				task.spawn(function()
					task.wait(0.1)
					if not selectedLabel.TextFits then
						selectedLabel.TextScaled = true
					end
				end)
				
				if config.Callback then
					config.Callback(option)
				end
			end)
		end
	end
end

function module.createMultiDropdown(tab, config)
	local dropdownFrame = Instance.new("Frame")
	dropdownFrame.Name = "MultiDropdown"
	dropdownFrame.Size = UDim2.new(1, 0, 0, 50)
	dropdownFrame.BackgroundColor3 = Color3.fromRGB(16, 16, 16)
	dropdownFrame.BorderSizePixel = 0
	dropdownFrame.ZIndex = 4
	dropdownFrame.Parent = tab.Container
	
	local dropdownCorner = Instance.new("UICorner")
	dropdownCorner.CornerRadius = UDim.new(0, 8)
	dropdownCorner.Parent = dropdownFrame
	
	local dropdownTitle = Instance.new("TextLabel")
	dropdownTitle.Size = UDim2.new(1, -40, 0, 12)
	dropdownTitle.Position = UDim2.new(0, 12, 0, 5)
	dropdownTitle.BackgroundTransparency = 1
	dropdownTitle.Text = config.Name or "Multi Dropdown"
	dropdownTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
	dropdownTitle.TextTransparency = 0.4
	dropdownTitle.TextSize = 10
	dropdownTitle.Font = Enum.Font.Gotham
	dropdownTitle.TextXAlignment = Enum.TextXAlignment.Left
	dropdownTitle.ZIndex = 5
	dropdownTitle.Parent = dropdownFrame
	
	local selectedLabel = Instance.new("TextLabel")
	selectedLabel.Size = UDim2.new(1, -50, 0, 20)
	selectedLabel.Position = UDim2.new(0, 12, 0, 22)
	selectedLabel.BackgroundTransparency = 1
	selectedLabel.Text = "None"
	selectedLabel.TextColor3 = tab.window.colorfulLetters and tab.window.themeColor or Color3.fromRGB(255, 255, 255)
	selectedLabel.TextSize = 14
	selectedLabel.Font = Enum.Font.GothamBold
	selectedLabel.TextXAlignment = Enum.TextXAlignment.Left
	selectedLabel.TextWrapped = true
	selectedLabel.TextScaled = false
	selectedLabel.ZIndex = 5
	selectedLabel.Parent = dropdownFrame
	
	local dropdownButton = Instance.new("TextButton")
	dropdownButton.Size = UDim2.new(1, 0, 0, 50)
	dropdownButton.BackgroundTransparency = 1
	dropdownButton.Text = ""
	dropdownButton.ZIndex = 5
	dropdownButton.Parent = dropdownFrame
	
	local dropdownIcon = Instance.new("ImageLabel")
	dropdownIcon.Size = UDim2.new(0, 20, 0, 20)
	dropdownIcon.Position = UDim2.new(1, -30, 0, 15)
	dropdownIcon.BackgroundTransparency = 1
	dropdownIcon.Image = "rbxassetid://83117456476141"
	dropdownIcon.ImageColor3 = tab.window.themeColor
	dropdownIcon.Rotation = 0
	dropdownIcon.ZIndex = 5
	dropdownIcon.Parent = dropdownFrame
	
	local options = config.Options or config.List or {}
	local dropdownList = Instance.new("ScrollingFrame")
	dropdownList.Name = "DropdownList"
	dropdownList.Size = UDim2.new(1, 0, 0, 0)
	dropdownList.Position = UDim2.new(0, 0, 0, 50)
	dropdownList.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
	dropdownList.BorderSizePixel = 0
	dropdownList.ScrollBarThickness = 4
	dropdownList.ScrollBarImageColor3 = Color3.fromRGB(60, 60, 60)
	dropdownList.ClipsDescendants = true
	dropdownList.Visible = false
	dropdownList.ZIndex = 5
	dropdownList.Parent = dropdownFrame
	
	local dropdownListCorner = Instance.new("UICorner")
	dropdownListCorner.CornerRadius = UDim.new(0, 8)
	dropdownListCorner.Parent = dropdownList
	
	local dropdownListLayout = Instance.new("UIListLayout")
	dropdownListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	dropdownListLayout.Padding = UDim.new(0, 2)
	dropdownListLayout.Parent = dropdownList
	
	local dropdownListPadding = Instance.new("UIPadding")
	dropdownListPadding.PaddingTop = UDim.new(0, 5)
	dropdownListPadding.PaddingBottom = UDim.new(0, 5)
	dropdownListPadding.PaddingLeft = UDim.new(0, 5)
	dropdownListPadding.PaddingRight = UDim.new(0, 5)
	dropdownListPadding.Parent = dropdownList
	
	local isOpen = false
	local selectedOptions = config.Default or {}
	
	local function updateSelectedLabel()
		if #selectedOptions == 0 then
			selectedLabel.Text = "None"
		else
			selectedLabel.Text = table.concat(selectedOptions, ", ")
		end
		
		selectedLabel.TextScaled = false
		task.spawn(function()
			task.wait(0.1)
			if not selectedLabel.TextFits then
				selectedLabel.TextScaled = true
			end
		end)
	end
	
	updateSelectedLabel()
	
	dropdownButton.MouseButton1Click:Connect(function()
		isOpen = not isOpen
		
		if isOpen then
			dropdownList.Visible = true
			local listHeight = math.min(#options * 32 + 10, 200)
			dropdownList.CanvasSize = UDim2.new(0, 0, 0, #options * 32 + 10)
			_G.createTween(dropdownList, {Size = UDim2.new(1, 0, 0, listHeight)}, 0.25, Enum.EasingStyle.Quart):Play()
			_G.createTween(dropdownIcon, {Rotation = 180}, 0.25, Enum.EasingStyle.Quart):Play()
			_G.createTween(dropdownFrame, {Size = UDim2.new(1, 0, 0, 50 + listHeight)}, 0.25, Enum.EasingStyle.Quart):Play()
		else
			_G.createTween(dropdownList, {Size = UDim2.new(1, 0, 0, 0)}, 0.25, Enum.EasingStyle.Quart):Play()
			_G.createTween(dropdownIcon, {Rotation = 0}, 0.25, Enum.EasingStyle.Quart):Play()
			_G.createTween(dropdownFrame, {Size = UDim2.new(1, 0, 0, 50)}, 0.25, Enum.EasingStyle.Quart):Play()
			task.wait(0.25)
			dropdownList.Visible = false
		end
	end)
	
	local function isSelected(option)
		for _, selected in pairs(selectedOptions) do
			if selected == option then
				return true
			end
		end
		return false
	end
	
	local function toggleOption(option, optionCheck, optionButton)
		if isSelected(option) then
			for i, selected in pairs(selectedOptions) do
				if selected == option then
					table.remove(selectedOptions, i)
					break
				end
			end
			_G.createTween(optionCheck, {Size = UDim2.new(0, 0, 0, 0)}, 0.2, Enum.EasingStyle.Quart):Play()
			_G.createTween(optionButton, {BackgroundColor3 = Color3.fromRGB(18, 18, 18)}, 0.2, Enum.EasingStyle.Quart):Play()
		else
			table.insert(selectedOptions, option)
			_G.createTween(optionCheck, {Size = UDim2.new(0, 16, 0, 16)}, 0.2, Enum.EasingStyle.Back, Enum.EasingDirection.Out):Play()
			_G.createTween(optionButton, {BackgroundColor3 = Color3.fromRGB(25, 25, 25)}, 0.2, Enum.EasingStyle.Quart):Play()
		end
		
		updateSelectedLabel()
		
		if config.Callback then
			config.Callback(selectedOptions)
		end
	end
	
	if options then
		for _, option in ipairs(options) do
			local optionButton = Instance.new("TextButton")
			optionButton.Size = UDim2.new(1, -10, 0, 28)
			optionButton.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
			optionButton.BorderSizePixel = 0
			optionButton.Text = ""
			optionButton.ZIndex = 6
			optionButton.Parent = dropdownList
			
			local optionCorner = Instance.new("UICorner")
			optionCorner.CornerRadius = UDim.new(0, 6)
			optionCorner.Parent = optionButton
			
			local optionCheck = Instance.new("ImageLabel")
			optionCheck.Size = UDim2.new(0, 0, 0, 0)
			optionCheck.Position = UDim2.new(0, 8, 0.5, 0)
			optionCheck.AnchorPoint = Vector2.new(0, 0.5)
			optionCheck.BackgroundTransparency = 1
			optionCheck.Image = "rbxassetid://116285837360817"
			optionCheck.ImageColor3 = tab.window.themeColor
			optionCheck.ZIndex = 7
			optionCheck.Parent = optionButton
			
			local optionText = Instance.new("TextLabel")
			optionText.Size = UDim2.new(1, -30, 1, 0)
			optionText.Position = UDim2.new(0, 25, 0, 0)
			optionText.BackgroundTransparency = 1
			optionText.Text = option
			optionText.TextColor3 = Color3.fromRGB(255, 255, 255)
			optionText.TextSize = 13
			optionText.Font = Enum.Font.Gotham
			optionText.TextXAlignment = Enum.TextXAlignment.Left
			optionText.ZIndex = 7
			optionText.Parent = optionButton
			
			if isSelected(option) then
				optionCheck.Size = UDim2.new(0, 16, 0, 16)
				optionButton.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
			end
			
			optionButton.MouseButton1Click:Connect(function()
				toggleOption(option, optionCheck, optionButton)
			end)
		end
	end
end

return module
