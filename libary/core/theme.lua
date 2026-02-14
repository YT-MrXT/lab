local module = {}

module.colors = {
	Blue = Color3.fromRGB(13, 105, 172),
	Red = Color3.fromRGB(96, 40, 28),
	Yellow = Color3.fromRGB(245, 205, 48),
	Green = Color3.fromRGB(107, 50, 124),
	Purple = Color3.fromRGB(142, 66, 133),
	Orange = Color3.fromRGB(218, 133, 65),
	Brown = Color3.fromRGB(105, 64, 40),
	Grey = Color3.fromRGB(137, 135, 136)
}

function module.getTheme(themeName)
	if themeName == "SpecialCat" then
		return {
			color = Color3.fromRGB(200, 150, 50),
			isSpecial = true
		}
	elseif module.colors[themeName] then
		return {
			color = module.colors[themeName],
			isSpecial = false
		}
	else
		return {
			color = Color3.fromRGB(255, 255, 255),
			isSpecial = false
		}
	end
end

function module.applyGradient(textLabel)
	local gradient = Instance.new("UIGradient")
	gradient.Color = ColorSequence.new{
		ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 223, 0)),
		ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 165, 0)),
		ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 223, 0))
	}
	gradient.Parent = textLabel
	
	task.spawn(function()
		while textLabel.Parent do
			for i = 0, 1, 0.01 do
				if not textLabel.Parent then break end
				gradient.Offset = Vector2.new(i, 0)
				task.wait(0.03)
			end
			for i = 1, 0, -0.01 do
				if not textLabel.Parent then break end
				gradient.Offset = Vector2.new(i, 0)
				task.wait(0.03)
			end
		end
	end)
end

return module
