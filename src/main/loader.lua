local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local PlaceId = game.PlaceId

local Games = {
    BizarreLineage = {
        14890802310,
        74747090658891
    },

    SailorPiece = {
        77747658251236,
        138368689293913,
        96767841099256,
        75159314259063,
        99684056491472,
        123955125827131
    },

    BloxFruits = {
        2753915549,
        85211729168715,
        4442272183,
        79091703265657,
        7449423635,
        100117331123089
    }
}

local Loaders = {
    BizarreLineage = "https://raw.githubusercontent.com/realcath/lab/refs/heads/main/src/main/x/y/z/BizarreLineage.lua",
    SailorPiece = "https://raw.githubusercontent.com/realcath/lab/refs/heads/main/src/main/x/y/z/SailorPiece.lua",
    BloxFruits = "https://raw.githubusercontent.com/realcath/lab/refs/heads/main/src/main/x/y/z/BloxFruits.lua"
}

local function IsInGame(list)
    for _, id in ipairs(list) do
        if id == PlaceId then
            return true
        end
    end
    return false
end

for gameName, ids in pairs(Games) do
    if IsInGame(ids) then
        local url = Loaders[gameName]
        if url then
            loadstring(game:HttpGet(url))()
            break
        end
    end
end
