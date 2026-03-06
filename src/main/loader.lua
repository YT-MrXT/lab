local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local allowedPlaceIds = {
    2753915549,
    85211729168715,
    4442272183,
    79091703265657,
    7449423635,
    100117331123089,
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
    if game.PlaceId == 14890802310 or game.PlaceId == 74747090658891 then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/realcath/lab/refs/heads/main/src/main/x/y/z/BizarreLineage.lua"))()
    else
        loadstring(game:HttpGet("https://raw.githubusercontent.com/realcath/lab/refs/heads/main/src/main/x/y/z/BloxFruits.lua"))()
    end
else
    if LocalPlayer then
        LocalPlayer:Kick("Game is not supported")
    end
end
