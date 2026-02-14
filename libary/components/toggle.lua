local module = {}

function module.createToggle(tab, config)
	local toggleFrame = Instance.new("Frame")
	toggleFrame.Name = "Toggle"
	toggleFrame.Size = UDim2.new(1, 0, 0, config.Description and 50 or 35)
	toggleFrame.BackgroundColor3 = Color3.fromRGB(16, 16, 16)
	toggleFrame.BorderSizePixel = 0
	toggleFrame.ZIndex = 4
	toggleFrame.Parent = tab.Container
	
	local toggleCorner = Instance.new("UICorner")
	toggleCorner.CornerRadius = UDim.new(0, 8)
	toggleCorner.Parent = toggleFrame
	
	local toggleTitle = Instance.new("TextLabel")
	toggleTitle.Size = UDim2.new(1, -60, 0, 18)
	toggleTitle.Position = UDim2.new(0, 12, 0, 8)
	toggleTitle.BackgroundTransparency = 1
	toggleTitle.Text = config.Name or "Toggle"
	toggleTitle.TextColor3 = tab.window.colorfulLetters and tab.window.themeColor or Color3.fromRGB(255, 255, 255)
	toggleTitle.TextSize = 14
	toggleTitle.Font = Enum.Font.GothamBold
	toggleTitle.TextXAlignment = Enum.TextXAlignment.Left
	toggleTitle.ZIndex = 5
	toggleTitle.Parent = toggleFrame
	
	if config.Description then
		local toggleDesc = Instance.new("TextLabel")
		toggleDesc.Size = UDim2.new(1, -60, 0, 14)
		toggleDesc.Position = UDim2.new(0, 12, 0, 28)
		toggleDesc.BackgroundTransparency = 1
		toggleDesc.Text = config.Description
		toggleDesc.TextColor3 = Color3.fromRGB(255, 255, 255)
		toggleDesc.TextTransparency = 0.5
		toggleDesc.TextSize = 12
		toggleDesc.Font = Enum.Font.Gotham
		toggleDesc.TextXAlignment = Enum.TextXAlignment.Left
		toggleDesc.ZIndex = 5
		toggleDesc.Parent = toggleFrame
	end
	
	local toggleBox = Instance.new("TextButton")
	toggleBox.Size = UDim2.new(0, 44, 0, 24)
	toggleBox.Position = UDim2.new(1, -54, 0, 6)
	toggleBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	toggleBox.BorderSizePixel = 0
	toggleBox.Text = ""
	toggleBox.ZIndex = 5
	toggleBox.Parent = toggleFrame
	
	local toggleBoxCorner = Instance.new("UICorner")
	toggleBoxCorner.CornerRadius = UDim.new(1, 0)
	toggleBoxCorner.Parent = toggleBox
	
	local toggleCircle = Instance.new("Frame")
	toggleCircle.Size = UDim2.new(0, 18, 0, 18)
	toggleCircle.Position = UDim2.new(0, 3, 0.5, -9)
	toggleCircle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	toggleCircle.BorderSizePixel = 0
	toggleCircle.ZIndex = 6
	toggleCircle.Parent = toggleBox
	
	local toggleCircleCorner = Instance.new("UICorner")
	toggleCircleCorner.CornerRadius = UDim.new(1, 0)
	toggleCircleCorner.Parent = toggleCircle
	
	local toggled = config.Default or false
	
	if toggled then
		toggleBox.BackgroundColor3 = tab.window.themeColor
		toggleCircle.Position = UDim2.new(1, -21, 0.5, -9)
	end
	
	toggleBox.MouseButton1Click:Connect(function()
		toggled = not toggled
		
		if toggled then
			_G.createTween(toggleBox, {BackgroundColor3 = tab.window.themeColor}, 0.25, Enum.EasingStyle.Quart):Play()
			_G.createTween(toggleCircle, {Position = UDim2.new(1, -21, 0.5, -9)}, 0.25, Enum.EasingStyle.Quart):Play()
		else
			_G.createTween(toggleBox, {BackgroundColor3 = Color3.fromRGB(30, 30, 30)}, 0.25, Enum.EasingStyle.Quart):Play()
			_G.createTween(toggleCircle, {Position = UDim2.new(0, 3, 0.5, -9)}, 0.25, Enum.EasingStyle.Quart):Play()
		end
		
		if config.Callback then
			config.Callback(toggled)
		end
	end)
