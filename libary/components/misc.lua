local module = {}

function module.createSection(tab, text)
	local sectionFrame = Instance.new("Frame")
	sectionFrame.Name = "Section"
	sectionFrame.Size = UDim2.new(1, 0, 0, 30)
	sectionFrame.BackgroundTransparency = 1
	sectionFrame.ZIndex = 4
	sectionFrame.Parent = tab.Container
	
	local leftLine = Instance.new("Frame")
	leftLine.Size = UDim2.new(0.5, -50, 0, 1)
	leftLine.Position = UDim2.new(0, 0, 0.5, 0)
	leftLine.BackgroundColor3 = tab.window.themeColor
	leftLine.BorderSizePixel = 0
	leftLine.ZIndex = 5
	leftLine.Parent = sectionFrame
	
	local sectionText = Instance.new("TextLabel")
	sectionText.Size = UDim2.new(0, 90, 0, 20)
	sectionText.Position = UDim2.new(0.5, -45, 0.5, -10)
	sectionText.BackgroundTransparency = 1
	sectionText.Text = text
	sectionText.TextColor3 = tab.window.colorfulLetters and tab.window.themeColor or Color3.fromRGB(255, 255, 255)
	sectionText.TextSize = 13
	sectionText.Font = Enum.Font.GothamBold
	sectionText.ZIndex = 5
	sectionText.Parent = sectionFrame
	
	local rightLine = Instance.new("Frame")
	rightLine.Size = UDim2.new(0.5, -50, 0, 1)
	rightLine.Position = UDim2.new(0.5, 50, 0.5, 0)
	rightLine.BackgroundColor3 = tab.window.themeColor
	rightLine.BorderSizePixel = 0
	rightLine.ZIndex = 5
	rightLine.Parent = sectionFrame
end

function module.createParagraph(tab, config)
	local paragraphFrame = Instance.new("Frame")
	paragraphFrame.Name = "Paragraph"
	paragraphFrame.Size = UDim2.new(1, 0, 0, 60)
	paragraphFrame.BackgroundColor3 = Color3.fromRGB(16, 16, 16)
	paragraphFrame.BorderSizePixel = 0
	paragraphFrame.ZIndex = 4
	paragraphFrame.Parent = tab.Container
	
	local paragraphCorner = Instance.new("UICorner")
	paragraphCorner.CornerRadius = UDim.new(0, 8)
	paragraphCorner.Parent = paragraphFrame
	
	local paragraphTitle = Instance.new("TextLabel")
	paragraphTitle.Size = UDim2.new(1, -24, 0, 20)
	paragraphTitle.Position = UDim2.new(0, 12, 0, 10)
	paragraphTitle.BackgroundTransparency = 1
	paragraphTitle.Text = config.Title or "Title"
	paragraphTitle.TextColor3 = tab.window.colorfulLetters and tab.window.themeColor or Color3.fromRGB(255, 255, 255)
	paragraphTitle.TextSize = 15
	paragraphTitle.Font = Enum.Font.GothamBold
	paragraphTitle.TextXAlignment = Enum.TextXAlignment.Left
	paragraphTitle.ZIndex = 5
	paragraphTitle.Parent = paragraphFrame
	
	local paragraphText = Instance.new("TextLabel")
	paragraphText.Size = UDim2.new(1, -24, 0, 25)
	paragraphText.Position = UDim2.new(0, 12, 0, 30)
	paragraphText.BackgroundTransparency = 1
	paragraphText.Text = config.Text or "Text"
	paragraphText.TextColor3 = Color3.fromRGB(255, 255, 255)
	paragraphText.TextTransparency = 0.5
	paragraphText.TextSize = 13
	paragraphText.Font = Enum.Font.Gotham
	paragraphText.TextXAlignment = Enum.TextXAlignment.Left
	paragraphText.TextWrapped = true
	paragraphText.ZIndex = 5
	paragraphText.Parent = paragraphFrame
end

