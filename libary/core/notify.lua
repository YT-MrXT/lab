local module = {}

function module.create(screenGui, themeColor)
	local notificationContainer = Instance.new("Frame")
	notificationContainer.Name = "NotificationContainer"
	notificationContainer.Size = UDim2.new(0, 320, 1, 0)
	notificationContainer.Position = UDim2.new(1, -340, 0, 0)
	notificationContainer.BackgroundTransparency = 1
	notificationContainer.ZIndex = 1000
	notificationContainer.Parent = screenGui
	
	local notificationLayout = Instance.new("UIListLayout")
	notificationLayout.SortOrder = Enum.SortOrder.LayoutOrder
	notificationLayout.Padding = UDim.new(0, 10)
	notificationLayout.VerticalAlignment = Enum.VerticalAlignment.Bottom
	notificationLayout.Parent = notificationContainer
	
	local notificationPadding = Instance.new("UIPadding")
	notificationPadding.PaddingBottom = UDim.new(0, 20)
	notificationPadding.Parent = notificationContainer
	
	return {
		container = notificationContainer,
		send = function(config)
			task.spawn(function()
				local notifyFrame = Instance.new("Frame")
				notifyFrame.Name = "Notification"
				notifyFrame.Size = UDim2.new(0, 300, 0, 80)
				notifyFrame.Position = UDim2.new(1, 20, 1, 0)
				notifyFrame.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
				notifyFrame.BorderSizePixel = 0
				notifyFrame.LayoutOrder = tick()
				notifyFrame.Parent = notificationContainer
				
				local notifyCorner = Instance.new("UICorner")
				notifyCorner.CornerRadius = UDim.new(0, 10)
				notifyCorner.Parent = notifyFrame
				
				local notifyIcon = Instance.new("ImageLabel")
				notifyIcon.Size = UDim2.new(0, 24, 0, 24)
				notifyIcon.Position = UDim2.new(0, 12, 0, 12)
				notifyIcon.BackgroundTransparency = 1
				notifyIcon.Image = "rbxassetid://85051593348488"
				notifyIcon.ImageColor3 = themeColor
				notifyIcon.Parent = notifyFrame
				
				local notifyTitle = Instance.new("TextLabel")
				notifyTitle.Size = UDim2.new(1, -50, 0, 20)
				notifyTitle.Position = UDim2.new(0, 42, 0, 10)
				notifyTitle.BackgroundTransparency = 1
				notifyTitle.Text = config.Title or "Notification"
				notifyTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
				notifyTitle.TextSize = 14
				notifyTitle.Font = Enum.Font.GothamBold
				notifyTitle.TextXAlignment = Enum.TextXAlignment.Left
				notifyTitle.TextTruncate = Enum.TextTruncate.AtEnd
				notifyTitle.Parent = notifyFrame
				
				local notifyText = Instance.new("TextLabel")
				notifyText.Size = UDim2.new(1, -50, 0, 30)
				notifyText.Position = UDim2.new(0, 42, 0, 32)
				notifyText.BackgroundTransparency = 1
				notifyText.Text = config.Text or ""
				notifyText.TextColor3 = Color3.fromRGB(255, 255, 255)
				notifyText.TextTransparency = 0.5
				notifyText.TextSize = 12
				notifyText.Font = Enum.Font.Gotham
				notifyText.TextXAlignment = Enum.TextXAlignment.Left
				notifyText.TextYAlignment = Enum.TextYAlignment.Top
				notifyText.TextWrapped = true
				notifyText.Parent = notifyFrame
				
				local loadingBar = Instance.new("Frame")
				loadingBar.Size = UDim2.new(1, 0, 0, 3)
				loadingBar.Position = UDim2.new(0, 0, 1, -3)
				loadingBar.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
				loadingBar.BorderSizePixel = 0
				loadingBar.Parent = notifyFrame
				
				local loadingBarFill = Instance.new("Frame")
				loadingBarFill.Size = UDim2.new(1, 0, 1, 0)
				loadingBarFill.BackgroundColor3 = themeColor
				loadingBarFill.BorderSizePixel = 0
				loadingBarFill.Parent = loadingBar
				
				local loadingBarCorner = Instance.new("UICorner")
				loadingBarCorner.CornerRadius = UDim.new(0, 10)
				loadingBarCorner.Parent = loadingBar
				
				local loadingBarFillCorner = Instance.new("UICorner")
				loadingBarFillCorner.CornerRadius = UDim.new(0, 10)
				loadingBarFillCorner.Parent = loadingBarFill
				
				local duration = config.Duration or 3
				local durationText = Instance.new("TextLabel")
				durationText.Size = UDim2.new(0, 40, 0, 15)
				durationText.Position = UDim2.new(0, 5, 1, -18)
				durationText.BackgroundTransparency = 1
				durationText.Text = tostring(duration) .. "s"
				durationText.TextColor3 = Color3.fromRGB(255, 255, 255)
				durationText.TextTransparency = 0.6
				durationText.TextSize = 10
				durationText.Font = Enum.Font.Gotham
				durationText.Parent = notifyFrame
				
				_G.createTween(notifyFrame, {Position = UDim2.new(0, 0, 1, 0)}, 0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out):Play()
				_G.createTween(loadingBarFill, {Size = UDim2.new(0, 0, 1, 0)}, duration, Enum.EasingStyle.Linear):Play()
				
				task.spawn(function()
					local startTime = tick()
					local endTime = startTime + duration
					
					while tick() < endTime do
						local remaining = endTime - tick()
						local seconds = math.floor(remaining)
						local milliseconds = math.floor((remaining - seconds) * 10)
						durationText.Text = string.format("%d.%ds", seconds, milliseconds)
						task.wait(0.1)
					end
					durationText.Text = "0.0s"
				end)
				
				task.wait(duration)
				
				local exitTween = _G.createTween(notifyFrame, {Position = UDim2.new(1, 20, 1, 0)}, 0.35, Enum.EasingStyle.Quart, Enum.EasingDirection.In)
				exitTween:Play()
				exitTween.Completed:Wait()
				notifyFrame:Destroy()
			end)
		end
	}
end

return module
