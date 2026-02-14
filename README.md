# Catlib

- https://discord.gg/cathub

<img src="visual/banner.gif" alt="banner">

- Load UI

```lua
local CatLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/realcath/lab/refs/heads/main/cat/libary/catlibz"))()
```

#

- Create Window

```lua
local window = CatLib:CreateWindow({
	Title = "My Hub",
	Subtitle = "By zerozxk",
	Icon = "rbxassetid://",
	Size = UDim2.new(0, 500, 0, 300),
	FloatingButton = {
		Enabled = true,
		Icon = "rbxassetid://",
		Size = UDim2.new(0, 60, 0, 60),
		Position = UDim2.new(0, 20, 0, 100),
		Shape = "Square"
	}
})
```

#

- Create Tab

```lua
local tab = window:CreateTab({
	Name = "Main",
	Title = "Main",
	Subtitle = "Main features",
	Icon = "rbxassetid://"
})
```

#

- Create Section

```lua
tab:AddSection("Tab")
```

#

- Create Notify

```lua
window:Notify({
	Title = "Welcome!",
	Text = "CatLib loaded successfully",
	Duration = 5
})
```

#

- Create Toggle

```lua
tab:AddToggle({
	Name = "Toggle",
    Description = "My Toggle",
	Default = false,
	Callback = function(value)
	end
})
```

<img src="visual/toggle.png" alt="toggle">

#

- Create ToggleConfirmation

```lua
tab:AddToggleConfirmation({
	Name = "Toggle Confirmation",
	Callback = function(value)
	end
})
```

<img src="visual/togglecom.png" alt="togglecom">

#

- Create Button

```lua
tab:AddButton({
	Name = "Button Example",
	Callback = function()
	end
})
```

<img src="visual/button.png" alt="button">

#

- Create ButtonConfirmation

```lua
tab:AddButtonConfirmation({
	Name = "Button Confirmation",
	Callback = function()
	end
})