end

function module.createToggleConfirmation(tab, config)
	local toggleFrame = Instance.new("Frame")
	toggleFrame.Name = "ToggleConfirmation"
	toggleFrame.Size = UDim2.new(1, 0, 0, config.Description and 50 or 35)
	toggleFrame.BackgroundColor3 = Color3.fromRGB(16, 16, 16)
	toggleFrame.BorderSizePixel = 0
	toggleFrame.ZIndex = 4
	toggleFrame.Parent = tab.Container
	
	local toggleCorner = Instance.new("UICorner")
	toggleCorner.CornerRadius = UDim.new(0, 8)
	toggleCorner.Parent = toggleFrame
	
	local toggleTitle = Instance.new("TextLabel")
	toggleTitle.Size = UDim2.new(1, -60, 0, 18)
	toggleTitle.Position = UDim2.new(0, 12, 0, 8)
	toggleTitle.BackgroundTransparency = 1
	toggleTitle.Text = config.Name or "Toggle"
	toggleTitle.TextColor3 = tab.window.colorfulLetters and tab.window.themeColor or Color3.fromRGB(255, 255, 255)
	toggleTitle.TextSize = 14
	toggleTitle.Font = Enum.Font.GothamBold
	toggleTitle.TextXAlignment = Enum.TextXAlignment.Left
	toggleTitle.ZIndex = 5
	toggleTitle.Parent = toggleFrame
	
	if config.Description then
		local toggleDesc = Instance.new("TextLabel")
		toggleDesc.Size = UDim2.new(1, -60, 0, 14)
		toggleDesc.Position = UDim2.new(0, 12, 0, 28)
		toggleDesc.BackgroundTransparency = 1
		toggleDesc.Text = config.Description
		toggleDesc.TextColor3 = Color3.fromRGB(255, 255, 255)
		toggleDesc.TextTransparency = 0.5
		toggleDesc.TextSize = 12
		toggleDesc.Font = Enum.Font.Gotham
		toggleDesc.TextXAlignment = Enum.TextXAlignment.Left
		toggleDesc.ZIndex = 5
		toggleDesc.Parent = toggleFrame
	end
	
	local toggleBox = Instance.new("TextButton")
	toggleBox.Size = UDim2.new(0, 44, 0, 24)
	toggleBox.Position = UDim2.new(1, -54, 0, 6)
	toggleBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	toggleBox.BorderSizePixel = 0
	toggleBox.Text = ""
	toggleBox.ZIndex = 5
	toggleBox.Parent = toggleFrame
	
	local toggleBoxCorner = Instance.new("UICorner")
	toggleBoxCorner.CornerRadius = UDim.new(1, 0)
	toggleBoxCorner.Parent = toggleBox
	
	local toggleCircle = Instance.new("Frame")
	toggleCircle.Size = UDim2.new(0, 18, 0, 18)
	toggleCircle.Position = UDim2.new(0, 3, 0.5, -9)
	toggleCircle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	toggleCircle.BorderSizePixel = 0
	toggleCircle.ZIndex = 6
	toggleCircle.Parent = toggleBox
	
	local toggleCircleCorner = Instance.new("UICorner")
	toggleCircleCorner.CornerRadius = UDim.new(1, 0)
	toggleCircleCorner.Parent = toggleCircle
	
	local CoreGui = game:GetService("CoreGui")
	local confirmDialog = Instance.new("Frame")
	confirmDialog.Name = "ConfirmDialog"
	confirmDialog.Size = UDim2.new(0, 280, 0, 130)
	confirmDialog.Position = UDim2.new(0.5, -140, 0.5, -65)
	confirmDialog.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
	confirmDialog.BorderSizePixel = 0
	confirmDialog.Visible = false
	confirmDialog.ZIndex = 100
	confirmDialog.Parent = tab.window.screenGui
	
	local confirmCorner = Instance.new("UICorner")
	confirmCorner.CornerRadius = UDim.new(0, 12)
	confirmCorner.Parent = confirmDialog
	
	local confirmText = Instance.new("TextLabel")
	confirmText.Size = UDim2.new(1, -40, 0, 50)
	confirmText.Position = UDim2.new(0, 20, 0, 20)
	confirmText.BackgroundTransparency = 1
	confirmText.Text = "Do you really want to enable this?"
	confirmText.TextColor3 = Color3.fromRGB(255, 255, 255)
	confirmText.TextSize = 14
	confirmText.Font = Enum.Font.GothamBold
	confirmText.TextWrapped = true
	confirmText.ZIndex = 101
	confirmText.Parent = confirmDialog
	
	local yesBtn = Instance.new("TextButton")
	yesBtn.Size = UDim2.new(0, 110, 0, 30)
	yesBtn.Position = UDim2.new(0, 20, 1, -40)
	yesBtn.BackgroundColor3 = Color3.fromRGB(50, 150, 50)
	yesBtn.BorderSizePixel = 0
	yesBtn.Text = "Yes"
	yesBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
	yesBtn.TextSize = 13
	yesBtn.Font = Enum.Font.GothamBold
	yesBtn.ZIndex = 101
	yesBtn.Parent = confirmDialog
	
	local yesBtnCorner = Instance.new("UICorner")
	yesBtnCorner.CornerRadius = UDim.new(0, 8)
	yesBtnCorner.Parent = yesBtn
	
	local noBtn = Instance.new("TextButton")
	noBtn.Size = UDim2.new(0, 110, 0, 30)
	noBtn.Position = UDim2.new(1, -130, 1, -40)
	noBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
	noBtn.BorderSizePixel = 0
	noBtn.Text = "No"
	noBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
	noBtn.TextSize = 13
	noBtn.Font = Enum.Font.GothamBold
	noBtn.ZIndex = 101
	noBtn.Parent = confirmDialog
	
	local noBtnCorner = Instance.new("UICorner")
	noBtnCorner.CornerRadius = UDim.new(0, 8)
	noBtnCorner.Parent = noBtn
	
	local toggled = config.Default or false
	
	if toggled then
		toggleBox.BackgroundColor3 = tab.window.themeColor
		toggleCircle.Position = UDim2.new(1, -21, 0.5, -9)
	end
	
	toggleBox.MouseButton1Click:Connect(function()
		if not toggled then
			confirmDialog.Visible = true
		else
			toggled = false
			_G.createTween(toggleBox, {BackgroundColor3 = Color3.fromRGB(30, 30, 30)}, 0.25, Enum.EasingStyle.Quart):Play()
			_G.createTween(toggleCircle, {Position = UDim2.new(0, 3, 0.5, -9)}, 0.25, Enum.EasingStyle.Quart):Play()
			if config.Callback then
				config.Callback(toggled)
			end
		end
	end)
	
	yesBtn.MouseButton1Click:Connect(function()
		toggled = true
		confirmDialog.Visible = false
		_G.createTween(toggleBox, {BackgroundColor3 = tab.window.themeColor}, 0.25, Enum.EasingStyle.Quart):Play()
		_G.createTween(toggleCircle, {Position = UDim2.new(1, -21, 0.5, -9)}, 0.25, Enum.EasingStyle.Quart):Play()
		if config.Callback then
			config.Callback(toggled)
		end
	end)
	
	noBtn.MouseButton1Click:Connect(function()
		confirmDialog.Visible = false
	end)
end

return module
