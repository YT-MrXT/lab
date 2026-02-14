local module = {}

function module:new(window, config)
	local tab = {}
	
	local tabButton = Instance.new("TextButton")
	tabButton.Name = config.Name or "Tab"
	tabButton.Size = UDim2.new(1, -10, 0, 50)
	tabButton.BackgroundColor3 = Color3.fromRGB(16, 16, 16)
	tabButton.BorderSizePixel = 0
	tabButton.AutoButtonColor = false
	tabButton.Text = ""
	tabButton.ZIndex = 3
	tabButton.Parent = window.tabsFrame
	
	local tabCorner = Instance.new("UICorner")
	tabCorner.CornerRadius = UDim.new(0, 8)
	tabCorner.Parent = tabButton
	
	local selectionBar = Instance.new("Frame")
	selectionBar.Name = "SelectionBar"
	selectionBar.Size = UDim2.new(0, 0, 0, 30)
	selectionBar.Position = UDim2.new(0, 5, 0.5, -15)
	selectionBar.BackgroundColor3 = window.themeColor
	selectionBar.BorderSizePixel = 0
	selectionBar.ZIndex = 4
	selectionBar.Parent = tabButton
	
	local selectionCorner = Instance.new("UICorner")
	selectionCorner.CornerRadius = UDim.new(1, 0)
	selectionCorner.Parent = selectionBar
	
	local tabIcon = Instance.new("ImageLabel")
	tabIcon.Size = UDim2.new(0, 32, 0, 32)
	tabIcon.Position = UDim2.new(0, 15, 0, 9)
	tabIcon.BackgroundTransparency = 1
	tabIcon.Image = config.Icon or ""
	tabIcon.ImageColor3 = window.themeColor
	tabIcon.ZIndex = 4
	tabIcon.Parent = tabButton
	
	local tabTitle = Instance.new("TextLabel")
	tabTitle.Size = UDim2.new(1, -55, 0, 18)
	tabTitle.Position = UDim2.new(0, 52, 0, 8)
	tabTitle.BackgroundTransparency = 1
	tabTitle.Text = config.Title or "Tab"
	tabTitle.TextColor3 = window.colorfulLetters and window.themeColor or Color3.fromRGB(255, 255, 255)
	tabTitle.TextSize = 13
	tabTitle.Font = Enum.Font.GothamBold
	tabTitle.TextXAlignment = Enum.TextXAlignment.Left
	tabTitle.TextTruncate = Enum.TextTruncate.AtEnd
	tabTitle.TextScaled = false
	tabTitle.ZIndex = 4
	tabTitle.Parent = tabButton
	
	local tabSubtitle = Instance.new("TextLabel")
	tabSubtitle.Size = UDim2.new(1, -55, 0, 14)
	tabSubtitle.Position = UDim2.new(0, 52, 0, 27)
	tabSubtitle.BackgroundTransparency = 1
	tabSubtitle.Text = config.Subtitle or ""
	tabSubtitle.TextColor3 = Color3.fromRGB(255, 255, 255)
	tabSubtitle.TextTransparency = 0.6
	tabSubtitle.TextSize = 11
	tabSubtitle.Font = Enum.Font.Gotham
	tabSubtitle.TextXAlignment = Enum.TextXAlignment.Left
	tabSubtitle.TextTruncate = Enum.TextTruncate.AtEnd
	tabSubtitle.TextScaled = false
	tabSubtitle.ZIndex = 4
	tabSubtitle.Parent = tabButton
	
	if tabTitle.TextFits == false then
		tabTitle.TextScaled = true
	end
	
	if tabSubtitle.TextFits == false then
		tabSubtitle.TextScaled = true
	end
	
	local tabContainer = Instance.new("ScrollingFrame")
	tabContainer.Name = config.Name or "TabContainer"
	tabContainer.Size = UDim2.new(1, 0, 1, 0)
	tabContainer.BackgroundTransparency = 1
	tabContainer.BorderSizePixel = 0
	tabContainer.ScrollBarThickness = 4
	tabContainer.ScrollBarImageColor3 = Color3.fromRGB(60, 60, 60)
	tabContainer.CanvasSize = UDim2.new(0, 0, 0, 0)
	tabContainer.Visible = false
	tabContainer.ZIndex = 3
	tabContainer.Parent = window.componentsFrame
	
	local tabLayout = Instance.new("UIListLayout")
	tabLayout.SortOrder = Enum.SortOrder.LayoutOrder
	tabLayout.Padding = UDim.new(0, 8)
	tabLayout.Parent = tabContainer
	
	local tabPadding = Instance.new("UIPadding")
	tabPadding.PaddingTop = UDim.new(0, 8)
	tabPadding.PaddingLeft = UDim.new(0, 8)
	tabPadding.PaddingRight = UDim.new(0, 8)
	tabPadding.PaddingBottom = UDim.new(0, 8)
	tabPadding.Parent = tabContainer
	
	tabLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
		tabContainer.CanvasSize = UDim2.new(0, 0, 0, tabLayout.AbsoluteContentSize.Y + 16)
	end)
	
	tabButton.MouseButton1Click:Connect(function()
		if window.currentSelectedTab then
			if window.currentSelectedTab.Container == tabContainer then
				return
			end
			
			_G.createTween(window.currentSelectedTab.Button, {BackgroundColor3 = Color3.fromRGB(16, 16, 16)}, 0.25, Enum.EasingStyle.Quart):Play()
			_G.createTween(window.currentSelectedTab.Bar, {Size = UDim2.new(0, 0, 0, 30)}, 0.25, Enum.EasingStyle.Quart):Play()
			
			window.currentSelectedTab.Container.Position = UDim2.new(0, 0, 0, 0)
			_G.createTween(window.currentSelectedTab.Container, {Position = UDim2.new(-1, 0, 0, 0)}, 0.35, Enum.EasingStyle.Quart):Play()
			task.wait(0.35)
			window.currentSelectedTab.Container.Visible = false
		end
		
		_G.createTween(tabButton, {BackgroundColor3 = Color3.fromRGB(20, 20, 20)}, 0.25, Enum.EasingStyle.Quart):Play()
		_G.createTween(selectionBar, {Size = UDim2.new(0, 3, 0, 30)}, 0.25, Enum.EasingStyle.Quart):Play()
		
		tabContainer.Position = UDim2.new(1, 0, 0, 0)
		tabContainer.Visible = true
		_G.createTween(tabContainer, {Position = UDim2.new(0, 0, 0, 0)}, 0.35, Enum.EasingStyle.Quart):Play()
		
		window.currentSelectedTab = {
			Button = tabButton,
			Bar = selectionBar,
			Container = tabContainer
		}
	end)
	
	tab.Container = tabContainer
	tab.Button = tabButton
	tab.window = window
	
	function tab:AddSection(text)
		return loadstring(game:HttpGet("https://raw.githubusercontent.com/realcath/lab/refs/heads/main/cat/libary/components/misc.lua"))().createSection(self, text)
	end
	
	function tab:AddToggle(config)
		return loadstring(game:HttpGet("https://raw.githubusercontent.com/realcath/lab/refs/heads/main/cat/libary/components/toggle.lua"))().createToggle(self, config)
	end
	
	function tab:AddToggleConfirmation(config)
		return loadstring(game:HttpGet("https://raw.githubusercontent.com/realcath/lab/refs/heads/main/cat/libary/components/toggle.lua"))().createToggleConfirmation(self, config)
	end
	
	function tab:AddButton(config)
		return loadstring(game:HttpGet("https://raw.githubusercontent.com/realcath/lab/refs/heads/main/cat/libary/components/button.lua"))().createButton(self, config)
	end
	
	function tab:AddButtonConfirmation(config)
		return loadstring(game:HttpGet("https://raw.githubusercontent.com/realcath/lab/refs/heads/main/cat/libary/components/button.lua"))().createButtonConfirmation(self, config)
	end
	
	function tab:AddSlider(config)
		return loadstring(game:HttpGet("https://raw.githubusercontent.com/realcath/lab/refs/heads/main/cat/libary/components/slider.lua"))().createSlider(self, config)
	end
	
	function tab:AddTextBox(config)
		return loadstring(game:HttpGet("https://raw.githubusercontent.com/realcath/lab/refs/heads/main/cat/libary/components/misc.lua"))().createTextBox(self, config)
	end
	
	function tab:AddDropdown(config)
		return loadstring(game:HttpGet("https://raw.githubusercontent.com/realcath/lab/refs/heads/main/cat/libary/components/dropdown.lua"))().createDropdown(self, config)
	end
	
	function tab:AddMultiDropdown(config)
		return loadstring(game:HttpGet("https://raw.githubusercontent.com/realcath/lab/refs/heads/main/cat/libary/components/dropdown.lua"))().createMultiDropdown(self, config)
	end
	
	function tab:AddParagraph(config)
		return loadstring(game:HttpGet("https://raw.githubusercontent.com/realcath/lab/refs/heads/main/cat/libary/components/misc.lua"))().createParagraph(self, config)
	end
	
	function tab:AddDiscordInvite(config)
		return loadstring(game:HttpGet("https://raw.githubusercontent.com/realcath/lab/refs/heads/main/cat/libary/components/misc.lua"))().createDiscordInvite(self, config)
	end
	
	return tab
end

return setmetatable(module, {
	__call = function(self, ...)
		return self:new(...)
	end
})
