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
```

<img src="visual/buttoncom.png" alt="buttoncom">

#

- Create TextBox

```lua
tab:AddTextBox({
	Name = "TextBox Example",
	Placeholder = "Enter your name...",
	Default = "",
	Callback = function(text)
	end
})
```

<img src="visual/textbox.png" alt="textbox">

#

- Create Slider

```lua
tab:AddSlider({
	Name = "Slider Example",
	Min = 0,
	Max = 100,
	Default = 50,
	Callback = function(value)
	end
})
```

<img src="visual/slider.png" alt="slider">

#

- Create Dropdown

```lua
tab:AddDropdown({
	Name = "Dropdown Example",
	Options = {"Option 1", "Option 2", "Option 3"},
	Default = "Option 1",
	Callback = function(option)
	end
})
```

<img src="visual/drop.png" alt="drop">

#

- Create MultiDropdown

```lua
tab:AddMultiDropdown({
	Name = "Multi Dropdown",
	Options = {"Item 1", "Item 2", "Item 3"},
	Default = {},
	Callback = function(options)
	end
})
```

<img src="visual/multidrop.png" alt="multidrop">

#

- Create Paragraph

```lua
tab:AddParagraph({
	Title = "Paragraph Title",
	Text = "This is paragraph text"
})
```

<img src="visual/paragraph.png" alt="paragraph">

#

- Create DiscordInvite

```lua
tab:AddDiscordInvite({
	Icon = "rbxassetid://",
	ServerName = "My Discord Server",
	Link = "discord.gg/example",
})
```

<img src="visual/invite.png" alt="invite">

# Example of use

```lua
local CatLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/realcath/lab/refs/heads/main/libary/catlibyz"))()

local window = CatLib:CreateWindow({
	Title = "My Hub",
	Subtitle = "By zerozxk",
	Icon = "rbxassetid://107996107689218",
	Size = UDim2.new(0, 500, 0, 300),
	Theme = "SpecialCat", -- Blue, Red, Yellow, Green, Purple, Orange, Brown, Grey, SpecialCat, Stormx, Midnight
	ColorfulLetters = true,
	ThemeBackground = false, -- true = fundo da janela na cor do tema
	ThemeTab = false, -- true = fundo da sidebar na cor do tema
	FloatingButton = {
		Enabled = true,
		Icon = "rbxassetid://107996107689218",
		Size = UDim2.new(0, 60, 0, 60),
		Position = UDim2.new(0, 20, 0, 100),
		Shape = "square", -- "square" or "circle"
		-- BackgroundColor = Color3.fromRGB(20, 20, 20) -- omit for transparent background
	}
})

local tab = window:CreateTab({
	Name = "Main",
	Title = "Main",
	Subtitle = "Main features",
	Icon = "rbxassetid://107996107689218"
})

tab:AddSectionTab()

local tab = window:CreateTab({
	Name = "Main",
	Title = "Main",
	Subtitle = "Main features",
	Icon = "rbxassetid://107996107689218"
})

window:Notify({
	Title = "Welcome!",
	Text = "CatLib loaded successfully",
	Duration = 5
})

tab:AddSection("Settings")

tab:AddToggle({
	Name = "Toggle Example",
	Description = "This is a toggle with description",
	Default = false,
	Callback = function(value)

	end
})

tab:AddToggleConfirmation({
	Name = "Toggle Confirmation",
	Description = "Requires confirmation to enable",
	Default = false,
	Callback = function(value)

	end
})

tab:AddButton({
	Name = "Send Notification",
	Callback = function()
		window:Notify({
			Title = "Test Notification",
			Text = "This is a test notification!",
			Duration = 5
		})
	end
})

tab:AddButtonConfirmation({
	Name = "Button Confirmation",
	Callback = function()

	end
})

tab:AddTextBox({
	Name = "TextBox Example",
	Placeholder = "Enter your name...",
	Default = "",
	Callback = function(text)

	end
})

tab:AddSlider({
	Name = "Slider Example",
	Min = 0,
	Max = 100,
	Default = 50,
	Callback = function(value)

	end
})

tab:AddDropdown({
	Name = "Dropdown Example",
	Options = {"Option 1", "Option 2", "Option 3"},
	Default = "Option 1",
	Callback = function(option)

	end
})

tab:AddMultiDropdown({
	Name = "Multi Dropdown",
	Options = {"Item 1", "Item 2", "Item 3"},
	Default = {},
	Callback = function(options)

	end
})

tab:AddParagraph({
	Title = "Paragraph Title",
	Text = "This is a paragraph with some example text to demonstrate the component."
})

tab:AddParagraph({
	Icon = "rbxassetid://107996107689218", -- large icon displayed before title and text
	Title = "Paragraph with Icon",
	Text = "This paragraph has a large icon on the left side."
})

tab:AddDiscordInvite({
    Icon = "rbxassetid://107996107689218",
    Banner = "rbxassetid://107996107689218", -- opcional
    ServerName = "Meu Servidor",
    Link = "discord.gg/exemplo"
})
```