function module.createTextBox(tab, config)
	local textboxFrame = Instance.new("Frame")
	textboxFrame.Name = "TextBox"
	textboxFrame.Size = UDim2.new(1, 0, 0, 45)
	textboxFrame.BackgroundColor3 = Color3.fromRGB(16, 16, 16)
	textboxFrame.BorderSizePixel = 0
	textboxFrame.ZIndex = 4
	textboxFrame.Parent = tab.Container
	
	local textboxCorner = Instance.new("UICorner")
	textboxCorner.CornerRadius = UDim.new(0, 8)
	textboxCorner.Parent = textboxFrame
	
	local textboxTitle = Instance.new("TextLabel")
	textboxTitle.Size = UDim2.new(0.4, 0, 0, 18)
	textboxTitle.Position = UDim2.new(0, 12, 0, 8)
	textboxTitle.BackgroundTransparency = 1
	textboxTitle.Text = config.Name or "TextBox"
	textboxTitle.TextColor3 = tab.window.colorfulLetters and tab.window.themeColor or Color3.fromRGB(255, 255, 255)
	textboxTitle.TextSize = 14
	textboxTitle.Font = Enum.Font.GothamBold
	textboxTitle.TextXAlignment = Enum.TextXAlignment.Left
	textboxTitle.ZIndex = 5
	textboxTitle.Parent = textboxFrame
	
	local inputBox = Instance.new("TextBox")
	inputBox.Size = UDim2.new(0.55, -24, 0, 25)
	inputBox.Position = UDim2.new(0.45, 0, 0, 8)
	inputBox.BackgroundTransparency = 1
	inputBox.PlaceholderText = config.Placeholder or "Enter text..."
	inputBox.PlaceholderColor3 = Color3.fromRGB(150, 150, 150)
	inputBox.Text = config.Default or ""
	inputBox.TextColor3 = Color3.fromRGB(255, 255, 255)
	inputBox.TextSize = 13
	inputBox.Font = Enum.Font.Gotham
	inputBox.TextXAlignment = Enum.TextXAlignment.Left
	inputBox.ClipsDescendants = true
	inputBox.ClearTextOnFocus = false
	inputBox.ZIndex = 5
	inputBox.Parent = textboxFrame
	
	local underline = Instance.new("Frame")
	underline.Size = UDim2.new(0.55, -24, 0, 1)
	underline.Position = UDim2.new(0.45, 0, 0, 35)
	underline.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
	underline.BorderSizePixel = 0
	underline.ZIndex = 5
	underline.Parent = textboxFrame
	
	inputBox.Focused:Connect(function()
		_G.createTween(underline, {BackgroundColor3 = tab.window.themeColor}, 0.2, Enum.EasingStyle.Quart):Play()
	end)
	
	inputBox.FocusLost:Connect(function(enterPressed)
		_G.createTween(underline, {BackgroundColor3 = Color3.fromRGB(60, 60, 60)}, 0.2, Enum.EasingStyle.Quart):Play()
		
		if config.Callback then
			config.Callback(inputBox.Text)
		end
	end)
end

function module.createDiscordInvite(tab, config)
	local SetClipboard = setclipboard or toclipboard or set_clipboard or (Clipboard and Clipboard.set)
	
	local discordFrame = Instance.new("Frame")
	discordFrame.Name = "DiscordInvite"
	discordFrame.Size = UDim2.new(1, 0, 0, 70)
	discordFrame.BackgroundColor3 = Color3.fromRGB(16, 16, 16)
	discordFrame.BorderSizePixel = 0
	discordFrame.ZIndex = 4
	discordFrame.Parent = tab.Container
	
	local discordCorner = Instance.new("UICorner")
	discordCorner.CornerRadius = UDim.new(0, 8)
	discordCorner.Parent = discordFrame
	
	local discordIcon = Instance.new("ImageLabel")
	discordIcon.Size = UDim2.new(0, 50, 0, 50)
	discordIcon.Position = UDim2.new(0, 10, 0, 10)
	discordIcon.BackgroundTransparency = 1
	discordIcon.Image = config.Icon or ""
	discordIcon.ZIndex = 5
	discordIcon.Parent = discordFrame
	
	local discordIconCorner = Instance.new("UICorner")
	discordIconCorner.CornerRadius = UDim.new(1, 0)
	discordIconCorner.Parent = discordIcon
	
	local discordTitle = Instance.new("TextLabel")
	discordTitle.Size = UDim2.new(1, -180, 0, 22)
	discordTitle.Position = UDim2.new(0, 68, 0, 12)
	discordTitle.BackgroundTransparency = 1
	discordTitle.Text = config.ServerName or "Discord Server"
	discordTitle.TextColor3 = tab.window.colorfulLetters and tab.window.themeColor or Color3.fromRGB(255, 255, 255)
	discordTitle.TextSize = 15
	discordTitle.Font = Enum.Font.GothamBold
	discordTitle.TextXAlignment = Enum.TextXAlignment.Left
	discordTitle.ZIndex = 5
	discordTitle.Parent = discordFrame
	
	local discordLink = Instance.new("TextLabel")
	discordLink.Size = UDim2.new(1, -180, 0, 18)
	discordLink.Position = UDim2.new(0, 68, 0, 36)
	discordLink.BackgroundTransparency = 1
	discordLink.Text = config.Link or ""
	discordLink.TextColor3 = Color3.fromRGB(255, 255, 255)
	discordLink.TextTransparency = 0.5
	discordLink.TextSize = 12
	discordLink.Font = Enum.Font.Gotham
	discordLink.TextXAlignment = Enum.TextXAlignment.Left
	discordLink.ZIndex = 5
	discordLink.Parent = discordFrame
	
	local joinButton = Instance.new("TextButton")
	joinButton.Size = UDim2.new(0, 80, 0, 35)
	joinButton.Position = UDim2.new(1, -90, 0, 18)
	joinButton.BackgroundTransparency = 1
	joinButton.BorderSizePixel = 1
	joinButton.BorderColor3 = tab.window.themeColor
	joinButton.Text = "Join"
	joinButton.TextColor3 = tab.window.themeColor
	joinButton.TextSize = 14
	joinButton.Font = Enum.Font.GothamBold
	joinButton.ZIndex = 5
	joinButton.Parent = discordFrame
	
	local joinButtonCorner = Instance.new("UICorner")
	joinButtonCorner.CornerRadius = UDim.new(0, 8)
	joinButtonCorner.Parent = joinButton
	
	joinButton.MouseButton1Click:Connect(function()
		if SetClipboard then
			SetClipboard(config.Link or "")
		end
		_G.createTween(joinButton, {BackgroundTransparency = 0.8}, 0.15, Enum.EasingStyle.Quart):Play()
		task.wait(0.15)
		_G.createTween(joinButton, {BackgroundTransparency = 1}, 0.15, Enum.EasingStyle.Quart):Play()
	end)
end

return module
