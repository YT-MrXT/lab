local module = {}

function module.createButton(tab, config)
	local buttonFrame = Instance.new("TextButton")
	buttonFrame.Name = "Button"
	buttonFrame.Size = UDim2.new(1, 0, 0, 35)
	buttonFrame.BackgroundColor3 = Color3.fromRGB(16, 16, 16)
	buttonFrame.BorderSizePixel = 0
	buttonFrame.AutoButtonColor = false
	buttonFrame.Text = ""
	buttonFrame.ZIndex = 4
	buttonFrame.Parent = tab.Container
	
	local buttonCorner = Instance.new("UICorner")
	buttonCorner.CornerRadius = UDim.new(0, 8)
	buttonCorner.Parent = buttonFrame
	
	local buttonTitle = Instance.new("TextLabel")
	buttonTitle.Size = UDim2.new(1, -40, 0, 18)
	buttonTitle.Position = UDim2.new(0, 12, 0, 8)
	buttonTitle.BackgroundTransparency = 1
	buttonTitle.Text = config.Name or "Button"
	buttonTitle.TextColor3 = tab.window.colorfulLetters and tab.window.themeColor or Color3.fromRGB(255, 255, 255)
	buttonTitle.TextSize = 14
	buttonTitle.Font = Enum.Font.GothamBold
	buttonTitle.TextXAlignment = Enum.TextXAlignment.Left
	buttonTitle.ZIndex = 5
	buttonTitle.Parent = buttonFrame
	
	local buttonIcon = Instance.new("ImageLabel")
	buttonIcon.Size = UDim2.new(0, 20, 0, 20)
	buttonIcon.Position = UDim2.new(1, -30, 0, 8)
	buttonIcon.BackgroundTransparency = 1
	buttonIcon.Image = "rbxassetid://82813960790400"
	buttonIcon.ImageColor3 = tab.window.themeColor
	buttonIcon.ZIndex = 5
	buttonIcon.Parent = buttonFrame
	
	buttonFrame.MouseButton1Click:Connect(function()
		_G.createTween(buttonFrame, {BackgroundColor3 = Color3.fromRGB(25, 25, 25)}, 0.1, Enum.EasingStyle.Quart):Play()
		task.wait(0.1)
		_G.createTween(buttonFrame, {BackgroundColor3 = Color3.fromRGB(16, 16, 16)}, 0.1, Enum.EasingStyle.Quart):Play()
		
		if config.Callback then
			config.Callback()
		end
	end)
end

function module.createButtonConfirmation(tab, config)
	local buttonFrame = Instance.new("TextButton")
	buttonFrame.Name = "ButtonConfirmation"
	buttonFrame.Size = UDim2.new(1, 0, 0, 35)
	buttonFrame.BackgroundColor3 = Color3.fromRGB(16, 16, 16)
	buttonFrame.BorderSizePixel = 0
	buttonFrame.AutoButtonColor = false
	buttonFrame.Text = ""
	buttonFrame.ZIndex = 4
	buttonFrame.Parent = tab.Container
	
	local buttonCorner = Instance.new("UICorner")
	buttonCorner.CornerRadius = UDim.new(0, 8)
	buttonCorner.Parent = buttonFrame
	
	local buttonTitle = Instance.new("TextLabel")
	buttonTitle.Size = UDim2.new(1, -40, 0, 18)
	buttonTitle.Position = UDim2.new(0, 12, 0, 8)
	buttonTitle.BackgroundTransparency = 1
	buttonTitle.Text = config.Name or "Button"
	buttonTitle.TextColor3 = tab.window.colorfulLetters and tab.window.themeColor or Color3.fromRGB(255, 255, 255)
	buttonTitle.TextSize = 14
	buttonTitle.Font = Enum.Font.GothamBold
	buttonTitle.TextXAlignment = Enum.TextXAlignment.Left
	buttonTitle.ZIndex = 5
	buttonTitle.Parent = buttonFrame
	
	local buttonIcon = Instance.new("ImageLabel")
	buttonIcon.Size = UDim2.new(0, 20, 0, 20)
	buttonIcon.Position = UDim2.new(1, -30, 0, 8)
	buttonIcon.BackgroundTransparency = 1
	buttonIcon.Image = "rbxassetid://82813960790400"
	buttonIcon.ImageColor3 = tab.window.themeColor
	buttonIcon.ZIndex = 5
	buttonIcon.Parent = buttonFrame
	
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
	confirmText.Text = "Do you really want to click this?"
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
	
	buttonFrame.MouseButton1Click:Connect(function()
		confirmDialog.Visible = true
	end)
	
	yesBtn.MouseButton1Click:Connect(function()
		confirmDialog.Visible = false
		_G.createTween(buttonFrame, {BackgroundColor3 = Color3.fromRGB(25, 25, 25)}, 0.1, Enum.EasingStyle.Quart):Play()
		task.wait(0.1)
		_G.createTween(buttonFrame, {BackgroundColor3 = Color3.fromRGB(16, 16, 16)}, 0.1, Enum.EasingStyle.Quart):Play()
		
		if config.Callback then
			config.Callback()
		end
	end)
	
	noBtn.MouseButton1Click:Connect(function()
		confirmDialog.Visible = false
	end)
end

return module
