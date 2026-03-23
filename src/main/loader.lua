local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local allowedPlaceIds = {
    14890802310,
    74747090658891,
    77747658251236
}
local scripts = {
    [14890802310] = "https://raw.githubusercontent.com/realcath/lab/refs/heads/main/src/main/x/y/z/BizarreLineage.lua",
    [74747090658891] = "https://raw.githubusercontent.com/realcath/lab/refs/heads/main/src/main/x/y/z/BizarreLineage.lua",
    [77747658251236] = "https://raw.githubusercontent.com/realcath/lab/refs/heads/main/src/main/x/y/z/SailorPiece.lua",
}
local scriptUrl = scripts[game.PlaceId]
if scriptUrl then
    loadstring(game:HttpGet(scriptUrl))()
else
    if LocalPlayer then
        LocalPlayer:Kick("Game is not supported")
    end
end
