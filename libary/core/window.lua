local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")

local module = {}

function module.create(config, themeModule, notifyModule)
	local window = {}
	
	local theme = themeModule.getTheme(config.Theme)
	local themeColor = theme.color
	local isSpecialCat = theme.isSpecial
	local colorfulLetters = config.ColorfulLetters or false
	
	local screenGui = Instance.new("ScreenGui")
	screenGui.Name = "CatLib"
	screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	screenGui.ResetOnSpawn = false
	screenGui.Parent = CoreGui
	
	local notifySystem = notifyModule.create(screenGui, themeColor)
	
	local mainFrame = Instance.new("Frame")
	mainFrame.Name = "MainWindow"
	mainFrame.Size = config.Size or UDim2.new(0, 600, 0, 400)
	mainFrame.Position = UDim2.new(0.5, -300, 0.5, -200)
	mainFrame.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
	mainFrame.BorderSizePixel = 0
	mainFrame.ClipsDescendants = true
	mainFrame.Parent = screenGui
	
	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(0, 12)
	corner.Parent = mainFrame
	
	local header = Instance.new("Frame")
	header.Name = "Header"
	header.Size = UDim2.new(1, 0, 0, 50)
	header.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
	header.BorderSizePixel = 0
	header.ZIndex = 1
	header.Parent = mainFrame
	
	local headerCorner = Instance.new("UICorner")
	headerCorner.CornerRadius = UDim.new(0, 12)
	headerCorner.Parent = header
	
	local iconFrame = Instance.new("ImageLabel")
	iconFrame.Size = UDim2.new(0, 32, 0, 32)
	iconFrame.Position = UDim2.new(0, 12, 0, 9)
	iconFrame.BackgroundTransparency = 1
	iconFrame.Image = config.Icon or ""
	iconFrame.ZIndex = 2
	iconFrame.Parent = header
	
	local titleLabel = Instance.new("TextLabel")
	titleLabel.Size = UDim2.new(0, 200, 0, 20)
	titleLabel.Position = UDim2.new(0, 50, 0, 8)
	titleLabel.BackgroundTransparency = 1
	titleLabel.Text = config.Title or "Window"
	titleLabel.TextColor3 = colorfulLetters and themeColor or Color3.fromRGB(255, 255, 255)
	titleLabel.TextSize = 16
	titleLabel.Font = Enum.Font.GothamBold
	titleLabel.TextXAlignment = Enum.TextXAlignment.Left
	titleLabel.ZIndex = 2
	titleLabel.Parent = header
	
	local subtitleLabel = Instance.new("TextLabel")
	subtitleLabel.Size = UDim2.new(0, 200, 0, 16)
	subtitleLabel.Position = UDim2.new(0, 50, 0, 28)
	subtitleLabel.BackgroundTransparency = 1
	subtitleLabel.Text = config.Subtitle or ""
	subtitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	subtitleLabel.TextTransparency = 0.5
	subtitleLabel.TextSize = 12
	subtitleLabel.Font = Enum.Font.Gotham
	subtitleLabel.TextXAlignment = Enum.TextXAlignment.Left
	subtitleLabel.ZIndex = 2
	subtitleLabel.Parent = header
	
	local fpsCounter = Instance.new("TextLabel")
	fpsCounter.Size = UDim2.new(0, 100, 0, 18)
	fpsCounter.Position = UDim2.new(0.5, -50, 0, 8)
	fpsCounter.BackgroundTransparency = 1
	fpsCounter.Text = "FPS: 60"
	fpsCounter.TextColor3 = colorfulLetters and themeColor or Color3.fromRGB(255, 255, 255)
	fpsCounter.TextSize = 13
	fpsCounter.Font = Enum.Font.GothamBold
	fpsCounter.ZIndex = 2
	fpsCounter.Parent = header
	
	local runningTime = Instance.new("TextLabel")
	runningTime.Size = UDim2.new(0, 150, 0, 16)
	runningTime.Position = UDim2.new(0.5, -75, 0, 28)
	runningTime.BackgroundTransparency = 1
	runningTime.Text = "Running Time: 0s"
	runningTime.TextColor3 = Color3.fromRGB(255, 255, 255)
	runningTime.TextTransparency = 0.5
	runningTime.TextSize = 11
	runningTime.Font = Enum.Font.Gotham
	runningTime.ZIndex = 2
	runningTime.Parent = header
	
	if isSpecialCat then
		themeModule.applyGradient(titleLabel)
		themeModule.applyGradient(fpsCounter)
	end
	
	local startTime = tick()
	task.spawn(function()
		local lastTime = tick()
		local frameCount = 0
		while mainFrame.Parent do
			frameCount = frameCount + 1
			local currentTime = tick()
			if currentTime - lastTime >= 1 then
				fpsCounter.Text = "FPS: " .. frameCount
				frameCount = 0
				lastTime = currentTime
			end
			
			local elapsed = math.floor(tick() - startTime)
			local hours = math.floor(elapsed / 3600)
			local minutes = math.floor((elapsed % 3600) / 60)
			local seconds = elapsed % 60
			
			if hours > 0 then
				runningTime.Text = string.format("Running Time: %dh %dm %ds", hours, minutes, seconds)
			elseif minutes > 0 then
				runningTime.Text = string.format("Running Time: %dm %ds", minutes, seconds)
			else
				runningTime.Text = string.format("Running Time: %ds", seconds)
			end
			
			task.wait()
		end
	end)
	
	local closeButton = Instance.new("ImageButton")
	closeButton.Size = UDim2.new(0, 32, 0, 32)
	closeButton.Position = UDim2.new(1, -44, 0, 9)
	closeButton.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
	closeButton.BorderSizePixel = 0
	closeButton.Image = "rbxassetid://113187532560127"
	closeButton.ImageColor3 = themeColor
	closeButton.ZIndex = 2
	closeButton.Parent = header
	
	local closeCorner = Instance.new("UICorner")
	closeCorner.CornerRadius = UDim.new(0, 8)
	closeCorner.Parent = closeButton
	
	local maximizeButton = Instance.new("ImageButton")
	maximizeButton.Size = UDim2.new(0, 32, 0, 32)
	maximizeButton.Position = UDim2.new(1, -84, 0, 9)
	maximizeButton.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
	maximizeButton.BorderSizePixel = 0
	maximizeButton.Image = "rbxassetid://83674583438465"
	maximizeButton.ImageColor3 = themeColor
	maximizeButton.ZIndex = 2
	maximizeButton.Parent = header
	
	local maxCorner = Instance.new("UICorner")
	maxCorner.CornerRadius = UDim.new(0, 8)
	maxCorner.Parent = maximizeButton
	
	local minimizeButton = Instance.new("ImageButton")
	minimizeButton.Size = UDim2.new(0, 32, 0, 32)
	minimizeButton.Position = UDim2.new(1, -124, 0, 9)
	minimizeButton.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
	minimizeButton.BorderSizePixel = 0
	minimizeButton.Image = "rbxassetid://128150517379134"
	minimizeButton.ImageColor3 = themeColor
	minimizeButton.ZIndex = 2
	minimizeButton.Parent = header
	
	local minCorner = Instance.new("UICorner")
	minCorner.CornerRadius = UDim.new(0, 8)
	minCorner.Parent = minimizeButton
	
	local headerSeparator = Instance.new("Frame")
	headerSeparator.Size = UDim2.new(1, -20, 0, 1)
	headerSeparator.Position = UDim2.new(0, 10, 0, 50)
	headerSeparator.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	headerSeparator.BorderSizePixel = 0
	headerSeparator.ZIndex = 1
	headerSeparator.Parent = mainFrame
	
	local contentFrame = Instance.new("Frame")
	contentFrame.Name = "Content"
	contentFrame.Size = UDim2.new(1, 0, 1, -51)
	contentFrame.Position = UDim2.new(0, 0, 0, 51)
	contentFrame.BackgroundTransparency = 1
	contentFrame.ZIndex = 1
	contentFrame.Parent = mainFrame
	
	local tabsFrame = Instance.new("ScrollingFrame")
	tabsFrame.Name = "TabsFrame"
	tabsFrame.Size = UDim2.new(0, 150, 1, -60)
	tabsFrame.Position = UDim2.new(0, 10, 0, 10)
	tabsFrame.BackgroundColor3 = Color3.fromRGB(16, 16, 16)
	tabsFrame.BorderSizePixel = 0
	tabsFrame.ScrollBarThickness = 4
	tabsFrame.ScrollBarImageColor3 = Color3.fromRGB(60, 60, 60)
	tabsFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
	tabsFrame.ZIndex = 2
	tabsFrame.Parent = contentFrame
	
	local tabsCorner = Instance.new("UICorner")
	tabsCorner.CornerRadius = UDim.new(0, 8)
	tabsCorner.Parent = tabsFrame
	
	local tabsList = Instance.new("UIListLayout")
	tabsList.SortOrder = Enum.SortOrder.LayoutOrder
	tabsList.Padding = UDim.new(0, 5)
	tabsList.Parent = tabsFrame
	
	local tabsPadding = Instance.new("UIPadding")
	tabsPadding.PaddingTop = UDim.new(0, 5)
	tabsPadding.PaddingLeft = UDim.new(0, 5)
	tabsPadding.PaddingRight = UDim.new(0, 5)
	tabsPadding.PaddingBottom = UDim.new(0, 5)
	tabsPadding.Parent = tabsFrame
	
	local userProfile = Instance.new("Frame")
	userProfile.Size = UDim2.new(0, 150, 0, 50)
	userProfile.Position = UDim2.new(0, 10, 1, -50)
	userProfile.BackgroundColor3 = Color3.fromRGB(16, 16, 16)
	userProfile.BorderSizePixel = 0
	userProfile.ZIndex = 2
	userProfile.Parent = contentFrame
	
	local profileCorner = Instance.new("UICorner")
	profileCorner.CornerRadius = UDim.new(0, 8)
	profileCorner.Parent = userProfile
	
	local playerName = Instance.new("TextLabel")
	playerName.Size = UDim2.new(1, -40, 0, 15)
	playerName.Position = UDim2.new(0, 35, 0, 10)
	playerName.BackgroundTransparency = 1
	playerName.Text = Players.LocalPlayer.Name
	playerName.TextColor3 = Color3.fromRGB(255, 255, 255)
	playerName.TextSize = 13
	playerName.Font = Enum.Font.GothamBold
	playerName.TextXAlignment = Enum.TextXAlignment.Left
	playerName.TextTruncate = Enum.TextTruncate.AtEnd
	playerName.ZIndex = 3
	playerName.Parent = userProfile
	
	local playerDisplayName = Instance.new("TextLabel")
	playerDisplayName.Size = UDim2.new(1, -40, 0, 12)
	playerDisplayName.Position = UDim2.new(0, 35, 0, 26)
	playerDisplayName.BackgroundTransparency = 1
	playerDisplayName.Text = Players.LocalPlayer.DisplayName
	playerDisplayName.TextColor3 = Color3.fromRGB(255, 255, 255)
	playerDisplayName.TextTransparency = 0.5
	playerDisplayName.TextSize = 11
	playerDisplayName.Font = Enum.Font.Gotham
	playerDisplayName.TextXAlignment = Enum.TextXAlignment.Left
	playerDisplayName.TextTruncate = Enum.TextTruncate.AtEnd
	playerDisplayName.ZIndex = 3
	playerDisplayName.Parent = userProfile
	
	local playerAvatar = Instance.new("ImageLabel")
	playerAvatar.Size = UDim2.new(0, 28, 0, 28)
	playerAvatar.Position = UDim2.new(0, 5, 0, 11)
	playerAvatar.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	playerAvatar.BorderSizePixel = 0
	playerAvatar.Image = Players:GetUserThumbnailAsync(Players.LocalPlayer.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size48x48)
	playerAvatar.ZIndex = 3
	playerAvatar.Parent = userProfile
	
	local avatarCorner = Instance.new("UICorner")
	avatarCorner.CornerRadius = UDim.new(1, 0)
	avatarCorner.Parent = playerAvatar
	
	local componentsFrame = Instance.new("ScrollingFrame")
	componentsFrame.Size = UDim2.new(1, -180, 1, -20)
	componentsFrame.Position = UDim2.new(0, 170, 0, 10)
	componentsFrame.BackgroundTransparency = 1
	componentsFrame.BorderSizePixel = 0
	componentsFrame.ScrollBarThickness = 4
	componentsFrame.ScrollBarImageColor3 = Color3.fromRGB(60, 60, 60)
	componentsFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
	componentsFrame.ZIndex = 2
	componentsFrame.Parent = contentFrame
	
	local verticalSeparator = Instance.new("Frame")
	verticalSeparator.Size = UDim2.new(0, 1, 1, -20)
	verticalSeparator.Position = UDim2.new(0, 165, 0, 10)
	verticalSeparator.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	verticalSeparator.BorderSizePixel = 0
	verticalSeparator.ZIndex = 2
	verticalSeparator.Parent = contentFrame
	
	local resizeHandle = Instance.new("ImageButton")
	resizeHandle.Size = UDim2.new(0, 20, 0, 20)
	resizeHandle.Position = UDim2.new(1, -20, 1, -20)
	resizeHandle.BackgroundTransparency = 1
	resizeHandle.Image = "rbxassetid://87242330210229"
	resizeHandle.ImageColor3 = themeColor
	resizeHandle.ZIndex = 10
	resizeHandle.Parent = mainFrame
	
	if config.FloatingButton and config.FloatingButton.Enabled then
		local floatingButton = Instance.new("ImageButton")
		floatingButton.Size = config.FloatingButton.Size or UDim2.new(0, 60, 0, 60)
		floatingButton.Position = config.FloatingButton.Position or UDim2.new(0, 20, 0, 100)
		floatingButton.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
		floatingButton.BorderSizePixel = 0
		floatingButton.Image = config.FloatingButton.Icon or ""
		floatingButton.ImageColor3 = Color3.fromRGB(255, 255, 255)
		floatingButton.ScaleType = Enum.ScaleType.Fit
		floatingButton.ZIndex = 10
		floatingButton.Parent = screenGui
		
		local floatingCorner = Instance.new("UICorner")
		if config.FloatingButton.Shape == "circle" then
			floatingCorner.CornerRadius = UDim.new(1, 0)
		else
			floatingCorner.CornerRadius = UDim.new(0, 12)
		end
		floatingCorner.Parent = floatingButton
		
		local floatingPadding = Instance.new("UIPadding")
		floatingPadding.PaddingTop = UDim.new(0, 10)
		floatingPadding.PaddingBottom = UDim.new(0, 10)
		floatingPadding.PaddingLeft = UDim.new(0, 10)
		floatingPadding.PaddingRight = UDim.new(0, 10)
		floatingPadding.Parent = floatingButton
		
		floatingButton.MouseButton1Click:Connect(function()
			if mainFrame.Visible then
				mainFrame.Visible = false
			else
				mainFrame.Visible = true
			end
		end)
	end
	
	UserInputService.InputBegan:Connect(function(input, gameProcessed)
		if not gameProcessed then
			if input.KeyCode == Enum.KeyCode.LeftAlt or input.KeyCode == Enum.KeyCode.LeftControl then
				if mainFrame.Visible then
					mainFrame.Visible = false
					notifySystem.send({
						Title = "Interface Hidden",
						Text = 'Press "Alt" or "Control" to reopen the interface.',
						Duration = 3
					})
				else
					mainFrame.Visible = true
				end
			end
		end
	end)
	
	_G.makeDraggable(mainFrame, header)
	
	local MIN_WIDTH, MIN_HEIGHT = 400, 300
	local MAX_WIDTH, MAX_HEIGHT = 900, 600
	local resizing, resizeStart, startSize = false, nil, nil
	
	resizeHandle.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			resizing = true
			resizeStart = input.Position
			startSize = mainFrame.Size
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					resizing = false
				end
			end)
		end
	end)
	
	UserInputService.InputChanged:Connect(function(input)
		if resizing and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
			local delta = input.Position - resizeStart
			local newWidth = math.clamp(startSize.X.Offset + delta.X, MIN_WIDTH, MAX_WIDTH)
			local newHeight = math.clamp(startSize.Y.Offset + delta.Y, MIN_HEIGHT, MAX_HEIGHT)
			mainFrame.Size = UDim2.new(0, newWidth, 0, newHeight)
		end
	end)
	
	closeButton.MouseEnter:Connect(function()
		_G.createTween(closeButton, {BackgroundColor3 = Color3.fromRGB(220, 50, 50)}, 0.2):Play()
	end)
	
	closeButton.MouseLeave:Connect(function()
		_G.createTween(closeButton, {BackgroundColor3 = Color3.fromRGB(22, 22, 22)}, 0.2):Play()
	end)
	
	closeButton.MouseButton1Click:Connect(function()
		_G.createTween(closeButton, {Size = UDim2.new(0, 28, 0, 28)}, 0.1):Play()
		wait(0.1)
		_G.createTween(closeButton, {Size = UDim2.new(0, 32, 0, 32)}, 0.1):Play()
		screenGui:Destroy()
	end)
	
	local isMaximized = false
	local originalSize = mainFrame.Size
	local originalPosition = mainFrame.Position
	
	maximizeButton.MouseButton1Click:Connect(function()
		_G.createTween(maximizeButton, {Size = UDim2.new(0, 28, 0, 28)}, 0.1):Play()
		wait(0.1)
		_G.createTween(maximizeButton, {Size = UDim2.new(0, 32, 0, 32)}, 0.1):Play()
		
		if not isMaximized then
			originalSize = mainFrame.Size
			originalPosition = mainFrame.Position
			_G.createTween(mainFrame, {Size = UDim2.new(1, 0, 1, 0), Position = UDim2.new(0, 0, 0, 0)}, 0.3, Enum.EasingStyle.Quart):Play()
			isMaximized = true
		else
			_G.createTween(mainFrame, {Size = originalSize, Position = originalPosition}, 0.3, Enum.EasingStyle.Quart):Play()
			isMaximized = false
		end
	end)
	
	minimizeButton.MouseButton1Click:Connect(function()
		_G.createTween(minimizeButton, {Size = UDim2.new(0, 28, 0, 28)}, 0.1):Play()
		wait(0.1)
		_G.createTween(minimizeButton, {Size = UDim2.new(0, 32, 0, 32)}, 0.1):Play()
		mainFrame.Visible = false
	end)
	
	window.screenGui = screenGui
	window.mainFrame = mainFrame
	window.componentsFrame = componentsFrame
	window.tabsFrame = tabsFrame
	window.themeColor = themeColor
	window.colorfulLetters = colorfulLetters
	window.isSpecialCat = isSpecialCat
	
	tabsList:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
		tabsFrame.CanvasSize = UDim2.new(0, 0, 0, tabsList.AbsoluteContentSize.Y + 10)
	end)
	
	window.currentSelectedTab = nil
	
	function window:Notify(config)
		notifySystem.send(config)
	end
	
	function window:CreateTab(config)
		return loadstring(game:HttpGet("https://raw.githubusercontent.com/realcath/lab/refs/heads/main/cat/libary/components/tab.lua"))()(self, config)
	end
	
	return window
end

return module
