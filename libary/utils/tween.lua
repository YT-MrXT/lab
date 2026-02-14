local TweenService = game:GetService("TweenService")

local module = {}

function module.createTween(instance, properties, duration, easingStyle, easingDirection)
	local tweenInfo = TweenInfo.new(
		duration or 0.25,
		easingStyle or Enum.EasingStyle.Quad,
		easingDirection or Enum.EasingDirection.Out
	)
	local tween = TweenService:Create(instance, tweenInfo, properties)
	return tween
end

return module
