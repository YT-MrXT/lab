local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local allowedPlaceIds = {
    14890802310,
    74747090658891
}

local isAllowed = false

for _, id in ipairs(allowedPlaceIds) do
    if game.PlaceId == id then
        isAllowed = true
        break
    end
end

if isAllowed then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/realcath/lab/refs/heads/main/src/main/x/y/z/BizarreLineage.lua"))()
else
    if LocalPlayer then
        LocalPlayer:Kick("Game is not supported")
    end
end
